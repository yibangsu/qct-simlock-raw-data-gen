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
#include "ReadConfigData.h"

using namespace std;
using namespace tinyxml2;

/* global var */
char	*configData 	= NULL,
	*configXml 	= NULL,
	*privateKeyPem 	= NULL,
	*publicKeyPem 	= NULL;


typedef enum {
	OPTION_PARSE,
	OPTION_CHECK,
	OPTION_RUN_TEST_SUIT,
	OPTION_UNKOWN,
} option_type;

/* parsing the runtime arguments */
/* return:
 * 	0: parse xml to raw data
 * 	1: parse raw data and print
 *	2: run parse tool test suit 
 */
option_type parseArgv(int argc, char** argv)
{
	int 		index 		= 0;
	option_type 	optionType 	= OPTION_PARSE;

	while(index < argc) {
		#ifdef DEBUG
		fprintf(stdout, "parsing argv[%d]: %s\n", index, argv[index]);
		#endif
		if (!strcmp("-in", argv[index]))
		{
			if (++index >= argc) return OPTION_UNKOWN;
			configXml = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get configXml argv[%d]: %s\n", index, configXml);
			#endif
			index++;
		}
		else if (!strcmp("-out", argv[index]))
		{
			if (++index >= argc) return OPTION_UNKOWN;
			configData = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get configData argv[%d]: %s\n", index, configData);
			#endif
			index++;
		}
		else if (!strcmp("-private-key", argv[index]))
		{
			if (++index >= argc) return OPTION_UNKOWN;
			privateKeyPem = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get privateKeyPem argv[%d]: %s\n", index, privateKeyPem);
			#endif
			index++;
		}
		else if (!strcmp("-public-key", argv[index]))
		{
			if (++index >= argc) return OPTION_UNKOWN;
			publicKeyPem = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get publicKeyPem argv[%d]: %s\n", index, publicKeyPem);
			#endif
			index++;
		}
		else if (!strcmp("-check", argv[index]))
		{
			if (++index >= argc) return OPTION_UNKOWN;
			configData = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get checkData argv[%d]: %s\n", index, configData);
			#endif
			index++;
			optionType 		= OPTION_CHECK;
		}
		else if (!strcmp("-run-test-suit", argv[index]))
		{
			if (++index >= argc) return OPTION_UNKOWN;
			configData = argv[index];
			#ifdef DEBUG
			fprintf(stdout, "get runTestSuit argv[%d]: %s\n", index, configData);
			#endif
			index++;
			optionType 		= OPTION_RUN_TEST_SUIT;
		}
		else
		{
			#ifdef DEBUG
			fprintf(stderr, "unregonized argv[%d]: %s\n", index, argv[index]);
			#endif
			index++;
		}
	};

	// check argv setting
	if (!configData) return OPTION_UNKOWN;
	if (OPTION_CHECK != optionType && !configXml) return OPTION_UNKOWN;

	return optionType;
}

/* show a brief help */
void help(const char* cmd)
{
	fprintf(stdout, "Usage:\n\
	\t %s -in <configXml> -out <configData> [-private-key <privateKeyPem>]\n\
	\t %s -check <configData> [-public-key <publicKeyPem>]\n\
	\t %s -run-test-suit <configData> -in <configXml> [-public-key <publicKeyPem> -private-key <privateKeyPem>]\n", cmd, cmd, cmd);
}

int main(int argc, char** argv)
{
	/* parse the argv */
	option_type 		optionType 		= parseArgv(argc, argv);
	ParseConfigData 	*configDataParser 	= NULL;
	Signature 		*signature		= NULL;
	uint32 			readLen			= 0;
	ReadConfigData 		*configDataReader 	= NULL;

	switch (optionType)
	{
	/* build raw config data */
	case OPTION_PARSE:
		#ifdef DEBUG
		fprintf(stdout, "run config data parse:\n");
		#endif
		// new ParseConfigData
		configDataParser = new ParseConfigData(configXml, configData);
		// parse and store the config data
		configDataParser->parseConfigData();
		// release configDataParser to close the StoreConfigData file handler, otherwise the signature will be overwritten
		configDataParser->~ParseConfigData();
		if (privateKeyPem)
		{
			#ifdef DEBUG
			fprintf(stdout, "run config data sign:\n");
			#endif
			signature = new Signature(privateKeyPem, configData);
			signature->genSignature();
			signature->~Signature();
		}
		break;
	/* check config data and return */
	case OPTION_CHECK:
		#ifdef DEBUG
		fprintf(stdout, "run raw data parse:\n");
		#endif

		configDataParser = new ParseConfigData(configData);
		// parse configData, we need ReadConfigData to get raw data, configData to init ReadConfigData
		readLen = configDataParser->parseRawData();
		// release configDataParser to close the StoreConfigData file handler, otherwise the signature will be overwritten
		configDataParser->~ParseConfigData();
		// check signature
		if (publicKeyPem)
		{
			#ifdef DEBUG
			fprintf(stdout, "run raw data signature verify:\n");
			#endif
			signature = new Signature(privateKeyPem, configData);
			signature->verify(readLen, publicKeyPem);
			signature->~Signature();
		}
		break;
	/* run test suit */
	case OPTION_RUN_TEST_SUIT:
		#ifdef DEBUG
		fprintf(stdout, "run test suit:\n");
		#endif
		// run ParseConfigData::runTestSuit() included StoreConfigData::runTestSuit()
		configDataParser = new ParseConfigData(configXml, configData);
		configDataParser->runTestSuit();
		// release configDataParser to close the StoreConfigData file handler, otherwise the signature will be overwritten
		configDataParser->~ParseConfigData();
		// run ReadConfigData::runTestSuit()
		configDataReader = new ReadConfigData(configData);
		configDataReader->runTestSuit();
		configDataReader->~ReadConfigData();
		// run Signature::runTestSuit()
		if (publicKeyPem)
		{
			#ifdef DEBUG
			fprintf(stdout, "run sign test suit:\n");
			#endif
			signature = new Signature(privateKeyPem, configData);
			signature->runTestSuit(publicKeyPem);
			signature->~Signature();
		}
		break;
	/* show help if error accur in parsing argumenst */
	case OPTION_UNKOWN:
		fprintf(stderr, "Parsing argumenst error!\n");
		help(argv[0]);
		break;
	}

	return 0;
}
