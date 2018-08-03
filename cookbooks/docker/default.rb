# coding: euc-jp
# docker-compose でインストールされるバージョンが古いっぽい
# 最新のをインストールするように修正する
%w(
  docker.io
  docker-compose
).each do |pkg_name|
  package pkg_name
end

sudo apt-get remove docker docker-engine docker.io

sudo apt update
sudo apt-get install \
               linux-image-extra-$(uname -r) \
                                   linux-image-extra-virtual

sudo apt-get install \
               apt-transport-https \
                               ca-certificates \
                                    curl \
                                    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
               "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce


# curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose
