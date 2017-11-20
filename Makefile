##
# Make a Simpleparser for docker
# Included RedisClient *redscli*
#
DIR_TARGET=/usr/local/bin
DIR_PWD=$(shell pwd)
DIR_BUILD=/tmp

install:
	cp $(DIR_PWD)/bin/* $(DIR_TARGET)/
	cd $(DIR_BUILD)
	git clone https://github.com/dockermgeo/CliReds
	mv ${DIR_BUILD}/DockerSimpleTemplater/CliReds/builds/clireds-Linux ${DIR_TARGET}/clireds
	rm -Rf ${DIR_BUILD)}/DockerSimpleTemplater
