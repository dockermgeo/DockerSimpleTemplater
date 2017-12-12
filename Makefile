##
# Make a Simpleparser for docker
# Included RedisClient *redscli*
#
DIR_PWD=$(shell pwd)
DIR_SRC=$(DIR_PWD)/src
DIR_DOWNLOAD=$(DIR_PWD)/src/download
DIR_BUILD=/tmp

install: download.vault download.clireds
	cp -Rfv $(DIR_PWD)/src/scripts/lib /usr/local/lib/cliks
	cp -fv $(DIR_PWD)/src/scripts/* /usr/local/bin/
	chmod a+x /usr/local/lib/cliks/*
	chmod a+x /usr/local/bin/*

download.clireds: prepare
	git clone https://github.com/dockermgeo/CliReds
	mv CliReds/builds/clireds-Linux $(DIR_DOWNLOAD)/clireds
	chmod a+x $(DIR_DOWNLOAD)/clireds
	rm -Rf CliReds

download.vault: prepare
	curl -O https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip
	unzip vault_0.9.0_linux_amd64.zip
	mv vault $(DIR_DOWNLOAD)/vault
	chmod a+x $(DIR_DOWNLOAD)/vault
	rm -f vault_0.9.0_linux_amd64.zip

prepare:
	mkdir -p $(DIR_DOWNLOAD)
