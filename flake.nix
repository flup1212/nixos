{
    description = "My NixOS config";

    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	nixos-hardware.url = "github:NixOS/nixos-hardware";
	nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs:
    let
	host = "nixos";
	user = "levi";
    in
    {
	nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
	    modules = [
		./system/core.nix
		# use linux-surface kernel
		nixos-hardware.nixosModules.microsoft-surface-common
	    ];
	};
    };
}
