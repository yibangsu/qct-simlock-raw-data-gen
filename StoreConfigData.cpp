#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>

#include "StoreConfigData.h"
#include "oem.h"

/* new */
StoreConfigData::StoreConfigData(const char *dataFile)
	: sBufferLeft(BUFF_SIZE)
	, readBufferLeft(0)
{
	file = fopen(dataFile, "w+b");
	memset(sectorBuffer, 0x0, BUFF_SIZE);
	sectorPtr = sectorBuffer;
	memset(readSectorBuffer, 0x0, BUFF_SIZE);
	readSectorPtr = readSectorBuffer;
}

/* release */
StoreConfigData::~StoreConfigData()
{
	push();
	fclose(file);
}

/* reset data */
void StoreConfigData::reset()
{
	memset(sectorBuffer, 0x0, BUFF_SIZE);
	sectorPtr = sectorBuffer;
	sBufferLeft = BUFF_SIZE;
	memset(readSectorBuffer, 0x0, BUFF_SIZE);
	readSectorPtr = readSectorBuffer;
	readBufferLeft = 0;
}

/* store data */
int StoreConfigData::store(uint8* data, uint32 length)
{
	while (length > sBufferLeft)
	{
		memcpy(sectorPtr, data, sBufferLeft);
		data += sBufferLeft;
		length -= sBufferLeft;

		if (!fwrite(sectorBuffer, BUFF_SIZE, 1, file))
		{
			return -1;
		}
		memset(sectorBuffer, 0x0, BUFF_SIZE);
		sBufferLeft = BUFF_SIZE;
		sectorPtr = sectorBuffer;
	}

	// copy the left data
	if (length > 0)
	{
		memcpy(sectorPtr, data, length);
		sectorPtr += length;
		sBufferLeft -= length;
	}

	return 0;
}

/* push write data */
int StoreConfigData::push()
{
	int writeLen = 0;

	if (BUFF_SIZE > sBufferLeft)
	{
		writeLen = fwrite(sectorBuffer, 1, BUFF_SIZE - sBufferLeft, file);
		memset(sectorBuffer, 0x0, BUFF_SIZE);
		sBufferLeft = BUFF_SIZE;
		sectorPtr = sectorBuffer;
	}

	return writeLen;
}

/* get data from raw file */
uint32 StoreConfigData::get(uint8* data, uint32 length)
{
	uint32 readTotalLen = 0;

	while (length > 0)
	{
		uint32 readLen = 0;

		if (0 >= readBufferLeft)
		{
			readBufferLeft 	= fread(readSectorBuffer, 1, BUFF_SIZE, file);
			if (0 >= readBufferLeft) return readTotalLen;
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

/* test suit for StoreConfigData */
void StoreConfigData::runTestSuit()
{
	uint8 testStoreData[8] = {0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef};
	uint8 readStoreData[8] = {0};
	ASSERT(file);
	store(testStoreData, 8);
	ASSERT((sBufferLeft + 8) == BUFF_SIZE);
	int writeLen = push();
	ASSERT(8 == writeLen);
	fseek(file, 0, SEEK_SET);
	int readLen = get(readStoreData, 8);
	ASSERT(8 == readLen);
	ASSERT(memcmp(testStoreData, readStoreData, 8) == 0);
	fseek(file, 0, SEEK_SET);
}
