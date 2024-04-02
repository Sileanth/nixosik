{
  plasma-manager,
  outputs,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.plasma = {
      enable = true;
      kwin.titlebarButtons = {
        left = ["on-all-desktops" "keep-above-windows" ];
        right = ["help" "minimize" "maximize" "close"];
      };
    };
  };
  # ...
}
