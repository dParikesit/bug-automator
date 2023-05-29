#! /bin/bash

cd "$1" || exit

git stash
git checkout tags/cassandra-3.0.15
ant realclean
ant artifacts
chmod +x -R build/

echo Build successful