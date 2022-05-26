SRCS= \
./dloader/pac.c ./dloader/nv.c ./dloader/test.c ./dloader/crc.c ./dloader/xml.c \
./FBFDownloader/WtptpDownloader.c ./FBFDownloader/asr1.c \
./aboot/ethos.c ./aboot/uip.c ./aboot/aboot.c \
./usbfs/usbfs.c main.c percent.c

CFLAGS += -Wall -Werror -O1 -s
LDFLAGS += -lpthread -ldl
CC=${CROSS_COMPILE}gcc

all: clean
	#sed -i 's/\s\+$$//g' *.c *.h Makefile
	${CC} ${CFLAGS} ${SRCS} -o qdloader ${LDFLAGS}
	#gcc -Wall -g -o0 -DNV_MAIN dloader/nv.c -o list_nv

clean:
	rm -rf list_nv qdloader lib
