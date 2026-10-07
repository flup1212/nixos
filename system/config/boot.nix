{ config, pkgs, ... }: {
    # Use the systemd-boot EFI boot loader.
    boot.loader = {
	systemd-boot.enable = false;
	efi.canTouchEfiVariables = true;
	limine = {
	    enable = true;
	    style.wallpapers = [ "/home/levi/.config/nixos/home/dotfiles/assets/wallpapers/wallpaper.png" ];
	    style.graphicalTerminal.background = "ffffffff";
	    maxGenerations = 5;
	    
	    extraEntries = ''
	         /+Other systems
	         //Windows
	         protocol: efi
	         path: uuid(9be45e5a-4909-44eb-af24-210aad99de0c):/EFI/Microsoft/Boot/bootmgfw.efi
	    '';
	};
    };

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest; # commented because im using the ms surface kernel

    # Use linux-surface kernel
    # nixos-hardware.nixosModules.microsoft-surface-common
}
