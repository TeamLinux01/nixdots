{ config, pkgs, ... }:
{
  hardware.pulseaudio.enable = false;
  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    easyeffects
  ];
  
}
