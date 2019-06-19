#include "stdio.h"
#include "stdlib.h"
#include <openssl/idea.h>
#include <fcntl.h>

void help(char* argv)
{
fprintf(stdout, "usage:\n" \
"\t%s" \
" inputfile"
" outputfile [e|d]\n", argv);
}

void main(int argc, char* argv[])
{
	int fdin, fdout;
	unsigned char eblock[1024], dblock[1024];
	int len;
	unsigned char iv[8] = {'1', '2', '3', '4', '5', '6', '7', '8'};
	unsigned char key[16] = {'w', 'o', 'z', 'a', 'i', 'c', 'e', 's', 'h', 'i', 'i', 'd', 'e', 'a', 'f', '0'};
	int encrypto;
	IDEA_KEY_SCHEDULE eks, dks;

	if (argc != 4 || argv[1] == NULL || argv[2] == NULL)
	{
		help(argv[0]);
		return;
	}

	if (!strcmp(argv[3], "e"))
	{
		encrypto = 1;
		fprintf(stdout, "do encrypt\n");
	}
	else
	{
		encrypto = 0;
		fprintf(stdout, "do descrypt\n");
	}

	fdin = open(argv[1], O_RDONLY);
	if (fdin < 0)
	{
		fprintf(stderr, "can't open input file %s\n", argv[1]);
		return;
	}
	
	fdout = open(argv[2], O_RDWR|O_CREAT, 0755);
	if (fdout < 0)
	{
		fprintf(stderr, "can't open output file %s\n", argv[2]);
		close(fdin);
		return;
	}

	IDEA_set_encrypt_key(key, &eks);

	if (encrypto == 0)
	{
		IDEA_set_decrypt_key(&eks, &dks);
		while((len = read(fdin, &eblock, sizeof(eblock))) > 0)
		{
			IDEA_cbc_encrypt((unsigned char*) eblock, (unsigned char*) dblock, len, &dks, &iv, 0);
			write(fdout, &dblock, len);
		}
	}
	else
	{
		while((len = read(fdin, &eblock, sizeof(eblock))) > 0)
		{
			IDEA_cbc_encrypt((unsigned char*) eblock, (unsigned char*) dblock, len, &eks, &iv, 1);
			if (len % 8 != 0)
				len = len + 8 - (len%8);
			write(fdout, &dblock, len);
		}
	}

	close(fdin);
	close(fdout);

	return;
}
