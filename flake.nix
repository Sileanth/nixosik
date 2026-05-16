{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let

      inherit (self) outputs;
      b = builtins;
      cfg_modules =
        ./nixos-modules
        |> b.readDir
        |> b.attrNames
        |> b.filter (f: nixpkgs.lib.strings.hasSuffix ".nix" f)
        |> b.map (e: ./nixos-modules/${e});
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      nixosConfigurations =
        let
        in
        {
          helios = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = {
              inherit outputs inputs;
              pkgs-unstable = import inputs.nixpkgs-unstable {
                config.allowUnfree = true;
                inherit system;
              };
              pkgs-stable = import inputs.nixpkgs-stable {
                config.allowUnfree = true;
                inherit system;
              };
            };
            modules = cfg_modules ++ [
              ./hosts/helios/configuration.nix
              inputs.home-manager.nixosModules.home-manager
              {
                mc = {
                  ollama.enable = true;
                  docker.enable = true;
                  kdeconnect.enable = true;
                  niri.enable = true;
                  nvim.enable = true;
                  shell.enable = true;
                  hyprland.enable = true;
                  steam.enable = true;
                  nix.enable = true;
                  nvidia.enable = true;
                  home.enable = true;
                  kitty.enable = true;
                  noctulia.enable = true;
                  quickshell.enable = true;
                  android-studio.enable = true;
                  wireguard.enable = true;
                };
              }
            ];
          };

        };
    };
}
