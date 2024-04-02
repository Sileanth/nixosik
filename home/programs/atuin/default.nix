{config, pkgs, ... }:


{

	programs.atuin = {
    enable = false;
    enableFishIntegration = false;
    flags = [ 
      "--disable-up-arrow"
    ];

  };
	


}
