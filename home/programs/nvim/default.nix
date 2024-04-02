{config, pkgs, ... }:


{

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		withPython3 = true;
		withNodeJs = true;

	};

	home.file.".config/nvim" = {
		source = ./nvim;
		recursive = true;
	};
	


}
