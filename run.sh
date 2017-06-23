#!/bin/bash

IMAGE_NAME="uochan/20170511"

show_usage () {
    cat <<EOT
USAGE: ./run.sh [OPTION] CONTAINER_NAME"

OPTION
  -p  PORT

EXAMPLE
  ./run.sh test
  ./run.sh -p 80 test
  ./run.sh -p 80,443 test
EOT
}

ADDITIONAL_PORT=""

while getopts p:h OPT; do
    case $OPT in
        p)
            ADDITIONAL_PORT="-p $(echo $OPTARG | sed 's/,/ -p /g')"
            ;;
        h)
            show_usage
            exit 0
            ;;
    esac
done
shift $((OPTIND - 1))

if [[ $# -ne 1 ]]; then
    show_usage
    exit 1
fi

NAME=$1
PROCESS=$(docker ps -a --filter="name=$NAME" | grep $IMAGE_NAME)

if [[ $? -eq 0 ]]; then
    docker start $NAME
else
    docker run -d --name=$NAME -p 22 $ADDITIONAL_PORT $IMAGE_NAME
fi
docker ps -a --filter="name=$NAME"

