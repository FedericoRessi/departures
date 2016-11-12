all: build

.PHONY: all build install clean

BUILD_DIR = build
INSTALL_DIR = /var/www/html

include transit_www/www.mk
include pubtransit/feed.mk

deploy:
	ansible-playbook provision.yaml

test_python:
	tox

test_install: build install
	echo INSTALLED

test_deploy: build
	vagrant up --provision

clean:
	rm -fR $(BUILD_DIR)
