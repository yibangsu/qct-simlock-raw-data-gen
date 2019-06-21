#ifndef PARSE_CONFIG_H
#define PARSE_CONFIG_H

#include "tinyxml2.h"
#include "StoreConfigData.h"
#include "ReadConfigData.h"
#include "common_def.h"

using namespace std;
using namespace tinyxml2;

/* inline define to cut down code writing */
#define SIMLOCK_LOCK_CODE_WILD_CHAR         '*'
#define SIMLOCK_LOCK_CODE_WILD_DIGIT        0xFF

#define pushUint8(x) \
{ \
	y = (uint8)(x); \
	this->configStore->store(&y, 1); \
}

#define pushXmlBoolean(x) \
{ \
	child = parent->FirstChildElement(x); \
	if (!child) \
	{ \
		pushUint8(0); \
	} \
	else \
	{ \
		pushUint8(!!child->IntText()); \
	}; \
}

#define pushXmlUint8(x) \
{ \
	child = parent->FirstChildElement(x); \
	if (!child) \
	{ \
		pushUint8(0); \
	} \
	else \
	{ \
		pushUint8(child->IntText()); \
	}; \
}

#define pushData(data, length) \
	this->configStore->store(data, length)

#define pushFinish() \
	this->configStore->push()

#define pushReset() \
	this->configStore->reset()

