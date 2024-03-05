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
    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
    users.extraGroups.vboxusers.members = ["sileanth"];
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.x11 = true;
  };
}
