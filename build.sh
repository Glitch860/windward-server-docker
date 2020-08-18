#!/bin/bash

echo "Building docker image..."
docker build . -t reimashi/windward:latest
