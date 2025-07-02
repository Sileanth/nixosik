# first recipe is run for just without command

default:
	just --list

update:
	nix flake update --commit-lock-file

build:
	./fix.sh; sudo nixos-rebuild switch --flake .#

build-boot:
	./fix.sh; sudo nixos-rebuild switch --flake .# --install-bootloader

clean:
	sudo nix-collect-garbage -d
