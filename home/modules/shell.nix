{configs, pkgs, ...}:
{
home-manager.users.sileanth = {
	home.packages = with pkgs; [
		lsd
	];
	home.shellAliases = {
	};


	programs.fish = {
		enable = true;
	};

	programs.zsh = {
		enable = true;
		autocd = true;
		autosuggestion = {
			enable = true;
		};
		dotDir = ".config/zsh";
	};

	programs.lsd = {
		enable = true;
		enableBashIntegration = false;
		enableZshIntegration = true;
		enableFishIntegration = true;
	};

	programs.yazi = {
		enable = true;
		enableBashIntegration = false;
		enableZshIntegration = true;
		enableFishIntegration = true;
		shellWrapperName = "yy";

	};

	programs.starship = {
		enableBashIntegration = false;
		enableZshIntegration = true;
		enableFishIntegration = true;
		enable = true;
	};


	programs.kitty = {
		enable = true;
		settings = {
			shell = "zsh";
		};
		themeFile = "tokyo_night_night";
		shellIntegration = {
			enableFishIntegration = true;
			enableZshIntegration = true;
		};
	};



	programs.neovim.defaultEditor = true;
};
}
