#!/bin/bash

. ../buffet.sh

VERSION="1.8.0"

sudo_required

is_cent && yum install -y java-${VERSION}-openjdk.x86_64
