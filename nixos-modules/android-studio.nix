{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.android-studio;
in
{

  imports = [
  ];

  options = {
    mc.android-studio = {
      enable = lib.mkEnableOption "enable android-studio";
    };

  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      android-tools
      android-studio
    ];
    users.users.sileanth.extraGroups = ["kvm" "adbusers"];
    networking.firewall = {
  enable = true;
  # Port 5555 for ADB, 30000-45000 for the pairing process
  allowedTCPPortRanges = [ 
    { from = 30000; to = 45000; } 
  ];
  allowedTCPPorts = [ 5555 ];
  # Port 5353 for mDNS/Avahi device discovery
  allowedUDPPorts = [ 5353 ];
};
  };
}
