#ifndef __SIAGNATURE_H
#define __SIAGNATURE_H

#define BUFFER_SIZE	512

class Signature
{
private:
	const char		*privateKeyPem;
	const char		*dest;

	uint32 fixEndian(uint32 src, uint8 bigEndian);

public:
	Signature(const char *privateKeyPem, const char *dest);
	~Signature();

	int genSignature();

	void runTestSuit(const char *publicKeyPem);

	int verify(uint32 offset, const char *publicKeyPem);
};

#endif
