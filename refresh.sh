#/bin/bash

cd ~
cd /usr/local/bin
./northern-cli stop
rm -rf northernd northern-cli northern-tx
wget https://github.com/zabtc/Northern/releases/download/2.4.0/northern-2.4.0-x86_64-linux-gnu.tar.gz
tar -xzf northern-4.2.0-x86_64-linux-gnu.tar.gz
rm -rf northern-2.4.0-x86_64-linux-gnu.tar.gz
./northernd -daemon
sleep 30
./northern-cli getinfo
