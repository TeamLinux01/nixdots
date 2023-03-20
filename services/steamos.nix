{ config, pkgs, ... }:
{

## STEAM INSTALL ##
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  
 ## PACKAGES ##
  environment.systemPackages = with pkgs; [
    gamescope
    mangohud
    pcsx2
    retroarchFull
  ];

## GAMESCOPE SESSION ##
  services.xserver.displayManager = {
    session = [
      {
        manage = "desktop";
        name = "gamescope";
        start = "gamescope -e -f -h 1080 -H 1080 -r 60 -- steam --gamepadui --steamos";
      }
    ];
    defaultSession = "gamescope";
  };

}
