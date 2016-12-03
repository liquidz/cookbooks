HOSTNAME = $(shell hostname)
VERSION = 1.1.2
URL = https://github.com/k0kubun/mitamae/releases/download/v$(VERSION)/mitamae-x86_64-linux
TARGET = $(HOME)/bin/mitamae

$(TARGET):
	curl -o $(TARGET) -L $(URL)
	chmod +x $(TARGET)

provision: $(TARGET)
	mitamae local roles/$(HOSTNAME).rb

clean:
	\rm -f $(TARGET)
