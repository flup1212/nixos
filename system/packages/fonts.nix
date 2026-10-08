{ config, pkgs, ... }: {
    fonts = {
	packages = with pkgs; [
	   notonoto    
	   font-awesome
	   nerd-fonts.jetbrains-mono
	   nerd-fonts.space-mono
	];

	fontconfig = {
	   defaultFonts = {
		serif = [ "Space Mono" ];
	   };
	};
    };
}
