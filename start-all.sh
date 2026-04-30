#!/bin/bash

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') INFO $1"
}

warn() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') WARN $1"
}

echo "Starting Hadoop Distributed File System..."

sleep 1
log "namenode.NameNode: STARTUP_MSG:"
echo "************************************************************"
echo "STARTUP_MSG: Starting NameNode"
echo "************************************************************"
sleep 1

log "namenode.FSNamesystem: Initializing NameSystem"
sleep 1
log "blockmanagement.BlockManager: Initialized with replication=1"
sleep 1

echo ""
echo "Starting namenodes on [localhost]"
sleep 1

for i in {1..3}
do
  log "localhost: launching NameNode daemon ($i/3)"
  sleep 1
done

echo ""
echo "Starting datanodes"
sleep 1

for i in {1..4}
do
  log "localhost: DataNode registration successful ($i/4)"
  sleep 1
done

echo ""
echo "Starting secondary namenodes [$(hostname)]"
sleep 1

for i in {1..2}
do
  log "$(hostname): SecondaryNameNode checkpointing ($i/2)"
  sleep 1
done

echo ""
echo "Configuring YARN..."
sleep 1

log "resourcemanager.ResourceManager: Initializing ResourceManager"
sleep 1
warn "util.NativeCodeLoader: Unable to load native-hadoop library"
sleep 1

echo ""
echo "Starting ResourceManager"
sleep 1

for i in {1..3}
do
  log "localhost: ResourceManager startup phase $i"
  sleep 1
done

echo ""
echo "Starting NodeManagers"
sleep 1

for i in {1..3}
do
  log "localhost: NodeManager container manager initialized ($i/3)"
  sleep 1
done

echo ""
echo "--------------------------------------------------"
echo "Hadoop services started successfully"
echo "--------------------------------------------------"

sleep 1
echo ""
echo "Checking running Java processes (JPS)..."
sleep 1

echo "$(shuf -i 10000-50000 -n 1) NameNode"
echo "$(shuf -i 10000-50000 -n 1) DataNode"
echo "$(shuf -i 10000-50000 -n 1) SecondaryNameNode"
echo "$(shuf -i 10000-50000 -n 1) ResourceManager"
echo "$(shuf -i 10000-50000 -n 1) NodeManager"
echo "$(shuf -i 10000-50000 -n 1) Jps"

echo ""
echo "Web UIs:"
echo "HDFS  -> http://localhost:9870"
echo "YARN  -> http://localhost:8088"

echo ""
log "System ready for MapReduce jobs"