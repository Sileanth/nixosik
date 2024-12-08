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
    virtualisation.virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
        # enableKvm = true;
        package = pkgs.stable.virtualbox;
      };
    };

    users.extraGroups.vboxusers.members = ["sileanth"];
    virtualisation.waydroid.enable = true;
  };
}
