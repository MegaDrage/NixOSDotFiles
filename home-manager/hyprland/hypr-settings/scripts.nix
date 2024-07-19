{config, ...}:
{
  home.file."${config.xdg.configHome}/hypr/scripts/" ={
    source = ./scripts;
    recursive = true;
  };
}