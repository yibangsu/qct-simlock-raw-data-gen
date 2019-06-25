#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>

#include "ParseConfigData.h"
#include "simlock_common.h"
#include "oem.h"

/* new */
ParseConfigData::ParseConfigData(const char* configXml, const char* configData)
{
	ASSERT(configData);
	ASSERT(configXml);

	this->configStore 	= new StoreConfigData(configData);

	doc 			= new XMLDocument();
	ASSERT(doc);
	XMLError xmlRet 	= doc->LoadFile(configXml);
	ASSERT(XML_SUCCESS == xmlRet);
	this->xmlRoot 		= doc->FirstChildElement("config");
}

/* new */
ParseConfigData::ParseConfigData(const char* configData)
{
	ASSERT(configData);

	this->configReader = new ReadConfigData(configData);
}

/* release */
ParseConfigData::~ParseConfigData()
{
	if (configStore)
	{
		configStore->~StoreConfigData();
	}

	if (doc)
	{
		doc->~XMLDocument();
	}

	if (configReader)
	{
		configReader->~ReadConfigData();
	}
}

/* parse ascii value to hex, pad 0xFF */
uint8 ParseConfigData::parseHex(char high, char low)
{
	uint8 value = 0xFF;

	if (high >= '0' && high <= '9')
	{
		value |= (((high - '0') << 4) & 0xF0);
	}
	else if (high >= 'a' && high <= 'f')
	{
		value |= (((high - 'a' + 10) << 4) & 0xF0);
	}
	else if (high >= 'A' && high <= 'F')
	{
		value |= (((high - 'A' + 10) << 4) & 0xF0);
	}

	if (low >= '0' && low <= '9')
	{
		value |= ((low - '0') & 0x0F);
	}
	else if (low >= 'a' && low <= 'f')
	{
		value |= ((low - 'a' + 10) & 0x0F);
	}
	else if (low >= 'A' && low <= 'F')
	{
		value |= ((low - 'A' + 10) & 0x0F);
	}

	return value;
}

