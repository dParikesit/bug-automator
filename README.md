# Bug Automator

> Run buggy case automatically

## How to run
1. Clone cassandra to a folder and copy the absolute path
2. Allow script execution
```
chmod +x -R .
```
3. Run the `all` script. `NOTE THAT SOME SCRIPTS REQUIRE sudo`
```
./cassandra/CASSANDRA-14803/all_CASSANDRA-14803.sh <cassandra absolute path>

# or

sudo ./zookeeper/ZK-3832/all_ZK-3832.sh <zookeeper absolute path>
```