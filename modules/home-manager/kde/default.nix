{
  plasma-manager,
  outputs,
  pkgs,
  ...
}:
{
  imports = [  ];
  options = {};
  config = {
    programs.plasma = {
      enable = true;
      kwin.titlebarButtons = {
        left = [ "on-all-desktops" "keep-above-windows" "close" ];
        right = [ "help" "minimize" "maximize" ]
      };
    };
    


  };
  # ...
}
