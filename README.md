godot-build-containers
======================

[![docker_builds](https://github.com/nonameentername/godot-build-containers/actions/workflows/build_images.yml/badge.svg)](https://github.com/nonameentername/godot-build-containers/actions/workflows/build_images.yml)

Godot engine build containers for my various projects.

How to Build
------------

This project uses docker to build the project for different platforms.
The build scripts were developed using Ubuntu (x86_64).


## Instructions

1. Install docker using apt:

```bash
sudo apt install docker.io
```

2. Add user to docker group:

```bash
sudo usermod -a -G docker $USER
```

3. Initialize git submodules:

```bash
git submodule update --init --recursive
```

4. Download XCode 15.1 with the iOS SDK (you must be logged into an Apple ID to download Xcode).

5. In the folder containing the Xcode_15.1.xip file start an HTTP server to host the file:

```bash
python -m http.server 8000
```

6. Build project using make:

```bash
#build all platforms
make all

#build for ubuntu
make ubuntu

#build for windows
make mingw

#build for MacOS
make osxcross

#build for iOS
make ioscross

#build for Android
make android

#build for web
make web
```
