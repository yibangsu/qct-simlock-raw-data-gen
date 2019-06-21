#ifndef __READ_CONFIG_DATA_H
#define __READ_CONFIG_DATA_H

#include "common_def.h"
#include <fcntl.h>

#define BUFF_SIZE	512

class ReadConfigData
{
private:
	FILE 	*file;

	uint8 	readSectorBuffer[BUFF_SIZE];
	uint8 	*readSectorPtr;
	uint32 	readBufferLeft;

	
public:
	ReadConfigData(const char *dataFile);
	~ReadConfigData();

	void reset();

	uint32 get(uint8* data, uint32 length);

	void runTestSuit();
};

#endif
