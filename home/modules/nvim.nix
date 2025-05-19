{configs, pkgs, ...}:
{



		home-manager.users.sileanth = {
			programs.neovim = {
				defaultEditor = true;
				enable = true;
				viAlias = true;
				extraPackages = [

				];

			};
		};
}
