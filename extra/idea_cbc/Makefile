###############################################
# IDEA_CBC                                    #
# HAN                                         #
# ------------------------------------------- #
# source code in openssl                      #
# ------------------------------------------- #
###############################################

#****************************************************************************
# makefile setting
#****************************************************************************
# set BUILD_OS := win to build windows exe
BUILD_OS		:= linux
# set DEBUG := true to enable gdb
DEBUG			:= NO
# set GPROF : true to enable gp
GPROF			:= NO

#****************************************************************************

#****************************************************************************
# compiler define
#****************************************************************************

ifeq (win, ${BUILD_OS})
CC			:= i586-mingw32msvc-gcc
CXX			:= i586-mingw32msvc-g++
LD			:= i586-mingw32msvc-g++
RM			:= del /f /q
AR 			:= i586-mingw32msvc-ar
RANLIB			:= i586-mingw32msvc-ranlib
else
CC			:= gcc
CXX			:= g++
LD			:= g++
RM			:= rm -f
AR 			:= ar
RANLIB			:= ranlib
endif


#****************************************************************************
# build option
#****************************************************************************

DEBUG_CFLAGS		:= -Wall -Wno-format -g -DDEBUG -D_SUPPORT_PARSER_
RELEASE_CFLAGS		:= -Wall -Wno-unknown-pragmas -Wno-format -O3

DEBUG_LDFLAGS		:= -g
RELEASE_LDFLAGS		:= 

INCS			:= -I./ -I./include
LIBS			:= 

ifeq (true, ${DEBUG})
	CFLAGS		:= ${DEBUG_CFLAGS}
	CXXFLAGS	:= ${DEBUG_CXXFLAGS}
	LDFLAGS		:= ${DEBUG_LDFLAGS}
else
	CFLAGS		:= ${RELEASE_CFLAGS}
	CXXFLAGS	:= ${RELEASE_CXXFLAGS}
	LDFLAGS		:= ${RELEASE_LDFLAGS}
endif

ifeq (true, ${GPROF})
	CFLAGS		:= ${CFLAGS} -pg -O3
	CXXFLAGS	:= ${CXXFLAGS} -pg -O3
	LDFLAGS		:= ${LDFLAGS} -pg
endif

#****************************************************************************
# Makefile code common to all platforms
#****************************************************************************

CFLAGS			:= ${CFLAGS}   ${DEFS}
CXXFLAGS		:= ${CXXFLAGS} ${DEFS}
ARFLAGS 		:= -cr

#****************************************************************************
# Targets of the build
#****************************************************************************

ifeq (win, ${BUILD_OS})
TARGET			:= idea_cbc_test.exe
else
TARGET			:= idea_cbc_test
endif

# set default target 
all: ${TARGET}

#****************************************************************************
# Source files
#****************************************************************************
SRC			:= ${wildcard ./*.c}

#****************************************************************************
# Output
#****************************************************************************

${TARGET}: ${patsubst %.c, %.o, $(SRC)}
	${LD} -o $@ $^ ${LDFLAGS} ${LIBS}

# Rules for compiling source files to object files
%.o : %.cpp
	${CXX} -c ${CXXFLAGS} ${INCS} $< -o $@

%.o : %.c
	${CC} -c ${CFLAGS} ${INCS} $< -o $@

staticlib: libidea_cbc.a

libidea_cbc.a: i_cbc.o i_skey.o
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

c:clean

clean:
	-rm -f ${TARGET} ${patsubst %.c, %.o, $(SRC)} ${patsubst %.c, %.d, $(SRC)}

# auto dependence
# 定义头文件依赖
CPP_OBJS_D	= ${patsubst %.cpp, %.d, $(CPP_SRC)}
C_OBJS_D	= ${patsubst %.c, %.d, $(C_SRC)}
include $(CPP_OBJS_D)
include $(C_OBJS_D)

$(CPP_OBJS_D): %.d : %.cpp
	set -e; rm -f $@;
	$(CXX) $(INCPATH) -MM $(CXXFLAGS) $< > $@;

$(C_OBJS_D): %.d : %.c
	set -e; rm -f $@;
	$(CC) $(INCPATH) -MM $(CFLAGS) $< > $@;
