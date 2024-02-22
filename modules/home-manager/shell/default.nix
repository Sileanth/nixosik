{ config, pkgs, ... }:
{
  imports = [];
  options = {};
  config = {

  	home = {
		sessionPath = [
		  "$HOME/.local/bin"
		];

		sessionVariables = {
		  FOO = "Hello";
		  BAR = "$FOO World!";
		};

		shellAliases = {
			lg = "lazygit";
			g = "git";

		};

	};



  };
  # ...
}

