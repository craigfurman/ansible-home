.PHONY: all upgrade

all:
	./bin/run.sh

upgrade:
	sudo pacman -Syu
	./bin/aur-upgrade.sh
	sudo pacman -Sc
