.PHONY: default run update

default: run

run:
	./bin/run.sh

upgrade: run
	./bin/upgrade__$$(uname).sh
