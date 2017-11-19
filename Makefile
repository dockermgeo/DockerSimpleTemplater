TARGET=/usr/local/bin
PWD=$(shell pwd)

install:
	cp $(PWD)/bin/* $(TARGET)/

install_clireds:
	$(cd /tmp)
	$(git clone https://github.com/dockermgeo/CliReds builds/clireds-Linux)
	$(mv /tmp/builds/cliredis ${TARGET}/)
	$(rm -Rf /tmp/builds)
