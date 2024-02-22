{ config, pkgs, ... }:

{
  imports = [];
  options = {};
  config = {
  	programs.neovim = {
		enable = true;
		defaultEditor = true;
		package = pkgs.neovim-nightly;
	};
	xdg.configFile.nvim = {
		source = ./nvim;
		target = "nvim";
		recursive = true;
		enable = true;
	};

  };
  # ...
}

