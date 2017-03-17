#!/bin/bash

. ../buffet.sh

LUAJIT_REPO="http://luajit.org/git/luajit-2.0.git"
VIM_REPO="https://github.com/vim/vim"
VIM_CONFIGURE="--prefix=/usr/local --with-features=huge --enable-multibyte --enable-luainterp --with-luajit --enable-pythoninterp --enable-fail-if-missing"
PREFIX="/usr/local/src"

sudo_required

if [[ is_cent ]]; then
  yum install -y make gcc git ncurses ncurses-devel lua lua-devel python-devel ctags
fi
