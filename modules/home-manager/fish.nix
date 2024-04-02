{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
  	programs.starship.enableFishIntegration = true;
  	programs.fish = {
		enable = true;
		functions = {
			ll = "lsd -al";
			g = "git";
			gm = "git commit -m";

		};

	};
  };
}
