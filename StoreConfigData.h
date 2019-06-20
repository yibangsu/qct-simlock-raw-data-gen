#ifndef __STORE_CONFIG_DATA_H
#define __STORE_CONFIG_DATA_H

#include "common_def.h"
#include <fcntl.h>

#define BUFF_SIZE	512

class StoreConfigData
{
private:
	FILE 	*file;

	uint8 	sectorBuffer[BUFF_SIZE];
	uint8 	*sectorPtr;
	uint32 	sBufferLeft;

	uint8 	readSectorBuffer[BUFF_SIZE];
	uint8 	*readSectorPtr;
	uint32 	readBufferLeft;

	
public:
	StoreConfigData(const char *dataFile);
	~StoreConfigData();

	void reset();
	int store(uint8* data, uint32 length);
	int push();

	uint32 get(uint8* data, uint32 length);

	void runTestSuit();
};

#endif
