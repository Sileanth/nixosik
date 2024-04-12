{
  plasma-manager,
  outputs,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    home.packages = with pkgs; [
      kdePackages.kdeconnect-kde
    ];
    programs.plasma = {
      enable = true;
      kwin.titlebarButtons = {
        left = ["on-all-desktops" "keep-above-windows"];
        right = ["help" "minimize" "maximize" "close"];
      };
    };
  };
  # ...
}
