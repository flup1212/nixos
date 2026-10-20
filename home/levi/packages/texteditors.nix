{ config, pkgs, ... }: {
    # install text editors
    home.packages = with pkgs; [
	vim
	neovim
	micro
    ];

    # nvim config
    home.file.".config/nvim/init.lua".source = ../dotfiles/nvim/init.lua;
}
