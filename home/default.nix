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
		home.stateVersion = "25.05";


		home.packages = with pkgs; [
			obsidian
			discord
			spotify

			just
			tailscale
			sqlite


      helix
      zed-editor
      vscode
      windsurf
      code-cursor


			mpv
			btop
			lazygit
			bat
			unrar
      tldr

			swi-prolog


			dotnet-sdk
			csharp-ls

			python312
			python312Packages.sqlalchemy


			calibre



			typescript-language-server
			nodejs_24
      svelte-language-server
			eslint
      gcc


			efibootmgr
			

		];






	};


}
