###############################################
# simlock data generator tool                 #
# HAN                                         #
# ------------------------------------------- #
# version 1.0, create by suyibang             #
# ------------------------------------------- #
###############################################


#****************************************************************************
# makefile setting
#****************************************************************************

# set BUILD_OS := win to build windows exe
ifeq (, ${BUILD_OS})
BUILD_OS		:= linux
endif
# set DEBUG := YES to enable gdb
ifeq (, ${DEBUG})
DEBUG			:= YES
endif
# set GPROF : YES to enable gp
ifeq (, ${GPROF})
GPROF			:= NO
endif
# set version_major value
ifeq (, ${version_major})
version_major		:= 1
endif
# set version_min value
ifeq (, ${version_min})
version_min		:= 0
endif
# set config_magic value
ifeq (, ${config_magic})
config_magic		:= 0xA5
endif
# set slot_magic value
ifeq (, ${slot_magic})
slot_magic		:= 0x5A
endif
# set category_magic value
ifeq (, ${category_magic})
category_magic		:= 0xAA
endif
# set signature_magic value
ifeq (, ${signature_magic})
signature_magic		:= 0x55
endif
# set skip unregonized code, set TRUE to enable
ifeq (, ${SKIP_UNREG_CODE})
SKIP_UNREG_CODE		:= FALSE
endif

# set xml parser tool, locale at ./extra/xxx
XML_DIR			:= tinyxml2
XML_TARGET		:= libtinyxml2.a
XML_LIB			:= -ltinyxml2
XML_INC			:= ./

#****************************************************************************
# compiler define
#****************************************************************************

ifeq (win, ${BUILD_OS})
CC			:= i586-mingw32msvc-gcc
CXX			:= i586-mingw32msvc-g++
LD			:= i586-mingw32msvc-g++
RM			:= del /f /q
else
CC			:= gcc
CXX			:= g++
LD			:= g++
RM			:= rm -f
endif

#****************************************************************************
# build option
#****************************************************************************

DEBUG_CFLAGS		:= -Wall -Wno-format -g -DDEBUG  
RELEASE_CFLAGS		:= -Wall -Wno-unknown-pragmas -Wno-format -O3 

DEBUG_LDFLAGS		:= -g 
RELEASE_LDFLAGS		:= 

INCS			:= -I./ -I./inc -I./extra/${XML_DIR}/${XML_INC} -I/usr/include
LIBS			:= -L./extra/${XML_DIR} ${XML_LIB} -lcrypto -lpthread

ifeq (YES, ${GPROF})
	CFLAGS		:= ${CFLAGS} -pg -O3
	LDFLAGS		:= ${LDFLAGS} -pg
endif

ifeq (YES, ${DEBUG})
	CFLAGS		:= ${DEBUG_CFLAGS}
	CXXFLAGS	:= ${DEBUG_CFLAGS}
	LDFLAGS		:= ${DEBUG_LDFLAGS}
else
	CFLAGS		:= ${RELEASE_CFLAGS}
	CXXFLAGS	:= ${RELEASE_CFLAGS}
	LDFLAGS		:= ${RELEASE_LDFLAGS}
endif

#ifeq (YES, ${SKIP_UNREG_CODE})
#	CFLAGS		:= ${CFLAGS} -DSKIP_UNREG_CODE
#	CXXFLAGS	:= ${CXXFLAGS} -DSKIP_UNREG_CODE
#endif
# define in oem.h, make the user clear whether set SKIP_UNREG_CODE or NOT

#****************************************************************************
# Makefile code common to all platforms
#****************************************************************************

CFLAGS			:= ${CFLAGS}   ${DEFS}
CXXFLAGS		:= ${CXXFLAGS} ${DEFS} -std=c++11
CXXLDFLAGS		:= ${LDFLAGS} -std=c++11

#****************************************************************************
# Source files
#****************************************************************************
SRC			:= ${wildcard ./*.cpp}

#****************************************************************************
# build target
#****************************************************************************

ifeq (win, ${BUILD_OS})
TARGET			:= simlock_data_gen.exe
else
TARGET			:= simlock_data_gen
endif

# set default target 
all: ${TARGET}

${TARGET}: oemMark ${patsubst %.cpp, %.o, ${SRC}} xmlParse
	${LD} -o $@ ${patsubst %.cpp, %.o, ${SRC}} ${LIBS} ${CXXLDFLAGS}

xmlParse:
	make -C ./extra/${XML_DIR} ${XML_TARGET}

# Rules for compiling source files to object files
%.o: %.c
	${CC} -c ${CFLAGS} ${INCS} $< -o $@

%.o: %.cpp
	${CXX} -c ${CXXFLAGS} ${INCS} $< -o $@

c: clean

clean: xmlParseClean
	${RM} ${TARGET}
	${RM} ${patsubst %.cpp, %.o, $(SRC)}
	${RM} ${patsubst %.cpp, %.d, $(SRC)}

xmlParseClean:
	make -C ./extra/${XML_DIR} clean

rebuild: clean all

# Create oem.h
OEM_FILE		:= ./inc/oem.h
oemMark:
	@echo "#ifndef __OEM_DEFINE_H"								>  ${OEM_FILE}
	@echo "#define __OEM_DEFINE_H"								>> ${OEM_FILE}
	@echo ""										>> ${OEM_FILE}
	@echo "#define VERSION_MAJOR	${version_major}"					>> ${OEM_FILE}
	@echo "#define VERSION_MIN	${version_min}"						>> ${OEM_FILE}
	@echo "#define CONFIG_MAGIC	${config_magic}"					>> ${OEM_FILE}
	@echo "#define SLOT_MAGIC	${slot_magic}"						>> ${OEM_FILE}
	@echo "#define CATEGORY_MAGIC	${category_magic}"					>> ${OEM_FILE}
	@echo "#define SIG_MAGIC	${signature_magic}"					>> ${OEM_FILE}
	@echo "#define SKIP_UNREG_CODE_${SKIP_UNREG_CODE}"					>> ${OEM_FILE}
	@echo ""										>> ${OEM_FILE}
	@echo "#endif"										>> ${OEM_FILE}

#****************************************************************************
# auto dependence
#****************************************************************************
#C_OBJS_D	= ${patsubst %.c, %.d, $(SRC)} 
#include $(C_OBJS_D)
#$(C_OBJS_D): %.d : %.c
#	set -e; ${RM} $@;
#	$(CC) $(INCS) -MM $(CFLAGS) $< > $@;

CPP_OBJS_D	= ${patsubst %.cpp, %.d, $(SRC)}
include $(CPP_OBJS_D)
$(CPP_OBJS_D): %.d : %.cpp
	set -e; ${RM} $@;
	$(CXX) $(INCS) -MM $(CXXFLAGS) $< > $@;

