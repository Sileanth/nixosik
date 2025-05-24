# first recipe is run for just without command

default:
	just --list

update:
	nix flake update

build:
	sudo nixos-rebuild switch --flake .#

build-boot:
	sudo nixos-rebuild switch --flake .# --install-bootloader

clean:
	sudo nix-collect-garbage -d
