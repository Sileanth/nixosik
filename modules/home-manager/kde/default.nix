{
  plasma-manager,
  outputs,
  pkgs,
  ...
}:
{
  imports = [ plasma-manager.homeManagerModules.plasma-manager];
  options = {};
  config = {
    programs.plasma = {
       kwin.titlebarButtons = {
        left = [ "on-all-desktops" "keep-above-windows" "minimize"];
        right = [ "help" "maximize" "close" ];
      };
    };


  };
  # ...
}
