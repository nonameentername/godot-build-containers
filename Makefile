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
	docker build -t godot-csound-ubuntu ./platform/ubuntu

web:
	docker build -t godot-csound-web ./platform/web

mingw:
	docker build -t godot-csound-mingw ./platform/mingw

osxcross:
	docker build -t godot-csound-osxcross ./platform/osxcross

ioscross:
	docker build -t godot-csound-ioscross ./platform/ioscross

android:
	docker build -t godot-csound-android ./platform/android
