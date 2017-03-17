#!/bin/sh

apt-get install -y make gcc git ncurses-dev liblua5.1-dev libluajit-5.1 python-dev python3-dev

SRC_DIR="/usr/local/src/vim"
#git clone https://github.com/vim/vim $SRC_DIR

CONFIGURE_OPTION="--prefix=/usr/local --with-features=huge --enable-multibyte --enable-luainterp=dynamic --with-luajit --enable-pythoninterp --enable-fail-if-missing"

cd $SRC_DIR
#./configure $CONFIGURE_OPTION
#make
#make install

cat <<EOT > /tmp/rebuild.sh
git checkout .
git pull
./configure $CONFIGURE_OPTION
make
sudo make install
EOT
chmod +x /tmp/rebuild.sh
sudo mv -f /tmp/rebuild.sh $SRC_DIR
