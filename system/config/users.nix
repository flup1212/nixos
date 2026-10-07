{ config, pkgs, ... }: {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users."user" = {
      isNormalUser = true;
      description = "Name";
      extraGroups = [ "networkmanager" "wheel" "input" ];
      packages = with pkgs; [];
      shell = pkgs.fish;
    };
}
