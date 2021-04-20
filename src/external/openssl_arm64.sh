#!/usr/bin/bash
#openssl
# export ANDROID_NDK_ROOT="${PWD}/../build/external/android/android-ndk-r14b"
export ANDROID_NDK_ROOT="/home/wangyu/OCV/Immersive-Video-Sample/src/build/external/android/android-ndk-r21e"
# export ANDROID_NDK_ROOT="/home/wangyu/OCV/Immersive-Video-Sample/src/build/external/android/android-ndk-r14b"

# export ANDROID_NDK_HOME="/home/wangyu/OCV/Immersive-Video-Sample/src/build/external/android/android-ndk-r21e"
# cd ../build/external/android/openssl-1.1.0f/
cd ../build/external/android/openssl-1.1.1k/
if [ ! -d "./build" ];then
    mkdir build
fi
cd build
#../../setenv-android_armv8.sh arm64-v8a
source ../../../../../external/env_openssl_arm64.sh
#../config shared --openssldir=/home/media/Codes/OMAF_android/build/external/openssl-output --prefix=/home/media/Codes/OMAF_android/build/external/openssl-output
#../config shared no-ssl2 no-ssl3 no-comp no-hw --openssldir=${PWD}/../../openssl-output --prefix=${PWD}/../../openssl-output
../Configure shared no-ssl2 no-ssl3 no-comp no-hw android64-aarch64 -D__ANDROID_API__=28 --openssldir=${PWD}/../../openssl-output --prefix=${PWD}/../../openssl-output
patch -p1 < ../../../../../external/0001-SSL-Modify-Makefile.patch
make clean
make depend
make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" MAKE="make -e" all
#make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" build_libs
make install
