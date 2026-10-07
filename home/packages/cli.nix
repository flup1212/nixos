{ config, pkgs, ... }: {
    # install command line tools
    home.packages = with pkgs; [
	fastfetch
    	wget
    	curl
    	btop
    	mpv
    	nnn
    	eza
    ];

    programs = {
	fish = {
	    enable = true;
	    shellInit = ''${builtins.readFile ../dotfiles/fish/config.fish}'';
	};
	starship.enable = true;
    };
    # starship config
    home.file.".config/starship.toml".source = ../dotfiles/starship.toml;
}
