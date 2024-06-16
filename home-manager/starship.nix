
{pkgs, ...}:
{
    programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ../nxconfig/starship.toml;
  };
}
