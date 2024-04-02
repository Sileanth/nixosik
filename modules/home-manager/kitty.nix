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
		theme = "Everforest Dark Hard";
		shellIntegration = {
			enableZshIntegration = true;
			enableFishIntegration = true;

		};

	};
  };
}
