#! /bin/bash

cd "$1" || exit

sudo ./bin/zkServer.sh start || exit

(sleep 3; echo quit) | sudo ./bin/zkCli.sh -server 127.0.0.1:2183

cat ./logs/*.out

echo -e "////////////////////////////////////////////////\n"

echo "Above are the server logs"
echo "Notice that javax.net.ssl.SSLHandshakeException: Received fatal alert: handshake_failure is caused by the bug"

echo -e "\n////////////////////////////////////////////////\n"
