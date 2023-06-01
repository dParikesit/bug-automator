#! /bin/bash

cd "$1" || exit

sudo ./bin/zkServer.sh start || exit

(sleep 30; echo quit) | sudo ./bin/zkCli.sh -server 127.0.0.1:2181

echo -e "////////////////////////////////////////////////\n"

echo "ls result: "
ls version-2/
echo "Check that there are 2 snapshots"
echo "snapshot.1 is generated because of the bug"

echo -e "\n////////////////////////////////////////////////\n"