#ifndef __CHIPSET_H
#define __CHIPSET_H


// mark all type of chipset,
// but we'd better set the chipset in makefile,
// then we can compile the certatn tool for the certain chipset.
// emmm..., and we should set a chipset mark of the raw data.
typedef enum: uint8
{
	CHIPSET_START = 0,

	QCOM_MSM8905_JO_3_1,

	CHIPSET_END,
} chipset_type;
#endif
