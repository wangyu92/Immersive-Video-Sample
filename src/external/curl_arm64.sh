#!/usr/bin/bash
#curl
cd ../build/external/android/curl-7.76.1
cp ../../../../external/env_curl_withssl.sh ./
./env_curl_withssl.sh arm64-v8a
make clean
make -j
make install
