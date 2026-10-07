{ config, pkgs, ... }: {
    fonts = {
	packages = with pkgs; [
	   notonoto    
	   font-awesome
	   nerd-fonts.jetbrains-mono
	];

	fontconfig = {
	   defaultFonts = {
		serif = [ "Space Mono" ];
	   };
	};
    };
}
