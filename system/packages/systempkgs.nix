{ config, pkgs, ... }:

let
    niri-tablet-repo = pkgs.fetchFromGitHub {
	owner = "GGEZUS";
	repo = "niri-tablet";
	rev = "v26.04.20";
	hash = "sha256-9/lU9xTk739oZkehUBVOlS3NH4eAyxow3og1LWpGkOU=";
    };

    niri-tablet = pkgs.niri.overrideAttrs (previousAttrs: {
	postPatch = (previousAttrs.postPatch or "") + ''
	    echo "Applying GGEZUS niri-tablet patches..."
	    # Shell globbing automatically applies 0001, 0002, etc. in numerical order
	    for patch_file in ${niri-tablet-repo}/pkg/*.patch; do
		echo "Applying $patch_file"
		patch -Np1 < "$patch_file"
		done
	'';
    });
in
{
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
	# iri.package = niri-tablet;

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
