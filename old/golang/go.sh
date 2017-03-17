#!/bin/bash

URL="https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz"

#sudo curl $URL -o /usr/local/src/go.tar.gz

if [[ ! -e /usr/local/go ]]; then
  (cd /usr/local && sudo tar xvf src/go.tar.gz)
fi

go get github.com/nsf/gocode
go get github.com/motemen/ghq && git config --global ghq.root ~/src
go get github.com/dufferzafar/cheat
