#include <fcntl.h>
#include <unistd.h>
#include <openssl/pem.h>
#include <openssl/rsa.h>
#include <openssl/sha.h>
#include <string.h>
#include <stdlib.h>

#include "common_def.h"
#include "Signature.h"
#include "oem.h"

/* new */
Signature::Signature(const char *privateKeyPem, const char *dest)
{
	this->privateKeyPem 	= privateKeyPem;
	this->dest 		= dest;
}

/* release */
Signature::~Signature()
{
	// do nothing
}

/* 
 * read data and gen signature 
 * the signature is of static size, no need to use StoreConfigData::store()
 * !!! but make sure the StoreConfigData is release before doing Signature::genSignature() !!!
 */
int Signature::genSignature()
{
	FILE 		*privateKeyPemFile;
	FILE 		*dataFile;
	RSA 		*rsaPrivateKey;
	SHA_CTX 	shaCtx;
	uint8 		buffer[BUFFER_SIZE];
	uint8		*signature;
	uint8		md[SHA_DIGEST_LENGTH];
	uint32 		sigLen = 0;
	size_t 		readLen = 0;

	ASSERT(privateKeyPem);
	ASSERT(dest);

	/* read data and run sha1 */
	#ifdef DEBUG
	fprintf(stdout, "run sha1 of file %s\n", dest);
	#endif
	// get data file handler
	dataFile 			= fopen(dest, "r+b");
	ASSERT(dataFile);
	// init sha1
	ASSERT(SHA1_Init(&shaCtx));
	// update sha1 data
	while ((readLen = fread((void*)buffer, 1, BUFFER_SIZE, dataFile)) > 0)
	{
		ASSERT(SHA1_Update(&shaCtx, buffer, readLen));
	}
	// get sha1 md
	ASSERT(SHA1_Final(md, &shaCtx));
	// close the data file handler
	fclose(dataFile);

	/* gen rsa signature */
	#ifdef DEBUG
	fprintf(stdout, "run rsa signature\n");
	#endif
	// get the pem file handler
	privateKeyPemFile 		= fopen(privateKeyPem, "r");
	ASSERT(privateKeyPemFile);
	// parse pem
	rsaPrivateKey 			= PEM_read_RSAPrivateKey(privateKeyPemFile, NULL, NULL, NULL);
	ASSERT(rsaPrivateKey);
	// based on the rsa source code, it will infinite loop while rsa_sign in RSA is NOT NULL
	if (rsaPrivateKey->meth)
	{
		ASSERT(!rsaPrivateKey->meth->rsa_sign);
	}
	// close the pem file handler
	fclose(privateKeyPemFile);
	// malloc buffer
	signature 			= (uint8*)malloc(RSA_size(rsaPrivateKey));
	ASSERT(signature);
	// get signature
	ASSERT(RSA_sign(NID_sha1, md, SHA_DIGEST_LENGTH, signature, &sigLen, rsaPrivateKey));

	/* store the signature in data file from tail */
	#ifdef DEBUG
	fprintf(stdout, "write rsa signature %d byte in file %s tail\n", sigLen, dest);
	#endif
	// get data file handler and append
	dataFile 			= fopen(dest, "a+b");
	ASSERT(dataFile);
	// write uint8 signature magic
	buffer[0] 			= SIG_MAGIC;
	ASSERT(fwrite(buffer, 1, 1, dataFile));
	// write uint32 signature length
	ASSERT(fwrite(&sigLen, sizeof(uint32), 1, dataFile));
	// write signature data
	ASSERT(fwrite(signature, sigLen, 1, dataFile));
	// free signature
	free(signature);
	// close the data file handler
	fclose(dataFile);

	return 0;
}

