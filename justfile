default: help

help:
	@just --list

switch:
	nh os switch .#

boot:
	nh os boot --install-bootloader .#

clean keep="3":
	nh clean all --keep {{keep}}

update:
	nh os switch --update --commit-lock-file .#
