#!/bin/sh

SERVER_PATH="/windward/"
SERVER_BIN="${SERVER_PATH}WWServer.exe"

echo "Generating admin.txt file..."

mkdir -p ${SERVER_PATH}ServerConfig
echo ${WINDWARD_ADMINS} | sed -e 's/,/\n/g' > ${SERVER_PATH}ServerConfig/admin.txt

echo "Running game..."

chmod u+x ${SERVER_BIN}

SERVER_PUBLIC=""
if [ ${WINDWARD_PUBLIC} -eq "1" ]; then 
    echo "INFO!!: The server is running in public mode"; 
    SERVER_PUBLIC=" -public";
fi

mono ${SERVER_BIN} -service -name "${WINDWARD_SERVER_NAME}" -world "${WINDWARD_SERVER_WORLD}" -tcp ${WINDWARD_SERVER_PORT} -http ${SERVER_PUBLIC}