/* parse 3GPP Network Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_Network_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 		= SIMLOCK_CATEGORY_3GPP_NW;
	// set a pointer to point at data
	simlock_nw_code_list_type *nw_list_ptr 	= &(categoryData.code_data.nw_3gpp_code_list);
	// find code tag
	codeElement 				= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes]);
		// get one code, num_nw_codes++
		nw_list_ptr->num_nw_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_nw_codes %d\n", categoryData.category_type, nw_list_ptr->num_nw_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP Network Subset Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_Network_Subset_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 		= SIMLOCK_CATEGORY_3GPP_NS;
	// set a pointer to point at data
	simlock_ns_code_list_type *ns_list_ptr = &(categoryData.code_data.ns_3gpp_code_list);
	// find code tag
	codeElement 				= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes].nw_code);
		// set imsi_digit6
		setImsiDigit(6, ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes]);
		// set imsi_digit7
		setImsiDigit(7, ns_list_ptr->ns_code_data[ns_list_ptr->num_ns_codes]);
		// get one code, num_nw_codes++
		ns_list_ptr->num_ns_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_ns_codes %d\n", categoryData.category_type, ns_list_ptr->num_ns_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP Service Provider Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_Service_Provider_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 		= SIMLOCK_CATEGORY_3GPP_SP;
	// set a pointer to point at data
	simlock_sp_code_list_type *sp_list_ptr = &(categoryData.code_data.sp_3gpp_code_list);
	// find code tag
	codeElement 				= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes].nw_code);
		// set gid1
		setGid(1, sp_list_ptr->sp_code_data[sp_list_ptr->num_sp_codes]);
		// get one code, num_nw_codes++
		sp_list_ptr->num_sp_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_sp_codes %d\n", categoryData.category_type, sp_list_ptr->num_sp_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP Corporate Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_Corporate_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 		= SIMLOCK_CATEGORY_3GPP_CP;
	// set a pointer to point at data
	simlock_cp_code_list_type *cp_list_ptr = &(categoryData.code_data.cp_3gpp_code_list);
	// find code tag
	codeElement 				= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes].nw_code);
		// set gid1
		setGid(1, cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes]);
		// set gid2
		setGid(2, cp_list_ptr->cp_code_data[cp_list_ptr->num_cp_codes]);
		// get one code, num_nw_codes++
		cp_list_ptr->num_cp_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_cp_codes %d\n", categoryData.category_type, cp_list_ptr->num_cp_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP SPN Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_SPN_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 			= SIMLOCK_CATEGORY_3GPP_SPN;
	// set a pointer to point at data
	simlock_spn_code_list_type *spn_list_ptr 	= &(categoryData.code_data.spn_3gpp_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].nw_code);
		// set spn
		setSpn(spn_list_ptr->spn_code_data[spn_list_ptr->num_spn_codes].spn);
		// get one code, num_nw_codes++
		spn_list_ptr->num_spn_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_spn_codes %d\n", categoryData.category_type, spn_list_ptr->num_spn_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP SP + EHPLMN Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_SP_EHPLMN_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 				= SIMLOCK_CATEGORY_3GPP_SP_EHPLMN;
	// set a pointer to point at data
	simlock_sp_ehplmn_code_list_type *sp_ehplmn_list_ptr 	= &(categoryData.code_data.sp_ehplmn_3gpp_code_list);
	// find code tag
	codeElement 						= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].nw_code);
		// set gid1
		setGid(1, sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes]);
		// set ehplmn code
		setEhplmn(sp_ehplmn_list_ptr->sp_ehplmn_code_data[sp_ehplmn_list_ptr->num_sp_ehplmn_codes].ehplmn_nw_code);
		// get one code, num_nw_codes++
		sp_ehplmn_list_ptr->num_sp_ehplmn_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_sp_ehplmn_codes %d\n", categoryData.category_type, sp_ehplmn_list_ptr->num_sp_ehplmn_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP ICCID Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_ICCID_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 			= SIMLOCK_CATEGORY_3GPP_ICCID;
	// set a pointer to point at data
	simlock_iccid_code_list_type *iccid_list_ptr 	= &(categoryData.code_data.iccid_3gpp_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw code
		setNetwork(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].nw_code);
		// set iccid
		setIccid(iccid_list_ptr->iccid_code_data[iccid_list_ptr->num_iccid_codes].iccid);
		// get one code, num_nw_codes++
		iccid_list_ptr->num_iccid_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_iccid_codes %d\n", categoryData.category_type, iccid_list_ptr->num_iccid_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP IMPI Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_IMPI_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 			= SIMLOCK_CATEGORY_3GPP_IMPI;
	// set a pointer to point at data
	simlock_impi_code_list_type *impi_list_ptr 	= &(categoryData.code_data.impi_3gpp_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set impi
		setImpi(impi_list_ptr->impi_code_data[impi_list_ptr->num_impi_codes].impi);
		// get one code, num_nw_codes++
		impi_list_ptr->num_impi_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_impi_codes %d\n", categoryData.category_type, impi_list_ptr->num_impi_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP NS + SP Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_NS_SP_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 			= SIMLOCK_CATEGORY_3GPP_NS_SP;
	// set a pointer to point at data
	simlock_ns_sp_code_list_type *ns_sp_list_ptr 	= &(categoryData.code_data.ns_sp_3gpp_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw
		setNetwork(ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code.nw_code);
		// set imsi_digit6
		setImsiDigit(6, ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code);
		// set imsi_digit7
		setImsiDigit(7, ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes].ns_code);
		// set gid1
		setGid(1, ns_sp_list_ptr->ns_sp_code_data[ns_sp_list_ptr->num_ns_sp_codes]);
		// get one code, num_nw_codes++
		ns_sp_list_ptr->num_ns_sp_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_ns_sp_codes %d\n", categoryData.category_type, ns_sp_list_ptr->num_ns_sp_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP SIM/USIM Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp_SIM_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 			= SIMLOCK_CATEGORY_3GPP_SIM;
	// set a pointer to point at data
	simlock_sim_code_list_type *sim_list_ptr 	= &(categoryData.code_data.sim_3gpp_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw
		setNetwork(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code);
		// set msin
		setMsin(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin);
		// get one code, num_nw_codes++
		sim_list_ptr->num_sim_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_sim_codes %d\n", categoryData.category_type, sim_list_ptr->num_sim_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP2 Network1 Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp2_Network1_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 			= SIMLOCK_CATEGORY_3GPP2_NW_TYPE1;
	// set a pointer to point at data
	simlock_nw_code_list_type *nw_list_ptr 		= &(categoryData.code_data.nw_type1_3gpp2_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw
		setNetwork(nw_list_ptr->nw_code_data[nw_list_ptr->num_nw_codes]);
		// get one code, num_nw_codes++
		nw_list_ptr->num_nw_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_nw_codes %d\n", categoryData.category_type, nw_list_ptr->num_nw_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP2 Network2 Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp2_Network2_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 				= SIMLOCK_CATEGORY_3GPP2_NW_TYPE2;
	// set a pointer to point at data
	simlock_nw_type2_code_list_type *nw_list_ptr 		= &(categoryData.code_data.nw_type2_3gpp2_code_list);
	// find code tag
	codeElement 						= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set irm
		setIrm(nw_list_ptr->nw_type2_code_data[nw_list_ptr->num_nw_type2_codes]);
		// get one code, num_nw_codes++
		nw_list_ptr->num_nw_type2_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_nw_type2_codes %d\n", categoryData.category_type, nw_list_ptr->num_nw_type2_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP2 HRPD Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp2_HRPD_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	// XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 				= SIMLOCK_CATEGORY_3GPP2_HRPD;
	/* not support this category yet, only set the category_type */
	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: not supported! skip parsing~\n", categoryData.category_type);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}


