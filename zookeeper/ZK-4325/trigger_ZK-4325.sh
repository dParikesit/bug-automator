#! /bin/bash

cd "$1" || exit

sudo ./bin/zkServer.sh start || exit

(echo "create /a"; echo "create /a/b"; echo "ls /"; echo "ls /a"; echo "ls /a/b"; echo "deleteall /") | sudo ./bin/zkCli.sh -server 127.0.0.1:2181

echo -e "////////////////////////////////////////////////\n"

echo "Check that when we did \"ls /a\", only /a is shown, /a/b is not shown"
echo "Also check when we did \"deleteall /\", an error occured"

echo -e "\n////////////////////////////////////////////////\n"