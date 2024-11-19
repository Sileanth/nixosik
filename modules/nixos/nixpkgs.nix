{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  nixpkgs = {
    overlays = with outputs; [
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
