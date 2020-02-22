sudo add-apt-repository universe
sudo apt-get update

# build requirements
sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3

# dependencies
sudo apt-get install libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev

# download bitcoin
git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin

# BerkeleyDB
./contrib/install_db4.sh `pwd`

# autogen
./autogen.sh

# configure
export BDB_PREFIX='/home/ubuntu/bitcoin/db4'
./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include"

#make
make

#make install
