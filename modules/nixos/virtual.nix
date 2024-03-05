{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [];
  options = {
  };
 {
   virtualisation.virtualbox.host.enable = true;
     virtualisation.virtualbox.host.enableExtensionPack = true;
   users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
}
