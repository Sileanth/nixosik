







update:
	nix flake update


build:
	sudo nixos-rebuild switch --flake .#


build-boot:
	sudo nixos-rebuild switch --flake .# --instal-bootloader
