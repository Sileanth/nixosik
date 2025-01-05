{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # managing styles
    stylix.url = "github:danth/stylix";
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
         };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ghostty,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
    base = {
      modules = [
        outputs.nixosModules.fonts
        outputs.nixosModules.docker
        outputs.nixosModules.flatpak
        outputs.nixosModules.zsh
      ];
    };
    base_server = {
      modules = [
        outputs.nixosModules.docker
      ];
    };
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
     fenix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          base.modules
          ++ [
            # > Our main nixos configuration file <
            ./hosts/fenix/configuration.nix
          ];
      };
      delik = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          base.modules
          ++ [
            # > Our main nixos configuration file <
            ./hosts/delik/configuration.nix
            # outputs.nixosModules.kde
            outputs.nixosModules.hyprland

          ];
      };
    };
    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "sileanth@fenix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};

        modules = [
          # > Our main home-manager configuration file <
          ./home-manager/home.nix
          inputs.plasma-manager.homeManagerModules.plasma-manager
          stylix.homeManagerModules.stylix
        ];
      };
      "sileanth@delik" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};

        modules = [
          # > Our main home-manager configuration file <
          ./home-manager/home.nix
          inputs.plasma-manager.homeManagerModules.plasma-manager
          stylix.homeManagerModules.stylix
        ];
      };
    };
  };
}
