#!/bin/sh

curl -s https://github.com/k0kubun/mitamae/releases.atom | grep title | head -n2 | tail -n1 | sed 's!\s*<title>v!!g' | sed 's!</title>!!g'
