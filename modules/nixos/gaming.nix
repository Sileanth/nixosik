{lib, config, pkgs, ...}: let
	cfg = config.mc.gaming;
in {

imports = [
];

options = {
	mc.gaming = {
		enable = lib.mkEnableOption "enable gaming";
	};


};
config = lib.mkIf cfg.enable {
    hardware.graphics.enable32Bit = true;
    environment.systemPackages = with pkgs; [
      lutris

    ];
    programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
};
}

