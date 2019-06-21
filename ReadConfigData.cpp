#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>

#include "ReadConfigData.h"
#include "oem.h"

/* new */
ReadConfigData::ReadConfigData(const char *dataFile)
	: readBufferLeft(0)
{
	ASSERT(dataFile);
	file = fopen(dataFile, "r+b");
	memset(readSectorBuffer, 0x0, BUFF_SIZE);
	readSectorPtr = readSectorBuffer;
}

/* release */
ReadConfigData::~ReadConfigData()
{
	fclose(file);
}

/* reset data */
void ReadConfigData::reset()
{
	memset(readSectorBuffer, 0x0, BUFF_SIZE);
	readSectorPtr = readSectorBuffer;
	readBufferLeft = 0;
}

/* get data from raw file */
uint32 ReadConfigData::get(uint8* data, uint32 length)
{
	uint32 readTotalLen = 0;

	while (length > 0)
	{
		uint32 readLen = 0;

		if (0 >= readBufferLeft)
		{
			readBufferLeft 	= fread(readSectorBuffer, 1, BUFF_SIZE, file);
			if (0 >= readBufferLeft)
			{
				#ifdef DEBUG
				fprintf(stdout, "expected %d bytes to read but no data left\n", length);
				#endif
				return readTotalLen;
			}
			readSectorPtr 	= readSectorBuffer;
		}

		readLen = length > readBufferLeft? readBufferLeft: length;

		memcpy(data, readSectorPtr, readLen);

		readBufferLeft 	-= readLen;
		readSectorPtr 	+= readLen;
		length 		-= readLen;
		data		+= readLen;
		readTotalLen 	+= readLen;
	}

	return readTotalLen;
}

/* test suit for ReadConfigData */
void ReadConfigData::runTestSuit()
{
	uint8 testStoreData[8] = {0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef};
	uint8 readStoreData[8] = {0};
	ASSERT(file);
	fwrite(testStoreData, 8, 1, file);
	fseek(file, 0, SEEK_SET);
	int readLen = get(readStoreData, 8);
	ASSERT(8 == readLen);
	ASSERT(memcmp(testStoreData, readStoreData, 8) == 0);
}
