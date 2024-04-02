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
			ga = " git add -A";
			fish_greeting = ''  
				echo 󰄛  󰩃  󰄛
			'';
		};

	};
  };
}