/* parse 3GPP2 Service Provider Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp2_Service_Provider_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	// XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 				= SIMLOCK_CATEGORY_3GPP2_SP;
	/* not support this category yet, only set the category_type */
	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: not supported! skip parsing~\n", categoryData.category_type);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP2 Corporate Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp2_Corporate_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	// XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 				= SIMLOCK_CATEGORY_3GPP2_CP;
	/* not support this category yet, only set the category_type */
	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: not supported! skip parsing~\n", categoryData.category_type);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse 3GPP2 RUIM Category, data hold in simlock_category_data_type */
int ParseConfigData::parse_3gpp2_RUIM_Category_Data(XMLElement *xmlRoot)
{
	// handle xml
	XMLElement 			*codeElement, *parent, *child;
	// use simlock_category_data_type to hold data 
	simlock_category_data_type 	categoryData;
	// clear categoryData
	memset(&categoryData, 0x0, sizeof(categoryData));
	// set category_type
	categoryData.category_type 				= SIMLOCK_CATEGORY_3GPP2_RUIM;
	// set a pointer to point at data
	simlock_sim_code_list_type *sim_list_ptr 	= &(categoryData.code_data.ruim_3gpp2_code_list);
	// find code tag
	codeElement 					= xmlRoot->FirstChildElement("code");

	// parse code element
	while(codeElement)
	{
		// set parent... to use the macro define
		parent = codeElement;
		// set nw
		setNetwork(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].nw_code);
		// set msin
		setMsin(sim_list_ptr->sim_code_data[sim_list_ptr->num_sim_codes].imsi_msin);
		// get one code, num_nw_codes++
		sim_list_ptr->num_sim_codes++;
		// next
		codeElement = codeElement->NextSiblingElement("code");
	}

	#ifdef DEBUG
	fprintf(stdout, "type 0x%x: get num_sim_codes %d\n", categoryData.category_type, sim_list_ptr->num_sim_codes);
	#endif

	// store category data
	pushData((uint8*) &categoryData, sizeof(categoryData));

	return 0;
}

