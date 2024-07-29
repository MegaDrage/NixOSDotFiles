{pkgs, config, ...}:
{
  services.swaync = {
    enable = true;
  };
  home.file."${config.xdg.configHome}/swaync/icons" = {
    source = ./icons;
    recursive = true;
  };
  home.file."${config.xdg.configHome}/swaync/images" = {
    source = ./images;
    recursive = true;
  };
  home.file."${config.xdg.configHome}/swaync" = {
    source = ./config;
    recursive = true;
  };
}