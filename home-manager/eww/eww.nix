{config, ...}:
{
  home.file."${config.xdg.configHome}/eww" = {
    source = ./eww.yuck;
  };
  home.file."${config.xdg.configHome}/eww/eww.scss".text = ''
  '';
}