#!/bin/bash

. ../buffet.sh

VERSION="6.5.5"
PREFIX="/usr/local/src"
ARCHIVE="${PREFIX}/global.tar.gz"
URL="http://tamacom.com/global/global-${VERSION}.tar.gz"
SRCDIR="${PREFIX}/global-${VERSION}"

sudo_required
exists $ARCHIVE && exit 1

curl -o $ARCHIVE $URL
(cd $PREFIX && tar xvf $ARCHIVE)
(cd $SRCDIR && ./configure && make && make install)
