#!/bin/bash

VERSION=0.6.0
URL="https://github.com/k0kubun/mitamae/releases/download/v${VERSION}/mitamae-x86_64-linux"
TARGET=~/bin/mitamae

if [[ -e $TARGET ]]; then
    \rm -f $TARGET
fi
curl -o ~/bin/mitamae -L $URL

chmod +x $TARGET

