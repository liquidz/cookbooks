#!/bin/sh

curl -s https://github.com/itamae-kitchen/mitamae/releases.atom \
    | grep title \
    | head -n2 \
    | tail -n1 \
    | sed 's!\s*<title>v!!g' \
    | sed 's!</title>!!g' \
    | cut -d: -f1

