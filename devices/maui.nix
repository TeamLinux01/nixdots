{ config, pkgs, ... }:

{
  imports =
    [
      ../services/amd.nix
      ../services/base.nix
      ../services/bios.nix
      ../services/bluetooth.nix
      ../services/btrfs.nix
      ../services/flatpak.nix
      ../services/mounts.nix
      ../services/plasma.nix
      ../services/sound.nix
      ../services/web.nix
      ../users/colin.nix
    ];
    
  networking = {
    hostName = "maui";
    interfaces.enp3s0.wakeOnLan.enable = true;
  };

################
## AUTO LOGIN ##
################
  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "colin";
    };
  };

##########################
### VERSION AND REBOOT ###
##########################
  system = {
    stateVersion = "22.11";
    autoUpgrade.allowReboot = false;
  };

}