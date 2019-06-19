#include "common_def.h"
#include "simlock_common.h"
#include "tinyxml2.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "oem.h"
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <assert.h>

using namespace std;
using namespace tinyxml2;

#define BUFF_SIZE	512

class StoreConfigData
{
private:
	int 	fd;

	uint8 	sectorBuffer[BUFF_SIZE];
	uint8 	*sectorPtr;
	uint32 	sBufferLeft;

	uint8 	readSectorBuffer[BUFF_SIZE];
	uint8 	*readSectorPtr;
	uint32 	readBufferLeft;

	
public:
	StoreConfigData(int fd);
	~StoreConfigData();

	void reset();
	int store(uint8* data, uint32 length);
	int push();

	uint32 get(uint8* data, uint32 length);

	void runTestSuit();
};
