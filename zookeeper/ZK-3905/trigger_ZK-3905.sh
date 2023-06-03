#! /bin/bash

cd "$1" || exit

sudo ./bin/zkServer.sh start || exit

(sleep 3; echo quit) | sudo ./bin/zkCli.sh -server 127.0.0.1:2183

echo "authProvider.authfail=org.apache.zookeeper.server.quorum.AuthFailX509AuthenticationProvider" >> ./conf/zoo.cfg
echo "ssl.authProvider=authfail" >> ./conf/zoo.cfg

# SHOULD WE RESTART SERVER HERE?
# sudo ./bin/zkServer.sh restart || exit
# If we restart, then the bug will not occur even in the supposedly buggy version (client will fail to connect)
# If we don't restart, then the client will still connect in the supposedly fixed version

(sleep 3; echo quit) | sudo ./bin/zkCli.sh -server 127.0.0.1:2183

echo -e "\n////////////////////////////////////////////////\n"

echo "Notice that in the second try, client connected successfully where it should not connects"

echo -e "\n////////////////////////////////////////////////\n"
