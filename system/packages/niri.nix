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
    programs.niri.enable = true;
    programs.niri.package = niri-tablet;
}
