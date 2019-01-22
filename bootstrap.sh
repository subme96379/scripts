#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
NC='\033[0m'

echo -e ${YELLOW}"Welcome to the Northern Automated Bootstrap uodate."${NC}
echo "Please wait while updates are performed to bring your Master Node up to date..."
sleep 5
echo "Stopping first node, please wait...";
northern-cli -datadir=/home/northern/.northern stop
echo "Stopping second node, please wait...";
northern-cli -datadir=/home/northern2/.northern stop
echo "Stopping third node, please wait...";
northern-cli -datadir=/home/northern3/.northern stop
echo "cStopping fourth node, please wait...";
northern-cli -datadir=/home/northern4/.northern stop
sleep 10
echo "Removing binaries..."
cd /home/northern/.northern/blocks/
echo "Downloading Bootstrap file"
echo "Updating 1st Master Node Block files, please wait...";
wget -O bootstrap.dat https://drive.google.com/file/d/1vng25FoBP4sxzf3p43dRqf92dJuISZ5j/view?usp=sharing
sleep 5
echo "Downloading Bootstrap file"
echo "Updating 2nd Master Node Block files, please wait...";
mkdir /home/northern/.northern2/blocks/
cd /home/northern/.northern2/blocks/
wget -O bootstrap.dat https://drive.google.com/file/d/1vng25FoBP4sxzf3p43dRqf92dJuISZ5j/view?usp=sharing
sleep 5
echo "Downloading Bootstrap file"
echo "Updating 3rd Master Node Block files, please wait...";
mkdir /home/northern/.northern3/blocks/
cd /home/northern/.northern3/blocks/
wget -O bootstrap.dat https://drive.google.com/file/d/1vng25FoBP4sxzf3p43dRqf92dJuISZ5j/view?usp=sharing
sleep 5
echo "Downloading Bootstrap file"
echo "Updating last Master Node Block files, please wait...";
mkdir /home/northern/.northern4/blocks/
cd /home/northern/.northern4/blocks/
wget -O bootstrap.dat https://drive.google.com/file/d/1vng25FoBP4sxzf3p43dRqf92dJuISZ5j/view?usp=sharing
sleep 10
echo "Syncing first node, please wait...";
northernd -datadir=/home/northern/.northern -daemon -dbcache=1000
until northern-cli -datadir=/home/northern/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing second node, please wait...";
northernd -datadir=/home/northern2/.northern -daemon -dbcache=1000
until northern-cli -datadir=/home/northern2/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing third node, please wait...";
northernd -datadir=/home/northern3/.northern -daemon -dbcache=1000
until northern-cli -datadir=/home/northern3/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
northernd -datadir=/home/northern4/.northern -daemon -dbcache=1000
until northern-cli -datadir=/home/northern4/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Fourth node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "The END. You can close now the SSH terminal session";