/* parse Category, global setting in the Category file but NOT in simlock_category_data_type */
int ParseConfigData::parseCategoryData(XMLElement *xmlRoot)
{
	// handle category
	XMLElement *categoryElement, *parent, *child;
	categoryElement = xmlRoot->FirstChildElement("category");

	/* check arguments */
	if (!categoryElement) // no category tag, set categoryCount 0 and return
	{
		fprintf(stdout, "No category tag, only set categoryCount 0!\n");
		pushUint8(0);
		return 0;
	}

	// set category count... it should be rewrited after parsing config
	uint8 categoryCount 		= 0; // record the category count
#ifdef SKIP_UNREG_CODE_TRUE
	/* skip if the main tag missing */
	while (categoryElement)
	{
		XMLElement *categoryEnum 	= categoryElement->FirstChildElement("simlock_category_enum_type");
		if (categoryEnum && SIMLOCK_CATEGORY_3GPP_NW <= categoryEnum->IntText() 
				 && SIMLOCK_CATEGORY_3GPP2_RUIM >= categoryEnum->IntText()) 
		/* some 3gpp2 type is not supported, but it should be handled in device's runtime code */
		{
			categoryCount++;
		}
		categoryElement 		= categoryElement->NextSiblingElement("category");
	}
	pushUint8(categoryCount);
	#ifdef DEBUG
	fprintf(stdout, "get categoryCount %d\n", categoryCount);
	#endif

	// reset categoryElement
	categoryElement 		= xmlRoot->FirstChildElement("category");
	
	// parse category data
	while(categoryElement)
	{
		// get tag simlock_category_enum_type
		XMLElement *categoryEnum = categoryElement->FirstChildElement("simlock_category_enum_type");
		/* check simlock_category_enum_type */
		if (categoryEnum && SIMLOCK_CATEGORY_3GPP_NW <= categoryEnum->IntText() 
				 && SIMLOCK_CATEGORY_3GPP2_RUIM >= categoryEnum->IntText())
		{
			continue;
		}
		// set parent... to use the macro define
		parent = categoryElement;
		// set category magic
		pushUint8(CATEGORY_MAGIC);
		// set simlock_category_enum_type
		/* pushXmlUint8("simlock_category_enum_type"); */
		/* this is set in simlock_category_data_type */
		// set simlock_status_enum_type
		pushXmlUint8("simlock_status_enum_type");
		// set simlock_sfs_enum_type
		pushXmlUint8("simlock_sfs_enum_type");
		// set auto_lock
		pushXmlBoolean("auto_lock");
		// set is_blacklist
		pushXmlBoolean("is_blacklist");
		// set retry_times
		pushXmlUint8("retry_times");
		// set salt
		/* salt is device unique, should NOT be set here */
		// set hash
		/* hash is device unique, should NOT be set here */
		// set code
		switch(categoryEnum->IntText())
		{
			case SIMLOCK_CATEGORY_3GPP_NW:
				parse_3gpp_Network_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_NS:
				parse_3gpp_Network_Subset_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SP:
				parse_3gpp_Service_Provider_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_CP:
				parse_3gpp_Corporate_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SPN:
				parse_3gpp_SPN_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SP_EHPLMN:
				parse_3gpp_SP_EHPLMN_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_ICCID:
				parse_3gpp_ICCID_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_IMPI:
				parse_3gpp_IMPI_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_NS_SP:
				parse_3gpp_NS_SP_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SIM:
				parse_3gpp_SIM_Category_Data(categoryElement);
				break;

			case SIMLOCK_CATEGORY_3GPP2_NW_TYPE1:
				parse_3gpp2_Network1_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_NW_TYPE2:
				parse_3gpp2_Network2_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_HRPD:
				parse_3gpp2_HRPD_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_SP:
				parse_3gpp2_Service_Provider_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_CP:
				parse_3gpp2_Corporate_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_RUIM:
				parse_3gpp2_RUIM_Category_Data(categoryElement);
				break;
			default:
				break;
		}
		// next
		categoryElement = categoryElement->NextSiblingElement("category");
	}
#else
	/* parse to 0 if the tag missing */
	while (categoryElement)
	{
		categoryCount++;
		categoryElement 	= categoryElement->NextSiblingElement("category");
	}
	pushUint8(categoryCount);
	#ifdef DEBUG
	fprintf(stdout, "get categoryCount %d\n", categoryCount);
	#endif

	// reset categoryElement
	categoryElement 		= xmlRoot->FirstChildElement("category");
	
	// parse category data
	while(categoryElement)
	{
		// get tag simlock_category_enum_type
		XMLElement *categoryEnum = categoryElement->FirstChildElement("simlock_category_enum_type");
		// set code
		int type = categoryEnum? categoryEnum->IntText(): 0;
		/* check simlock_category_enum_type */
		if (SIMLOCK_CATEGORY_3GPP_NW > type || SIMLOCK_CATEGORY_3GPP2_RUIM < type)
		{
			fprintf(stderr, "Invalid simlock_category_enum_type: %d, reset simlock_category_enum_type = 0!\n", type);
			type = 0;
		}
		// set parent... to use the macro define
		parent = categoryElement;
		// set category magic
		pushUint8(CATEGORY_MAGIC);
		// set simlock_category_enum_type
		/* pushXmlUint8("simlock_category_enum_type"); */
		/* this is set in simlock_category_data_type */
		// set simlock_status_enum_type
		pushXmlUint8("simlock_status_enum_type");
		// set simlock_sfs_enum_type
		pushXmlUint8("simlock_sfs_enum_type");
		// set auto_lock
		pushXmlBoolean("auto_lock");
		// set is_blacklist
		pushXmlBoolean("is_blacklist");
		// set retry_times
		pushXmlUint8("retry_times");
		// set salt
		/* salt is device unique, should NOT be set here */
		// set hash
		/* hash is device unique, should NOT be set here */
		// set code
		switch(type)
		{
			case SIMLOCK_CATEGORY_3GPP_NW:
				parse_3gpp_Network_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_NS:
				parse_3gpp_Network_Subset_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SP:
				parse_3gpp_Service_Provider_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_CP:
				parse_3gpp_Corporate_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SPN:
				parse_3gpp_SPN_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SP_EHPLMN:
				parse_3gpp_SP_EHPLMN_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_ICCID:
				parse_3gpp_ICCID_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_IMPI:
				parse_3gpp_IMPI_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_NS_SP:
				parse_3gpp_NS_SP_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP_SIM:
				parse_3gpp_SIM_Category_Data(categoryElement);
				break;

			case SIMLOCK_CATEGORY_3GPP2_NW_TYPE1:
				parse_3gpp2_Network1_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_NW_TYPE2:
				parse_3gpp2_Network2_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_HRPD:
				parse_3gpp2_HRPD_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_SP:
				parse_3gpp2_Service_Provider_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_CP:
				parse_3gpp2_Corporate_Category_Data(categoryElement);
				break;
			case SIMLOCK_CATEGORY_3GPP2_RUIM:
				parse_3gpp2_RUIM_Category_Data(categoryElement);
				break;
			default:
				break;
		}
		// next
		categoryElement = categoryElement->NextSiblingElement("category");
	}
#endif

	return 0;
}