#define getAndPrintUint8(tag, type) \
	{ \
		uint32 len = this->configReader->get(&y, 1); \
		if (len) \
		{ \
			fprintf(stdout, #tag":="#type"\n", y); \
			readTotalLen++; \
		} \
		else \
		{ \
			fprintf(stderr, "!!========try to get 1 byte "#tag", but there is no data get========!!\n"); \
			return 1; \
		} \
	}

#define getData(data, length) \
	this->configReader->get(data, length)

#define setEhplmn(_code) \
	setMcc(_code.mcc, "ehplmnmcc"); \
	setMnc(_code.mnc, "ehplmnmnc");

#define setNetwork(_code) \
	setMcc(_code.mcc, "mcc"); \
	setMnc(_code.mnc, "mnc");

#define setMcc(mcc_code, _tag) \
	memset(mcc_code, SIMLOCK_LOCK_CODE_WILD_CHAR, SIMLOCK_MCC_LEN); \
	child = parent->FirstChildElement(_tag); \
	if (child) \
	{ \
		const char* mcc = child->GetText(); \
		int mcc_len = strlen(mcc); \
		mcc_len = mcc_len > SIMLOCK_MCC_LEN? SIMLOCK_MCC_LEN: mcc_len; \
		memcpy(mcc_code, child->GetText(), mcc_len); \
	} \

#define setMnc(mnc_code, _tag) \
	memset(mnc_code.mnc_data, SIMLOCK_LOCK_CODE_WILD_CHAR, SIMLOCK_MNC_MAX); \
	child = parent->FirstChildElement(_tag); \
	if (!child) \
	{ \
		mnc_code.mnc_len = 0; \
	} \
	else \
	{ \
		const char *mnc = child->GetText(); \
		int mnc_len = strlen(mnc); \
		mnc_code.mnc_len = mnc_len > SIMLOCK_MNC_MAX? SIMLOCK_MNC_MAX: mnc_len; \
		memcpy(mnc_code.mnc_data, mnc, mnc_code.mnc_len); \
	}

#define setImsiDigit(x, ns_code) \
	child = parent->FirstChildElement("imsi_digit"#x); \
	if (!child) \
	{ \
		ns_code.imsi_digit##x = SIMLOCK_LOCK_CODE_WILD_DIGIT; \
	} \
	else \
	{ \
		const char *digit = child->GetText(); \
		if (strlen(digit) < 1) \
		{ \
			ns_code.imsi_digit##x = SIMLOCK_LOCK_CODE_WILD_DIGIT; \
		} \
		else if (strlen(digit)) \
		{ \
			ns_code.imsi_digit##x = parseHex('0', digit[0]); \
		} \
		else \
		{ \
			ns_code.imsi_digit##x = parseHex(digit[0], digit[1]); \
		} \
	}

#define setGid(x, _code) \
	child = parent->FirstChildElement("gid"#x); \
	memset(_code.gid##x.gid_data, SIMLOCK_LOCK_CODE_WILD_DIGIT, SIMLOCK_MAX_GID_LEN); \
	if (!child) \
	{ \
		_code.gid##x.gid_len = 0; \
	} \
	else \
	{ \
		const char *gid = child->GetText(); \
		int gid_len = strlen(gid)/2; \
		_code.gid##x.gid_len = gid_len > SIMLOCK_MAX_GID_LEN? SIMLOCK_MAX_GID_LEN: gid_len; \
		for (int i = 0; i < _code.gid##x.gid_len; i++) \
		{ \
			_code.gid##x.gid_data[i] = parseHex(gid[2*i], gid[2*i+1]); \
		} \
	}

#define setSpn(_code) \
	child = parent->FirstChildElement("spn_valid"); \
	if (!child) \
	{ \
		_code.spn_valid = 0; \
	} \
	else \
	{ \
		_code.spn_valid = !!child->IntText(); \
	} \
	memset(_code.spn_data, SIMLOCK_LOCK_CODE_WILD_DIGIT, SIMLOCK_SPN_LEN); \
	child = parent->FirstChildElement("spn_data"); \
	if (child) \
	{ \
		const char *spn = child->GetText(); \
		int spn_len = strlen(spn)/2; \
		for (int i = 0; i < spn_len && i < SIMLOCK_SPN_LEN ; i++) \
		{ \
			_code.spn_data[i] = parseHex(spn[2*i], spn[2*i+1]); \
		} \
	}

#define setIccid(_code) \
	memset(_code.iccid_data, SIMLOCK_LOCK_CODE_WILD_CHAR, SIMLOCK_ICCID_DIGITS_MAX); \
	child = parent->FirstChildElement("iccid"); \
	if (child) \
	{ \
		const char * iccid = child->GetText(); \
		int iccid_len = strlen(iccid); \
		_code.iccid_len = iccid_len > SIMLOCK_ICCID_DIGITS_MAX? SIMLOCK_ICCID_DIGITS_MAX: iccid_len; \
		for (int i = 0; i < _code.iccid_len; i++) \
		{ \
			if (iccid[i] >= '0' && iccid[i] <= '9') \
			{ \
				_code.iccid_data[i] = iccid[i]; \
			} \
		} \
	}

#define setAscii(_code, tag, max_len) \
	memset(_code.tag##_data, 0x0, max_len); \
	child = parent->FirstChildElement(#tag); \
	if (!child) \
	{ \
		_code.tag##_len = 0; \
	} \
	else \
	{ \
		const char *data = child->GetText(); \
		int data_len = strlen(data); \
		_code.tag##_len = data_len > max_len? max_len: data_len; \
		memcpy(_code.tag##_data, data, _code.tag##_len); \
	}
	
#define setImpi(_code) \
	setAscii(_code, impi, SIMLOCK_IMPI_MAX);

#define setMsin(_code) \
	setAscii(_code, msin, SIMLOCK_MSIN_MAX);

#define setIrm(_code) \
	memset(_code.irm, '*', SIMLOCK_IRM_LEN); \
	child = parent->FirstChildElement("irm"); \
	if (child) \
	{ \
		const char *irm = child->GetText(); \
		int irm_len = strlen(irm); \
		memcpy(_code.irm, irm, irm_len > SIMLOCK_IRM_LEN? SIMLOCK_IRM_LEN: irm_len); \
	}

typedef enum
{
	DATA_TYPE_DIGIT,
	DATA_TYPE_HEX,
	DATA_TYPE_ASCII,
	DATA_TYPE_MAX	
} parse_data_type;

class ParseConfigData
{
private:
	XMLDocument 		*doc 		= NULL;
	StoreConfigData 	*configStore 	= NULL;
	ReadConfigData		*configReader 	= NULL;
	XMLElement 		*xmlRoot 	= NULL;

	uint8			y 		= 0;

	int parseSlotData(XMLElement *xmlRoot);
	int parseCategoryData(XMLElement *xmlRoot);
	int parseCodeData(XMLElement *xmlRoot);

	int parse_3gpp_Network_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_Network_Subset_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_Service_Provider_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_Corporate_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_SPN_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_SP_EHPLMN_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_ICCID_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_IMPI_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_NS_SP_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp_SIM_Category_Data(XMLElement *xmlRoot);

	int parse_3gpp2_Network1_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp2_Network2_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp2_HRPD_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp2_Service_Provider_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp2_Corporate_Category_Data(XMLElement *xmlRoot);
	int parse_3gpp2_RUIM_Category_Data(XMLElement *xmlRoot);

	void genTestXml();

	uint8 parseHex(char high, char low);

public:
	ParseConfigData(const char* configXml, const char* configData);
	ParseConfigData(const char* configData);
	~ParseConfigData();

	int parseConfigData(XMLElement *xmlOtherRoot = NULL);

	int parseRawData();

	void runTestSuit();
};

#endif
