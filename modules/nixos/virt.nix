{lib, config, pkgs, ...}: let
	cfg = config.mc.virt;
in {

imports = [
];

options = {
	mc.virt = {
		enable = lib.mkEnableOption "enable virt";
	};


};
config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };
    
    virtualisation.libvirtd.enable = true;
    users.users.sileanth.extraGroups = [ "docker" "libvirtd" "kvm" "adbusers" ];
    environment.systemPackages = with pkgs; [
      docker-compose
      qemu
      android-studio
      distrobox
      distrobox-tui
    ];


    programs.adb.enable = true;
};
}

