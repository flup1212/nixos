{
    description = "My NixOS config";

    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	nixos-hardware = {
	    url = "github:NixOS/nixos-hardware";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs: {
	nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
	    modules = [
		./system/core.nix

		home-manager.nixosModules.default
		{
		    home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			extraSpecialArgs = { inherit inputs; };
              	    	users.levi = ./home/home.nix;
		    };
		}
	    ];
	};
    };
}
