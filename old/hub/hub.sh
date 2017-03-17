#!/bin/bash

. ../buffet.sh

VERSION="2.2.9"
URL="https://github.com/github/hub/releases/download/v${VERSION}/hub-linux-amd64-${VERSION}.tgz"
ARCHIVE=/usr/local/src/hub.tgz
sudo_required


! exists $ARCHIVE && \
  curl -L -o $ARCHIVE $URL

! exists /usr/local/src/hub-linux-amd64-${VERSION} && \
  cd /usr/local/src && tar xvf hub.tgz

cd /usr/local/src/hub-linux-amd64-${VERSION} && \
   prefix=/usr/local ./install
