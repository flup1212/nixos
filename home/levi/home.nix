{ config, pkgs, ... }: {
    imports = [
	./packages
    ];

    # home config
    programs.git = {
	enable = true;
	userName = "Levi";
	userEmail = "l.pippel8@proton.me";
    };

    dconf.settings = {
	"org/gnome/desktop/interface" = {
	    color-scheme = "prefer-dark";
    	};
    };

    gtk = {
	enable = true;
      	theme = {
	    name = "Adwaita-dark";
	    package = pkgs.gnome-themes-extra;
      	};
    };

    qt = {
	enable = true;
      	platformTheme.name = "adwaita";
      	style = {
	    name = "adwaita-dark";
	    package = pkgs.gnome-themes-extra;
      	};
    };

    home.pointerCursor = {
	enable = true;
	gtk.enable = true;
  	package = pkgs.banana-cursor;
  	name = "Banana Cursor";
	size = 20;
    };

    home.username = "levi";
    home.homeDirectory = "/home/levi";
    
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
}
