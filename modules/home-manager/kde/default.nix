{
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
  };
}
