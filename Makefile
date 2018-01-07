##
# Make a Simpleparser for docker
# Included RedisClient *redscli*
#
DIR_PWD=$(shell pwd)
DIR_SRC=$(DIR_PWD)/src
DIR_DOWNLOAD=$(DIR_PWD)/src/download
VAULT_VERSION=0.9.0

install:
	@echo "usage: [install.linux, install.rpi]"

install.run:
	cp -Rfv $(DIR_SRC)/sources/cliks /usr/local/lib/
	cp -fv $(DIR_SRC)/sources/cliks/cliks /usr/local/bin/
	cp -fv $(DIR_SRC)/sources/simpletemplater/* /usr/local/bin/
	cp -fv $(DIR_DOWNLOAD)/* /usr/local/bin/
	chmod a+x /usr/local/lib/cliks/*
	chmod a+x /usr/local/bin/*

install.rpi: download.vault.rpi download.clireds.rpi install.run

install.linux: download.vault.linux download.clireds.linux install.run

#
# DOWNLOADS

# LINUX
download.clireds.linux: prepare
	git clone https://github.com/dockermgeo/CliReds
	mv CliReds/builds/clireds-Linux $(DIR_DOWNLOAD)/clireds
	chmod a+x $(DIR_DOWNLOAD)/clireds
	rm -Rf CliReds

download.vault.linux: prepare
	curl -O https://releases.hashicorp.com/vault/$(VAULT_VERSION)/vault_$(VAULT_VERSION)_linux_amd64.zip
	unzip vault_$(VAULT_VERSION)_linux_amd64.zip
	mv vault $(DIR_DOWNLOAD)/vault
	chmod a+x $(DIR_DOWNLOAD)/vault
	rm -f vault_$(VAULT_VERSION)_linux_amd64.zip

# ARM
download.clireds.rpi: prepare
	git clone https://github.com/dockermgeo/CliReds
	mv CliReds/builds/clireds-Linux $(DIR_DOWNLOAD)/clireds
	chmod a+x $(DIR_DOWNLOAD)/clireds
	rm -Rf CliReds

download.vault.rpi: prepare
	curl -O https://releases.hashicorp.com/vault/$(VAULT_VERSION)/vault_$(VAULT_VERSION)_linux_arm.zip
	unzip vault_$(VAULT_VERSION)_linux_arm.zip
	mv vault $(DIR_DOWNLOAD)/vault
	chmod a+x $(DIR_DOWNLOAD)/vault
	rm -f vault_$(VAULT_VERSION)_linux_arm.zip

prepare:
	mkdir -p $(DIR_DOWNLOAD)
