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
{
	ASSERT(dataFile);
	file = fopen(dataFile, "w+b");
	memset(sectorBuffer, 0x0, BUFF_SIZE);
	sectorPtr = sectorBuffer;
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
			#ifdef DEBUG
			fprintf(stdout, "write data failed\n");
			#endif
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

/* test suit for StoreConfigData */
void StoreConfigData::runTestSuit()
{
	uint8 testStoreData[8] = {0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef};
	ASSERT(file);
	store(testStoreData, 8);
	ASSERT((sBufferLeft + 8) == BUFF_SIZE);
	int writeLen = push();
	ASSERT(8 == writeLen);
}
