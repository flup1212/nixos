{ config, pkgs, ... }: {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile.
    # You can use https://search.nixos.org/ to find more packages (and options).
    environment.systemPackages = with pkgs; [
	sbctl
	greetd
	tuigreet
	xwayland-satellite
	wine
    ];

    programs = {
	fish.enable = true;

	steam = {
	    enable = true;
	    remotePlay.openFirewall = true;
	    dedicatedServer.openFirewall = true;
	};
    };
    services = {
	flatpak.enable = true;
	libinput.enable = false;
	greetd = {
	    enable = true;
	    settings = {
		default_session = {
		    command = "tuigreet --remember --remember-session --time --greeting 'ok computer' --theme 'border=black;button=yellow;greet=white;title=black;container=black;text=black;prompt=white;input=white' --asterisks --cmd niri-session";
		};
	    };
	};
	iptsd = {
	    enable = true;
	    config = {
		Config = {
		    BlockOnPalm = true;
		    TouchThreshold = 20;
		    StabilityThreshold = 0.1;
		};
	    };
	};
    };
    xdg.portal = {
	enable = true;
	config.niri.default = [ "gnome" "gtk" ];
    };
}
