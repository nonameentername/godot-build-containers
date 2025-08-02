UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
PLATFORM=linux
else ifeq ($(UNAME), Darwin)
PLATFORM=osx
else
PLATFORM=windows
endif

UNAME := $(shell uname)
ifeq ($(UNAME), Windows)
    UID=1000
    GID=1000
else
    UID=`id -u`
    GID=`id -g`
endif

SHELL_COMMAND = bash

all: ubuntu mingw osxcross ioscross android web 

ubuntu:
	docker build -t godot-ubuntu ./platform/ubuntu

web:
	docker build -t godot-web ./platform/web

mingw:
	docker build -t godot-mingw ./platform/mingw

osxcross:
	docker build -t godot-osxcross ./platform/osxcross

ioscross:
	docker build -t godot-ioscross ./platform/ioscross

android:
	docker build -t godot-android ./platform/android
