{config, ...}:
{
  home.file."${config.xdg.configHome}/eww" = {
    source = ./config;
    recursive = true;
  };
  home.file."${config.xdg.configHome}/eww/eww.scss".text = ''
  '';
}