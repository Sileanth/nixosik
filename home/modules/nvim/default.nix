{config, pkgs, pkgs-unstable, inputs, ...}:
{
home-manager.users.sileanth = {
	home.packages = with pkgs; [
		lsd
	];


	programs.neovim= {
		package = inputs.neovim.packages.${pkgs.system}.default;
		enable = true;
		defaultEditor = true;
	};
	xdg.configFile.nvim = {
	      source = ./nvim;
	      target = "nvim";
	      recursive = true;
	      enable = true;
	};
	xdg.configFile."nvim/lua/export.lua" = {
		enable = true;
		text = ''
			local colorscheme = "catppuccin-mocha"
			return {
				colorscheme = colorscheme
			}
		'';
		
	};
};
}
