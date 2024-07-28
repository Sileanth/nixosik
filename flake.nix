{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";

    # minecraft grub theme

    # nvim plugin for rust, and vscode debugger wrapped for nvim
    rustaceanvim.url = "github:mrcjkb/rustaceanvim";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    pyprland = {
      url = "github:hyprland-community/pyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-cosmic,
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
      biurko = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          base.modules
          ++ [
            # > Our main nixos configuration file <
            ./hosts/biurko/configuration.nix
            {
              nix.settings = {
                substituters = ["https://cosmic.cachix.org/"];
                trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
              };
            }
            nixos-cosmic.nixosModules.default
          ];
      };
      inspir = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          base_server.modules
          ++ [
            # > Our main nixos configuration file <
            ./hosts/inspir/configuration.nix
          ];
      };
      delik = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          base.modules
          ++ [
            # > Our main nixos configuration file <
            ./hosts/delik/configuration.nix
            outputs.nixosModules.kde
            outputs.nixosModules.hyprland

            {
              nix.settings = {
                substituters = ["https://cosmic.cachix.org/"];
                trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
              };
            }
 
            nixos-cosmic.nixosModules.default
          ];
      };
      liveIso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules =
          base.modules
          ++ [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma5.nix"
            ./hosts/liveIso.nix
          ];
      };
    };
    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "sileanth@inspir" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};

        modules = [
          # > Our main home-manager configuration file <
          ./home-manager/home-server.nix
        ];
      };
      "sileanth@biurko" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};

        modules = [
          # > Our main home-manager configuration file <
          ./home-manager/home.nix
          inputs.plasma-manager.homeManagerModules.plasma-manager
        ];
      };
      "sileanth@delik" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};

        modules = [
          # > Our main home-manager configuration file <
          ./home-manager/home.nix
          inputs.plasma-manager.homeManagerModules.plasma-manager
        ];
      };
    };
  };
}
