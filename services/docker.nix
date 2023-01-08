{ config, pkgs, ... }:
{

  users.users.colin.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };
  
  virtualisation.oci-containers.backend = "docker";
  
  virtualisation.oci-containers.containers = {
    portainer = {
      image = "portainer/portainer-ce:latest";
      autoStart = true;
      ports = [
        "8000:8000"
        "9443:9443"
      ];
      volumes = [
        "/Configs/portainer:/data"
        "/var/run/docker.sock:/var/run/docker.sock"
      ];
    };
    glances = {
      image = "nicolargo/glances:latest-alpine";
      autoStart = true;
      ports = [
        "61208:61208"
        "61209:61209"
      ];
      environment = {
        GLANCES_OPT = "-w";
      };
    };
    autoheal = {
      image = "willfarrell/autoheal:latest";
      autoStart = true;
      volumes = [
        "/var/run/docker.sock:/var/run/docker.sock"
      ];
      environment = {
        AUTOHEAL_CONTAINER_LABEL = "all";
      };
    };
  };
  
}
