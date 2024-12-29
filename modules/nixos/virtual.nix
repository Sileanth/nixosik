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
        enable = false;
        enableExtensionPack = true;
        # enableKvm = true;
        package = pkgs.stable.virtualbox;
      };
    };

    users.extraGroups.vboxusers.members = ["sileanth"];
  };
}