/* parse slot setting */
int ParseConfigData::parseSlotData(XMLElement *xmlRoot)
{
	// get the first slot element
	XMLElement *slotElement, *parent, *child;
	slotElement 		= xmlRoot->FirstChildElement("slot");

	/* check arguments */
	if (!slotElement) // no slot tag, set slotCount 0 and return
	{
		fprintf(stdout, "No slot tag, only set slotCount 0!\n");
		pushUint8(0);
		return 0;
	}

	// set slot count
	uint8 slotCount 	= 0;
#ifdef SKIP_UNREG_CODE_TRUE
	/* skip if the main tag missing */
	while (slotElement)
	{
		// check the main tag simlock_slot_enum_type
		XMLElement *slotEnum 	= slotElement->FirstChildElement("simlock_slot_enum_type");
		if (slotEnum && SIMLOCK_SLOT_1 <= slotEnum->IntText() && SIMLOCK_SLOT_NUM > slotEnum->IntText())
		{
			slotCount++;
		}
		// next
		slotElement 		= slotElement->NextSiblingElement("slot");
	}
	pushUint8(slotCount);
	#ifdef DEBUG
	fprintf(stdout, "get slotCount %d\n", slotCount);
	#endif

	// reset slotElement
	slotElement = xmlRoot->FirstChildElement("slot");

	// parse slot data
	while (slotElement) 
	{ 
		XMLElement *slotEnum 	= slotElement->FirstChildElement("simlock_slot_enum_type");
		if (slotEnum && SIMLOCK_SLOT_1 <= slotEnum->IntText() && SIMLOCK_SLOT_NUM > slotEnum->IntText())
		{
			// set parent... to use the macro define
			parent 				= slotElement;
			// set slot mark
			pushUint8(SLOT_MAGIC);
			// set simlock_slot_enum_type
			pushXmlUint8("simlock_slot_enum_type");
			// set simlock_disabled_slot_data_type
			pushXmlBoolean("simlock_disabled_slot_data_type");
			// parse category config
			parseCategoryData(slotElement);
		}
		// next
		slotElement = slotElement->NextSiblingElement("slot");
	}
#else
	/* parse to 0 if the tag missing */
	while (slotElement)
	{
		slotCount++;
		slotElement 	= slotElement->NextSiblingElement("slot");
	}
	pushUint8(slotCount);
	#ifdef DEBUG
	fprintf(stdout, "get slotCount %d\n", slotCount);
	#endif

	// reset slotElement
	slotElement = xmlRoot->FirstChildElement("slot");

	// parse slot data
	while (slotElement) 
	{ 
		// set parent... to use the macro define
		parent 				= slotElement;
		// set slot mark
		pushUint8(SLOT_MAGIC);
		// set simlock_slot_enum_type
		pushXmlUint8("simlock_slot_enum_type");
		// set simlock_disabled_slot_data_type
		pushXmlBoolean("simlock_disabled_slot_data_type");
		// parse category config
		parseCategoryData(slotElement);
		// next
		slotElement = slotElement->NextSiblingElement("slot");
	}
#endif

	return 0;
}

