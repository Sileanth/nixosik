{
  pkgs,
  lib,
  config,
}: let
  cfg = config.myNix.scripts;
  global_update = writeShellApplication {
    name = os-update;
    runtimeInputs = [github flatpak];

    text = ''
      flatpak os-update

      pushd ${cfg.config-path}
      nix flake update
      nix fmt
      gi add -A
      git commit -m "update"
      git push

      sudo nh os switch .
      nh home switch .


      popd
    '';
  };
in {
}
