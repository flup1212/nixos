{ config, pkgs, ... }: {
    # install system tools
    home.packages = with pkgs; [
    	brightnessctl
    	playerctl
    	wl-clipboard
	cliphist
    	waybar
	hyprpaper
    	wvkbd
    	dunst
	linux-wallpaperengine
    ];

    programs = {
	wofi = {
	    enable = true;
	    settings = { };
	    style = ''${builtins.readFile ../dotfiles/wofi/style.css}'';
	};
    };
    home.file.".config/wofi/config".source = ../dotfiles/wofi/config;

    services = {
	awww.enable = true;

	# hyprpaper config
	hyprpaper = {
	    enable = true;
	    settings = {
		splash = false;
		wallpaper = [
		    {
			monitor = ''eDP-1'';
			path = ''~/.config/nixos/wallpaper.png'';
		    }
		];
	    };
	};
    };

    # waybar config                                                                                                  
    home.file.".config/waybar/config.jsonc".source = ../dotfiles/waybar/config.jsonc;                                  
    home.file.".config/waybar/style.css".source = ../dotfiles/waybar/style.css;                                        
                                                                                                                     
    # hyprland config                                                                                                
    home.file.".config/hypr/hyprland.lua".source = ../dotfiles/hypr/hyprland.lua;                                      
    home.file.".config/hypr/appearance.lua".source = ../dotfiles/hypr;                                                 
    home.file.".config/hypr/input.lua".source = ../dotfiles/hypr/input.lua;                                            
    home.file.".config/hypr/keybindings.lua".source = ../dotfiles/hypr/keybindings.lua;                                
    home.file.".config/hypr/monitors.lua".source = ../dotfiles/hypr/monitors.lua;                                      
    home.file.".config/hypr/myprograms.lua".source = ../dotfiles/hypr/myprograms.lua;                                  
                                                                                                                     
    # niri config                                                                                                    
    home.file.".config/niri/config.kdl".source = ../dotfiles/niri/config.kdl;
}