/* verify the signature */
int Signature::verify(uint32 offset, const char *publicKeyPem)
{
	FILE 		*publicKeyPemFile;
	FILE 		*dataFile;
	RSA 		*rsaPublicKey;
	SHA_CTX 	shaCtx;
	uint8 		buffer[BUFFER_SIZE];
	uint8		*signature;
	uint8		md[SHA_DIGEST_LENGTH];
	uint8		magic 	= 0;
	uint32 		sigLen 	= 0;

	ASSERT(publicKeyPem);
	ASSERT(dest);

	/* read data and run sha1 */
	// get data file handler
	dataFile 			= fopen(dest, "r+b");
	ASSERT(dataFile);
	// init sha1
	ASSERT(SHA1_Init(&shaCtx));
	// update sha1 data
	do
	{
		uint32 readLen = offset > BUFFER_SIZE? BUFFER_SIZE: offset;
		ASSERT(fread((void*)buffer, 1, readLen, dataFile));
		offset -= readLen;
		ASSERT(SHA1_Update(&shaCtx, buffer, readLen));
	} while (0 < offset);
	// get sha1 md
	ASSERT(SHA1_Final(md, &shaCtx));
	/* get rsa signature */
	// get the pem file handler
	publicKeyPemFile 		= fopen(publicKeyPem, "r");
	ASSERT(publicKeyPemFile);
	// parse pem
	rsaPublicKey 			= PEM_read_RSA_PUBKEY(publicKeyPemFile, NULL, NULL, NULL);
	ASSERT(rsaPublicKey);
	// based on the rsa source code, it will infinite loop while rsa_sign in RSA is NOT NULL
	if (rsaPublicKey->meth)
	{
		ASSERT(!rsaPublicKey->meth->rsa_verify);
	}
	// close the pem file handler
	fclose(publicKeyPemFile);
	// get signature magic
	ASSERT(fread((void*)&magic, sizeof(uint8), 1, dataFile));
	ASSERT(SIG_MAGIC == magic);
	// get signature size in data, emmmm... is there any endian problem?
	ASSERT(fread((void*)&sigLen, sizeof(uint32), 1, dataFile));
	// malloc buffer
	signature 			= (uint8*)malloc(sigLen);
	ASSERT(signature);
	// get signature
	ASSERT(fread((void*)signature, sigLen, 1, dataFile));
	ASSERT(RSA_verify(NID_sha1, md, SHA_DIGEST_LENGTH, signature, sigLen, rsaPublicKey));
	// free signature
	free(signature);
	// close the data file handler
	fclose(dataFile);

	return 0;
}

/* uint32 value fix endian */
uint32 Signature::fixEndian(uint32 src, uint8 bigEndian)
{
	uint32 	value 		= src;
	uint8 	*vPtr 		= (uint8*)&value;

	/* check endian */
	uint32 	check32 	= 0x12345678;
	uint8  	check8 		= *((uint8*)(&check32));

	if (bigEndian != (check8 == 0x12))
	{
		// exchange 0, 3
		uint8 temp 	= *vPtr;
		*vPtr 		= *(vPtr + 3);
		*(vPtr + 3) 	= temp;

		// exchange 1, 2
		temp 		= *(vPtr + 1);
		*(vPtr + 1) 	= *(vPtr + 2);
		*(vPtr + 2) 	= temp;
	}

	return value;
}

/* run test suit */
void Signature::runTestSuit(const char *publicKeyPem)
{
	FILE 		*keyPemFile;
	RSA 		*rsaKey;
	SHA_CTX 	shaCtx;
	uint8 		buffer[BUFFER_SIZE];
	uint8		*signature;
	uint8		md[SHA_DIGEST_LENGTH];
	uint32 		sigLen = 0;

	// init buffer
	memset(buffer, 0xAA, BUFFER_SIZE/2);
	memset(buffer + BUFFER_SIZE/2, 0x55, BUFFER_SIZE/2);
	// init sha1
	ASSERT(SHA1_Init(&shaCtx));
	// update sha1 data
	ASSERT(SHA1_Update(&shaCtx, buffer, BUFFER_SIZE));
	// get sha1 md
	ASSERT(SHA1_Final(md, &shaCtx));
	// get pem
	keyPemFile 			= fopen(privateKeyPem, "r");
	ASSERT(keyPemFile);
	// parse pem
	rsaKey 				= PEM_read_RSAPrivateKey(keyPemFile, NULL, NULL, NULL);
	ASSERT(rsaKey);
	// based on the rsa source code, it will infinite loop while rsa_sign/rsa_verify in RSA is NOT NULL
	if (rsaKey->meth)
	{
		ASSERT(!rsaKey->meth->rsa_sign);
	}
	// close the pem file handler
	fclose(keyPemFile);
	// malloc buffer
	signature 			= (uint8*)malloc(RSA_size(rsaKey));
	ASSERT(signature);
	// get signature
	ASSERT(RSA_sign(NID_sha1, md, SHA_DIGEST_LENGTH, signature, &sigLen, rsaKey));
	// get public key
	keyPemFile 			= fopen(publicKeyPem, "r");
	ASSERT(keyPemFile);
	// parse pem
	rsaKey 				= PEM_read_RSA_PUBKEY(keyPemFile, NULL, NULL, NULL);
	ASSERT(rsaKey);
	// based on the rsa source code, it will infinite loop while rsa_sign/rsa_verify in RSA is NOT NULL
	if (rsaKey->meth)
	{
		ASSERT(!rsaKey->meth->rsa_verify);
	}
	// close the pem file handler
	fclose(keyPemFile);
	// verify signature
	ASSERT(RSA_verify(NID_sha1, md, SHA_DIGEST_LENGTH, signature, sigLen, rsaKey));
	// emmm...verify signature failure
	md[0] = ~md[0];
	ASSERT(!RSA_verify(NID_sha1, md, SHA_DIGEST_LENGTH, signature, sigLen, rsaKey));
	// free signature
	free(signature);
}
