#! /bin/bash

# Uncomment and change if JAVA_HOME or mvn or java not detected
# PATH=$PATH:/home/dparikesit/.sdkman/candidates/java/current/bin:/home/dparikesit/.sdkman/candidates/maven/current/bin
# JAVA_HOME=/home/dparikesit/.sdkman/candidates/java/current

script_dir=$( dirname -- "$( readlink -f -- "$0"; )"; )

cd "$1" || exit

git stash
git checkout tags/release-3.6.2

sudo rm -rf logs/ version-2/

mvn clean install -DskipTests -Dmaven.test.skip=true -Dmaven.site.skip=true -Dmaven.javadoc.skip=true || exit
chmod +x -R bin/

cp $script_dir/zoo.cfg ./conf
echo dataDir=$1 >> ./conf/zoo.cfg

sed -i "1 a JAVA_HOME=$JAVA_HOME" ./bin/zkEnv.sh

echo Build successful