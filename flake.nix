{

	description = "Sileanth's NixOs Flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
	      		inputs.nixpkgs.follows = "nixpkgs";
	    	};
	};


	outputs = { self, nixpkgs, home-manager,  ...}@inputs: {
		nixosConfigurations = {
      kitek = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/steam
          ./modules/lutris
          ./modules/flatpak 
          ./modules/nerdfonts 
          ./modules/sway 
          ./modules/hyprland 
          ./modules/kernel 
          ./modules/audio
          ./modules/gnome
          
          ./hosts/kitek

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sileanth = import ./home;
          }
        ];
          };
			kotek = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./modules/flatpak
          ./modules/nas
          ./overlays
          ./modules/nerdfonts
          ./modules/virtualisation
          ./modules/nvidia
          ./modules/audio
          ./modules/sway
          ./modules/plasma
          ./modules/kernel 

					./hosts/kotek
					./modules/hyprland
					home-manager.nixosModules.home-manager
					  {
					    home-manager.useGlobalPkgs = true;
					    home-manager.useUserPackages = true;
					    home-manager.users.sileanth = import ./home;
					  }
				];


			};
			


		};
	










	};


}
