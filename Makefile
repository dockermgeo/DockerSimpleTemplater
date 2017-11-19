TARGET=/usr/local/bin

install:
	cp redisclients/clireds-$(uname -s) bin/clireds
	cp bin/* ${TARGET}
