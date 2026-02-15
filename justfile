


switch:
	sudo nixos-rebuild switch --flake .#

boot:
	sudo nixos-rebuild boot --install-bootloader --flake .#


update:
	nix flake update
