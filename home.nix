{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

####################
### HOME MANAGER ###
####################
  home-manager.users.colin = { pkg, ...}: {
    programs = {
      bash = {
        enable = true;
        initExtra = "neofetch --ascii ~/.config/neofetch/halsey.txt --ascii_colors 3 2";
      };
    };
    
  home.stateVersion = "22.05";

######################
### DCONF SETTINGS ###
######################
    dconf.settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        "custom-keybindings" = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        ];
      };   
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        "binding" = "<Super>t";
        "command" = "kgx";
        "name" = "open-terminal";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        "binding" = "<Super>e";
        "command" = "nautilus";
        "name" = "open-files";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        "binding" = "<Super>w";
        "command" = "firefox";
        "name" = "open-browser";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        "binding" = "<Super>d";
        "command" = "discord";
        "name" = "open-discord";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
        "binding" = "<Super>g";
        "command" = "gimp";
        "name" = "open-gimp";
      };
      "org/gnome/desktop/wm/keybindings" = {
        "close" = [
          "<Super>q"
        ];
      };   
      "org/gnome/desktop/wm/preferences" = {
        "button-layout" = "appmenu:minimize,maximize,close";
      };
      "org/gnome/shell" = {
        "favorite-apps" = [
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
          "org.gnome.Console.desktop"
          "com.github.iwalton3.jellyfin-media-player.desktop"
          "discord.desktop"
          "steam.desktop"
        ];
        "enabled-extensions" = [
          "places-menu@gnome-shell-extensions.gcampax.github.com"
          "tailscale-status@maxgallup.github.com"
        ];
      };
      "org/gnome/mutter" = {
        "edge-tiling" = true;
      };
      "org/gnome/desktop/interface" = {
        "icon-theme" = "Numix-Circle";
        "clock-format" = "12h";
        "color-scheme" = "prefer-dark";
        "show-battery-percentage" = true;
      };
      "org/gnome/desktop/background" = {
        "picture-uri" = "/etc/nixos/wallpapers/1080/tlou.jpg";
        "picture-uri-dark" = "/etc/nixos/wallpapers/1080/tlou.jpg";
      };
      "org/gnome/desktop/sound" = {
        "allow-volume-above-100-percent" = true;
      };
    };
    
################
### NEOFETCH ###
################
    home.file.".config/neofetch/config.conf".text = ''
      print_info() {
          info "System" distro
          info "Kernel" kernel
          info "Environment" de
          info "Uptime" uptime
          info "Packages" packages
          info "CPU" cpu
          info "GPU" gpu
          info "Memory" memory
          info "Disk" disk
          info "Local IP" local_ip
          info "Public IP" public_ip

          info cols
      }

      distro_shorthand="off"
      os_arch="off"
      uptime_shorthand="tiny"
      package_managers="off"
      public_ip_host="https://ident.me"
      de_version="on"
      disk_subtitle="none"
      colors=(distro)
      separator=" =="
      ascii_distro="auto"
      ascii_colors=(distro)
      image_size="auto"
    '';
    home.file.".config/neofetch/halsey.txt".text = ''
     █ ▀ █▀▄▀█   █▄░█ █▀█ ▀█▀  
     █ ░ █░▀░█   █░▀█ █▄█ ░█░  
    
     ▄▀█   █▀▄▀█ ▄▀█ █▀█ ▀█▀ █▄█ █▀█  
     █▀█   █░▀░█ █▀█ █▀▄ ░█░ ░█░ █▀▄  
    
     █ ▀ █▀▄▀█   ▄▀█  
     █ ░ █░▀░█   █▀█  
    
     █▀█ █▀█ █▀█ █▄▄ █░░ █▀▀ █▀▄▀█
     █▀▀ █▀▄ █▄█ █▄█ █▄▄ ██▄ █░▀░█
    
           ▄▄  █░█ ▄▀█ █░░ █▀ █▀▀ █▄█
           ░░  █▀█ █▀█ █▄▄ ▄█ ██▄ ░█░
    '';
    
#######################
### DESKTOP ENTRIES ###
#######################
    xdg.desktopEntries.renamer = {
          name = "Renamer";
          genericName = "Renamer";
          exec = "appimage-run /Storage/Files/Packages/APPS/renamer.AppImage";
          terminal = false;
          icon = "gprename.svg";
    };
    
##############################
### TAILSCALE GNOME STATUS ###
##############################   
     home.file.".local/share/gnome-shell/extensions/tailscale-status@maxgallup.github.com/extension.js".source = (builtins.fetchurl { url ="https://raw.githubusercontent.com/maxgallup/tailscale-status/main/tailscale-status%40maxgallup.github.com/extension.js"; });    
     home.file.".local/share/gnome-shell/extensions/tailscale-status@maxgallup.github.com/metadata.json".source = (builtins.fetchurl { url ="https://raw.githubusercontent.com/maxgallup/tailscale-status/main/tailscale-status%40maxgallup.github.com/metadata.json"; });
     home.file.".local/share/gnome-shell/extensions/tailscale-status@maxgallup.github.com/icon.svg".source = (builtins.fetchurl { url ="https://raw.githubusercontent.com/Bonandry/yaru-plus/master/Yaru%2B%2B-Dark/status/symbolic/network-vpn-symbolic.svg"; });
    
  };   
}  
