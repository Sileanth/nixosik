{
  description = "nixos config";

  inputs = {
    neovim.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      # url = "github:nix-community/home-manager";  # this selects the unstable-branch and needs to match Nixpkgs
      url = "github:nix-community/home-manager/release-25.05"; # this selects the release-branch and needs to match Nixpkgs
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      nixpkgs-unstable,
      ...
    }@inputs:
    let

      inherit (self) outputs;
    in
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations =
        let

          base_modules = [
          ];
          modules = import ./modules;
          nixos-modules = modules.nixos-modules;
          home-modules = modules.home-modules;

          default_modules =
            nixos-modules.all
            # all modules are imported but need to be enabled
            ++ [
              disko.nixosModules.disko
              home-manager.nixosModules.home-manager
              ./home
            ];

        in
        {

          helios = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = {
              inherit outputs inputs;
              pkgs-unstable = import nixpkgs-unstable {
                config.allowUnfree = true;
                inherit system;

              };
            }; # are passed to modules
            modules = default_modules ++ [
              ./hosts/helios/configuration.nix
              {
                mc = {
                  ollama = {
                    enable = false;
                    enableWebUI = true;
                  };
                  flatpak.enable = true;
                  cosmic.enable = true;
                  disko_default = {
                    enable = true;
                    efi_size = "1024";
                    swap_size = "16";
                  };
                  bootloader = {
                    enable = true;
                    type = "grub";
                  };
                  postgres.enable = true;
                  windows.enable = true;
                  hyprland.enable = true;
                  fonts.enable = true;
                  tailscale.enable = true;
                  keyboard.enable = true;
                  virt.enable = true;
                  kdeconnect.enable = true;
                  gaming.enable = true;
                  uwsm_display_manager = {
                    enable = true;
                    skip_choice = false;
                    auto_login = {
                      enable = true;
                      user = "sileanth";
                    };
                  };
                };

              }
            ];

          };
          athena = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = {
              inherit outputs inputs;
              pkgs-unstable = import nixpkgs-unstable {
                config.allowUnfree = true;
                inherit system;

              };
            }; # are passed to modules
            modules = default_modules ++ [
              ./hosts/athena/configuration.nix
              {
                mc = {
                  disko_default = {
                    enable = true;
                    efi_size = "1024";
                    swap_size = "16";
                  };
                  hyprland.enable = true;
                  fonts.enable = true;
                  tailscale = {
                    enable = true;
                    enable_homelab = true;
                  };
                  uwsm_display_manager = {
                    enable = true;
                    skip_choice = false;
                    auto_login = {
                      enable = true;
                      user = "sileanth";
                    };
                  };
                };

              }
            ];

          };
        };
    };
}
