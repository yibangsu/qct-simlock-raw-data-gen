#ifndef __SIAGNATURE_H
#define __SIAGNATURE_H

#define BUFFER_SIZE	512

class Signature
{
private:
	const char		*privateKeyPem;
	const char		*dest;

public:
	Signature(const char *privateKeyPem, const char *dest);
	~Signature();

	int genSignature();

	void runTestSuit(const char *publicKeyPem);

	int verify(uint32 offset, const char *publicKeyPem);
};

#endif
