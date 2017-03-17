#!/bin/sh

git checkout .
git pull
./configure {{vim_configure}}
make
sudo make install
