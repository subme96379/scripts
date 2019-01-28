cd ~
cd /usr/local/bin
./northern-cli stop
rm -rf northernd northern-cli northern-tx
wget https://github.com/zabtc/Northern/releases/download/2.4.0/northern-2.4.0-x86_64-linux-gnu.tar.gz
tar -xzf northern-2.4.0-x86_64-linux-gnu.tar.gz
rm -rf northern-2.4.0-x86_64-linux-gnu.tar.gz
echo "staking=1" >> /home/northern/.northern/northern.conf
./northernd -daemon
./northern-cli -datadir=/home/northern/.northern getnewaddress
./northern-cli -datadit=/home/northern/.northern masternode debug
echo -e ${RED}"This is your VPS Staking wallet address for mn 1!"${NC}
sleep 30
./northern-cli getinfo
