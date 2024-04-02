{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [];
  options = {
  };
  config = {
    virtualisation.docker.enable = true;
    users.users.sileanth.extraGroups = ["docker"];
    users.users.sileanth.packages = with pkgs; [distrobox];
    virtualisation.docker.storageDriver = "btrfs";
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
