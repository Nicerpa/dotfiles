{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core Docker tools
    docker                   # Docker containerization platform
    docker-compose           # Tool for defining multi-container Docker applications
    dive                     # Tool for exploring docker images
    
    # Docker utilities
    lazydocker               # Terminal UI for docker and docker-compose
    ctop                     # Top-like interface for container metrics
  ];

  home.shellAliases = {
    # Docker shortcuts
    d = "docker";
    dc = "docker-compose";
    dps = "docker ps";
    di = "docker images";
    drmi = "docker rmi";
    drm = "docker rm";
    dv = "docker volume";
    dn = "docker network";
    
    # Docker compose shortcuts
    dcb = "docker-compose build";
    dcd = "docker-compose down";
    dce = "docker-compose exec";
    dcl = "docker-compose logs";
    dcp = "docker-compose ps";
    dcr = "docker-compose run";
    dcu = "docker-compose up";
    dcud = "docker-compose up -d";
    
    # Docker cleanup shortcuts
    dprune = "docker system prune";
    dprunea = "docker system prune -a";
    drmall = "docker rm $(docker ps -aq)";
    drmiall = "docker rmi $(docker images -q)";
    
    # Docker inspect and logs
    dins = "docker inspect";
    dlogs = "docker logs";
    dlogsf = "docker logs -f";
    
    # Docker exec shortcuts
    dex = "docker exec -it";
    dbash = "docker exec -it";
    dsh = "docker exec -it";
  };

  home.sessionVariables = {
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    DOCKER_HOST = "unix:///var/run/docker.sock";

    COMPOSE_FILE = "docker-compose.yml";
    COMPOSE_PROJECT_NAME = "dev";
  };

  home.file = {
    ".docker/.keep".text = "";
  };
}