HOSTNAME = $(shell hostname)
VERSION = $(shell ./get_latest_mitamae_version.sh)
URL = https://github.com/itamae-kitchen/mitamae/releases/download/v$(VERSION)/mitamae-x86_64-linux
TARGET = /usr/bin/mitamae

$(TARGET):
	curl -o $(TARGET) -L $(URL)
	chmod +x $(TARGET)

provision: $(TARGET)
	mitamae local roles/$(HOSTNAME).rb

build:
	docker-compose build
start:
	docker-compose up -d
stop:
	docker-compose stop
restart:
	docker-compose rm -f
	docker-compose up -d

clean:
	\rm -f $(TARGET)

clean-containers:
	docker ps -a | grep Exited | awk '{print $1}' | xargs docker rm -f
clean-images:
	docker images  | grep '<none>' | awk '{print $3}' | xargs docker rmi
