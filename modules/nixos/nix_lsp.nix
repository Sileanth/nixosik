{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  environment.systemPackages = [
    pkgs.nixd
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
