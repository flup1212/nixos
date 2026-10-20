{ config, pkgs, ... }: {
    # install archive tools
    home.packages = with pkgs; [
    	zip
	unzip
	unrar
	p7zip
    ];
}