/* parse global config setting */
int ParseConfigData::parseConfigData(XMLElement *xmlOtherRoot)
{
	// check configStore
	if (!configStore)
	{
		fprintf(stderr, "%s: illegal configStore!\n", __FUNCTION__);
		return -1;
	}
	// if need to reset xml root
	if (xmlOtherRoot) 
	{
		this->xmlRoot = xmlOtherRoot;
	}
	// check configStore
	if (!this->xmlRoot)
	{
		fprintf(stderr, "%s: illegal xmlRoot!\n", __FUNCTION__);
		return -1;
	}

	// reset the buffer status
	pushReset();

	// set a pointer the hold the element
	XMLElement *parent, *child;
	// set parent... to use the macro define
	parent = xmlRoot;
	/* check endian */
	uint32 check32 	= 0x12345678;
	uint8  check8 	= *((uint8*)(&check32));

	// set magic
	pushUint8(CONFIG_MAGIC);
	// set chipset type
	pushUint8(CHIPSET);
	// set version ma
	pushUint8(VERSION_MAJOR);
	// set version mi
	pushUint8(VERSION_MIN);
	// set endian check
	pushUint8(check8 == 0x12);
	// set sizeof enum, use to avoid different enum size
	pushUint8((uint8)sizeof(simlock_category_enum_type));
	// set reserved byte 1
	pushUint8(0);
	// set reserved byte 2
	pushUint8(0);
	// set reserved byte 3
	pushUint8(0);
	// set reserved byte 4
	pushUint8(0);
	// set simlock_sfs_enum_type
	pushXmlUint8("config_simlock_sfs_enum_type");
	// set simlock_device_mode_enum_type
	pushXmlUint8("simlock_device_mode_enum_type");
	// set simlock_slot_policy_enum_type
	pushXmlUint8("simlock_slot_policy_enum_type");
	// set simlock_subscription_policy_enum_type
	pushXmlUint8("simlock_subscription_policy_enum_type");
	// set simlock_rsu_mode_enum_type
	pushXmlUint8("simlock_rsu_mode_enum_type");

	// parse slot config
	parseSlotData(xmlRoot);

	// push finish
	pushFinish();

	// push signature
	

	return 0;
}

