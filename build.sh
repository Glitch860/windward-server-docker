#!/bin/bash

SERVER_REMOTE_FILE=http://www.tasharen.com/windward/WWServer.zip
SERVER_TEMP_FILE=./WWServer.zip

echo "Compiling to native code..."
#mkbundle --static -o ./WWServer ./WWServer.exe --deps --cross default -z
#rm ./WWServer.exe

echo "Building docker image..."
docker build . -t reimashi/windward:latest -t reimashi/windward:alpine-3.7
