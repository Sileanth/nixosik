{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
  	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableZshIntegration = true;
			enableFishIntegration = true;

		};

	};
  };
}:w
