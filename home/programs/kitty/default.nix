{config, pkgs, ... }:


{

  programs.kitty = {
    enable = true;

    shellIntegration.enableFishIntegration = true;


    theme = "Tokyo Night";


    extraConfig = "
      map alt+q launch --cwd=current --type=os-window

      shell fish
    ";
  };


}
