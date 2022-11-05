{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
#      ./devices/cerberus.nix
#      ./devices/loki.nix
#      ./devices/isis.nix
#      ./devices/osiris.nix
#      ./devices/heimdall.nix
#      ./devices/manticore.nix
#      ./devices/leviathan.nix
    ];

################
### TIMEZONE ###
################
  time.timeZone = "Canada/Atlantic";

###################
### SSH SUPPORT ###
###################
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    ports = [ 1717 ];
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
  };

###############
### ALIASES ###
###############
  environment.shellAliases = {
    rs = "sudo nixos-rebuild switch";
    rsu = "sudo nixos-rebuild switch --upgrade";
    garbage = "nix-collect-garbage -d";
    get = "cd /etc/nixos/ && sudo sh update.sh";
    la = "ls -a";
    c = "clear";
    reboot = "sudo reboot";
    poweroff = "sudo poweroff";
    shutdown = "sudo shutdown";
    mount = "sudo mount";
    fuck = "sudo !!";
  };

##################################
### SYSTEM VERSION AND UPDATES ###
##################################
  nix.autoOptimiseStore = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };
  system = {
    stateVersion = "22.05";
    autoUpgrade.enable = true;
    autoUpgrade.dates = "weekly";
  };
}
