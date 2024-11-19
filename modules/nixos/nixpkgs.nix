{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  nixpkgs = {
    overlays = with outputs.overlays; [
      additions
      modifications
      unstable-packages
      stable-packages
    ];
    config = {
      allowUnfree = true;

    };

  };
}
