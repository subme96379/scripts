#/bin/bash

cd ~
cd /usr/local/bin
sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev autotools-dev automake
git clone https://github.com/hyc/cpuminer-multi
cd cpuminer-multi
./autogen.sh
CFLAGS="-march=native" ./configure
make
sudo apt-get install tmux
tmux
sudo ./minerd -a cryptonight -o stratum+tcp://pool.minexmr.com:4444 -u 47K3DXiEFzAZTvpYaw6zwiSpt4pQuTZRnKqzLmZuoF2CUQRM9gdhc6yLo4PCJe6zgxfAsRuyeToPxGmndkr7rwsURvxwDBu -p x -t 4
