#!/bin/bash

. ../buffet.sh

sudo sh -c ". ../java/jdk.sh"

LEIN=~/bin/lein
URL="https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"

exists $LEIN && exit 1

mkdir -p ~/bin
curl -o $LEIN $URL
chmod +x $LEIN
$LEIN self-install