/* parse raw data to check if the raw data gen successfully */
int ParseConfigData::parseRawData()
{
	ASSERT(this->configReader);

	// set var to hold read len
	uint32 readLen = 0;
	uint32 readTotalLen = 0;

	// get magic
	getAndPrintUint8('magic', '0x%x');
	// get chipset type
	getAndPrintUint8('chipset type', '0x%x');
	// get version ma
	getAndPrintUint8('version ma', '0x%x');
	// get version mi
	getAndPrintUint8('version mi', '0x%x');
	// get endian check
	getAndPrintUint8('bigEndian', '0x%x');
	// get sizeof enum
	getAndPrintUint8('sizeof enum', '0x%x');
	uint8 enumSizeExpectd = y;
	// get reserved byte 1
	getAndPrintUint8('reserved byte 1', '0x%x');
	// get reserved byte 2
	getAndPrintUint8('reserved byte 2', '0x%x');
	// get reserved byte 3
	getAndPrintUint8('reserved byte 3', '0x%x');
	// get reserved byte 4
	getAndPrintUint8('reserved byte 4', '0x%x');

	/* global config setting */
	// get simlock_sfs_enum_type
	getAndPrintUint8('simlock_sfs_enum_type', '0x%x');
	// get simlock_device_mode_enum_type
	getAndPrintUint8('simlock_device_mode_enum_type', '0x%x');
	// get simlock_slot_policy_enum_type
	getAndPrintUint8('simlock_slot_policy_enum_type', '0x%x');
	// get simlock_subscription_policy_enum_type
	getAndPrintUint8('simlock_subscription_policy_enum_type', '0x%x');
	// get simlock_rsu_mode_enum_type
	getAndPrintUint8('simlock_rsu_mode_enum_type', '0x%x');
	// get slot_count
	getAndPrintUint8('slot_count', '0x%x');
	uint8 slotCount = y;

	/* slot setting */
	for (int i=0; i<slotCount; i++)
	{
		fprintf(stdout, "==============================parsing slot config: %d BEGIN==============================\n", i);
		// get slot_config_data_magic
		getAndPrintUint8('slot_config_data_magic', '0x%x');
		// get simlock_slot_enum_type
		getAndPrintUint8('simlock_slot_enum_type', '0x%x');
		// get simlock_disabled_slot_data_type
		getAndPrintUint8('simlock_disabled_slot_data_type', '0x%x');
		// get simlock_category_enum_count
		getAndPrintUint8('simlock_category_enum_count', '0x%x');
		uint8 categoryCount = y;

		/* category setting */
		for (int j=0; j<categoryCount; j++)
		{
			fprintf(stdout, "---------------------------parsing category config: %d BEGIN---------------------------\n", j);
			// get simlock_category_data_magic
			getAndPrintUint8('simlock_category_data_magic', '0x%x');
			// get simlock_status_enum_type
			getAndPrintUint8('simlock_status_enum_type', '0x%x');
			// get simlock_sfs_enum_type 
			getAndPrintUint8('simlock_sfs_enum_type', '0x%x');
			// get auto_lock
			getAndPrintUint8('auto_lock', '0x%x');
			// get is_blacklist
			getAndPrintUint8('is_blacklist', '0x%x');
			// get retry times
			getAndPrintUint8('retry times', '0x%x');

			/* simlock_category_data_type data */
			simlock_category_data_type categoryData;
			// read category enum type, store with 1 byte
			getAndPrintUint8('category_type', '0x%x');
			// store category_type
			categoryData.category_type = (simlock_category_enum_type)y;
			// categorySize temp to read, this contain only the code_data, we should subtract 1 byte category_type
			uint32 categorySize = sizeof(simlock_category_data_type) - 1;
			/* emmmm... fix the enum size first, in case of different enum size in different compiler */
			// runtime enum size
			uint8 enumSizeActual = sizeof(simlock_category_enum_type);
			// del of enum size
			int delEnumSize = enumSizeExpectd - enumSizeActual;
			fprintf(stdout, "delEnumSize=%d\n");
			// fix the categorySize to read, this contain only the code_data
			categorySize += delEnumSize;
			// read the category list buffer, it's uint8, can simply memcpy
			readLen = getData((uint8*)(&(categoryData.code_data)), categorySize);
			readTotalLen += readLen;
			// check read len
			if (readLen < categorySize)
			{
				fprintf(stderr, "expected to read 0x%x bytes categoryData, but actually read 0x%x bytes\n", categorySize, readLen);
				return 1;
			}
			// now data read, begin to print it.
			else
			{
				fprintf(stdout, "====get list buffer===, this should be handled based on category %d type\n", categorySize);
			}
			fprintf(stdout, "--------------------------- parsing category config: %d END ---------------------------\n", j);
		}
		fprintf(stdout, "============================== parsing slot config: %d END ==============================\n", i);
	}

	return readTotalLen;
}

/* test suit to check the base function */
void ParseConfigData::runTestSuit()
{
	ASSERT(configStore);
	ASSERT(xmlRoot);

	fprintf(stdout, "BEGIN: check FIRST slot tag, expect NO simlock_slot_enum_type get!\n");
	XMLElement *slot = xmlRoot->FirstChildElement("slot");
	ASSERT(slot);
	XMLElement *slot_enum = slot->FirstChildElement("simlock_slot_enum_type");
	ASSERT(!slot_enum);
	fprintf(stdout, "SUCCESS END: check FIRST slot tag, expect NO simlock_slot_enum_type get !\n");

	fprintf(stdout, "BEGIN: check SECOND slot tag, expect ONE simlock_slot_enum_type get!\n");
	slot = slot->NextSiblingElement("slot");
	ASSERT(slot);
	slot_enum = slot->FirstChildElement("simlock_slot_enum_type");
	ASSERT(slot_enum);
	ASSERT(123 == slot_enum->IntText());
	fprintf(stdout, "SUCCESS END: check SECOND slot tag, expect ONE simlock_slot_enum_type get!\n");
	
	configStore->runTestSuit();
}
