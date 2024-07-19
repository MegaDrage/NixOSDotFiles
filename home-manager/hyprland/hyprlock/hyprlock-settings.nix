{...}:
{
  programs.hyprlock = {
    extraConfig = builtins.readFile ./hyprlock.conf;
  };
}