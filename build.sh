#!/bin/bash

SERVER_REMOTE_FILE=http://www.tasharen.com/windward/WWServer.zip
SERVER_TEMP_FILE=./WWServer.zip

echo "Downloading latest dedicated server..."
curl -O -J -L ${SERVER_REMOTE_FILE}
unzip ${SERVER_TEMP_FILE}
rm ${SERVER_TEMP_FILE}

echo "Compiling to native code..."
#mkbundle --static -o ./WWServer ./WWServer.exe --deps --cross default -z
#rm ./WWServer.exe

echo "Building docker image..."
docker build . -t reimashi/windward:latest -t reimashi/windward:alpine-3.7
rm ./WWServer.exe
