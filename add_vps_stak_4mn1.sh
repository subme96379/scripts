#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

echo -e ${YELLOW}"Welcome to the Northern Automated Update 2.4.0 (4in1)."${NC}
echo "Please wait while updates are performed..."
sleep 5
echo "Stopping first node, please wait...";
northern-cli -datadir=/home/northern/.northern stop
echo "Stopping second node, please wait...";
northern-cli -datadir=/home/northern2/.northern stop
echo "Stopping third node, please wait...";
northern-cli -datadir=/home/northern3/.northern stop
echo "Stopping fourth node, please wait...";
northern-cli -datadir=/home/northern4/.northern stop
sleep 10
echo "Removing binaries..."
cd /usr/local/bin
rm -rf northernd northern-cli northern-tx
echo "Downloading latest binaries"
wget https://github.com/zabtc/Northern/releases/download/2.4.0/northern-2.4.0-x86_64-linux-gnu.tar.gz
tar -xzf northern-2.4.0-x86_64-linux-gnu.tar.gz
sudo chmod 755 -R  /usr/local/bin/northern*
rm -rf northern-2.4.0-x86_64-linux-gnu.tar.gz
echo "Deleting old nodes from node config files"
sed -i '/addnode/d' /home/northern/.northern/northern.conf
sed -i '/addnode/d' /home/northern2/.northern/northern.conf
sed -i '/addnode/d' /home/northern3/.northern/northern.conf
sed -i '/addnode/d' /home/northern4/.northern/northern.conf

echo "Adding new nodes..."
echo "addnode=45.77.62.203" >> /home/northern/.northern/northern.conf
echo "addnode=207.148.3.46" >> /home/northern/.northern/northern.conf
echo "addnode=136.243.185.24" >> /home/northern/.northern/northern.conf
echo "addnode=107.173.141.125" >> /home/northern/.northern/northern.conf
echo "staking=1" >> /home/northern/.northern/northern.conf

echo "addnode=45.77.62.203" >> /home/northern2/.northern/northern.conf
echo "addnode=207.148.3.46" >> /home/northern2/.northern/northern.conf
echo "addnode=136.243.185.24" >> /home/northern2/.northern/northern.conf
echo "addnode=107.173.141.125" >> /home/northern2/.northern/northern.conf
echo "staking=1" >> /home/northern2/.northern/northern.conf

echo "addnode=45.77.62.203" >> /home/northern3/.northern/northern.conf
echo "addnode=207.148.3.46" >> /home/northern3/.northern/northern.conf
echo "addnode=136.243.185.24" >> /home/northern3/.northern/northern.conf
echo "addnode=107.173.141.125" >> /home/northern3/.northern/northern.conf
echo "staking=1" >> /home/northern/.northern/northern.conf

echo "addnode=45.77.62.203" >> /home/northern4/.northern/northern.conf
echo "addnode=207.148.3.46" >> /home/northern4/.northern/northern.conf
echo "addnode=136.243.185.24" >> /home/northern4/.northern/northern.conf
echo "addnode=107.173.141.125" >> /home/northern4/.northern/northern.conf
echo "staking=1" >> /home/northern/.northern/northern.conf

echo "Syncing first node, please wait...";
northernd -datadir=/home/northern/.northern -daemon -staking=1 -masternode=1 
until northern-cli -datadir=/home/northern/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
northern-cli -datadir=/home/northern/.northern getnewaddress
northern-cli -datadit=/home/northern/.northern masternode debug
echo -e ${GREEN}"First node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 1!"${NC}
sleep 5
echo "Syncing second node, please wait...";
northernd -datadir=/home/northern2/.northern -daemon -staking=1 -masternode=1
until northern-cli -datadir=/home/northern2/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
northern-cli -datadir=/home/northern2/.northern getnewaddress
northern-cli -datadit=/home/northern2/.northern masternode debug
echo -e ${GREEN}"Second node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 2!"${NC}
sleep 5
echo "Syncing third node, please wait...";
northernd -datadir=/home/northern3/.northern -daemon -staking=1 -masternode=1
until northern-cli -datadir=/home/northern3/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
northern-cli -datadir=/home/northern3/.northern getnewaddress
northern-cli -datadit=/home/northern3/.northern masternode debug
echo -e ${GREEN}"Third node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 3!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
northernd -datadir=/home/northern4/.northern -daemon -staking=1 -masternode=1
until northern-cli -datadir=/home/northern4/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
northern-cli -datadir=/home/northern4/.northern getnewaddress
northern-cli -datadit=/home/northern4/.northern masternode debug
echo -e ${GREEN}"Fourth node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 4!"${NC}
sleep 5
echo "Deleting temporary files"
rm -rf /root/northern_4masternodes_update.sh
cd ~
echo -e ${RED}"Don't forget to copy the wallet address for each node if you plan on having more than 1 staking!"${NC}
echo "The END. You can close now the SSH terminal session";
