{ config, pkgs, nixos-hardware, ... }: {
    # Use the systemd-boot EFI boot loader.
    boot.loader = {
	systemd-boot.enable = false;
	efi.canTouchEfiVariables = true;
	limine = {
	    enable = true;
	    style.wallpapers = [ "/home/levi/.config/nixos/home/dotfiles/assets/wallpapers/wallpaper.png" ];
	    style.graphicalTerminal.background = "ffffffff";
	    maxGenerations = 5;
	};
    };

    # Use latest kernel.
    # boot.kernelPackages = pkgs.linuxPackages_latest; # commented because im using the ms surface kernel
}
