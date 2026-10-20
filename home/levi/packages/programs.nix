{ config, pkgs, ... }: {
    # install user programs
    home.packages = with pkgs; [
    	vivaldi
	firefox
    	thunar
    	vlc
	asunder
	feishin
	kdePackages.filelight
	protonplus
	vscode
	retroarch-full
	steam-rom-manager
    ];

    programs = {
	kitty = {
	    enable = true;
	    extraConfig = ''${builtins.readFile ../dotfiles/kitty/kitty.conf}'';
	};
    };
}
