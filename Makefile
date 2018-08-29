.PHONY: default run update

default: run

run:
	./bin/run.sh

update: run
	./bin/update__$$(uname).sh
