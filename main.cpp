#include "common_def.h"
#include "simlock_common.h"
#include "tinyxml2.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "oem.h"
#include <fcntl.h>
#include <unistd.h>
#include "ParseConfigData.h"
#include "Signature.h"

using namespace std;
using namespace tinyxml2;

/* global var */
char	*configData 	= NULL,
	*configXml 	= NULL,
	*privateKeyPem 	= NULL,
	*publicKeyPem 	= NULL;


/* parsing the runtime arguments */
/* return:
 * 	0: parse xml to raw data
 * 	1: parse raw data and print
 *	2: run parse tool test suit 
 */
int parseArgv(int argc, char** argv)
{
	int index = 0;

	while(index < argc) {
		#ifdef DEBUG
		fprintf(stdout, "parsing argv[%d]: %s\n", index, argv[index]);
		#endif
		if (!strcmp("-in", argv[index]))
		{
			if (++index >= argc) return -1;
			configXml = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get configXml argv[%d]: %s\n", index, configXml);
			#endif
			index++;
		}
		else if (!strcmp("-out", argv[index]))
		{
			if (++index >= argc) return -1;
			configData = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get configData argv[%d]: %s\n", index, configData);
			#endif
			index++;
		}
		else if (!strcmp("-private-key", argv[index]))
		{
			if (++index >= argc) return -1;
			privateKeyPem = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get privateKeyPem argv[%d]: %s\n", index, privateKeyPem);
			#endif
			index++;
		}
		else if (!strcmp("-public-key", argv[index]))
		{
			if (++index >= argc) return -1;
			publicKeyPem = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get publicKeyPem argv[%d]: %s\n", index, publicKeyPem);
			#endif
			index++;
		}
		else if (!strcmp("-check", argv[index]))
		{
			if (++index >= argc) return -1;
			configData = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get checkData argv[%d]: %s\n", index, configData);
			#endif
			// index++; // return immediately
			return 1;
		}
		else if (!strcmp("-run-test-suit", argv[index]))
		{
			if (++index >= argc) return -1;
			configData = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get runTestSuit argv[%d]: %s\n", index, configData);
			#endif
			// index++; // return immediately
			return 2;
		}
		else
		{
			#ifdef DEBUG
			fprintf(stderr, "unregonized argv[%d]: %s\n", index, argv[index]);
			#endif
			index++;
		}
	};

	if (!configData || !configXml) return -1;

	return 0;
}

/* show a brief help */
void help(const char* cmd)
{
	fprintf(stdout, "Usage:\n\
	\t %s -in <configXml> -out <configData> [-private-key <privateKeyPem>]\n\
	\t %s -check <configData> [-public-key <privateKeyPem>]\n\
	\t %s -run-test-suit <configData> [-public-key <privateKeyPem>]\n", cmd, cmd, cmd);
}

int main(int argc, char** argv)
{
	/* step 0: parse the argv */
	int ret = parseArgv(argc, argv);

	/* show help if error accur in parsing argumenst */
	if (0 > ret)
	{
		fprintf(stderr, "Parsing argumenst error!\n");
		help(argv[0]);
		return -1;
	}

	ParseConfigData *configDataParser = new ParseConfigData(configXml, configData);
	ASSERT(configDataParser);

	/* check config data and return */
	if (1 == ret)
	{
		#ifdef DEBUG
		fprintf(stdout, "run raw data parse:\n");
		#endif
		uint32 readLen = configDataParser->parseRawData();
		if (publicKeyPem)
		{
			#ifdef DEBUG
			fprintf(stdout, "run raw data signature verify:\n");
			#endif
			Signature *signature = new Signature(privateKeyPem, configData);
			signature->verify(readLen, publicKeyPem);
		}
	}
	else if (2 == ret)
	{
		#ifdef DEBUG
		fprintf(stdout, "run test suit:\n");
		#endif
		configDataParser->runTestSuit();
		if (publicKeyPem)
		{
			#ifdef DEBUG
			fprintf(stdout, "run sign test suit:\n");
			#endif
			Signature *signature = new Signature(privateKeyPem, configData);
			signature->runTestSuit(publicKeyPem);
		}
	}
	else
	{
		#ifdef DEBUG
		fprintf(stdout, "run config data parse:\n");
		#endif
		configDataParser->parseConfigData();
		if (privateKeyPem)
		{
			#ifdef DEBUG
			fprintf(stdout, "run config data sign:\n");
			#endif
			Signature *signature = new Signature(privateKeyPem, configData);
			signature->genSignature();
		}
	}

	return 0;
}
