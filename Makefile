STANDALONE_TOOLCHAIN ?= $(HOME)/src/android-ndk-r11c/sysroot-arm/bin

CC    = $(STANDALONE_TOOLCHAIN)/arm-linux-androideabi-gcc
CXX   = $(STANDALONE_TOOLCHAIN)/arm-linux-androideabi-g++
CPP   = $(STANDALONE_TOOLCHAIN)/arm-linux-androideabi-g++
STRIP = $(STANDALONE_TOOLCHAIN)/arm-linux-androideabi-strip

CPPFLAGS = -std=c++11 -O3 -Wall
LDFLAGS  = -pthread -static
INCLUDES = -I$(PWD)/../include

TMPDIR  = /data/local/tmp/
TARGET ?= rh-test

all: $(TARGET)

rh-test: rh-test.o ion.o rowsize.o templating.o massage.o
	$(CPP) $(CPPFLAGS) -o $@ $^ $(LDFLAGS)
	$(STRIP) $@

%.o: %.cc
	$(CPP) $(CPPFLAGS) $(INCLUDES) -c -o $@ $<

install:
	make all
	adb push $(TARGET) $(TMPDIR)
	adb shell chmod 755 $(TMPDIR)$(TARGET)

clean:
	rm -f $(TARGET) *.o a.out

upload:
	scp rh-test vvdveen.com:/home/vvdveen/www/drammer/rh-test
	

reboot:
	adb reboot

test:
	adb shell "$(TMPDIR)$(TARGET) -f/data/local/tmp/out.txt"
