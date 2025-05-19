{home-manager, pkgs, lib, ...}: {
	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;


	imports = [
		./modules/git.nix
		./modules/shell.nix
		./modules/nvim.nix
		./modules/hypr.nix
		./modules/waybar.nix
		./modules/nvim

	];

	home-manager.users.sileanth = {
		home.stateVersion = "24.11";


		home.packages = with pkgs; [
			obsidian
			spotify
			tailscale
			sqlite

			mpv
			btop
			lazygit
			bat

			swi-prolog


			dotnet-sdk

			python312
			python312Packages.sqlalchemy



			typescript-language-server
			nodejs_23
			eslint
			

		];






	};


}
