{pkgs, ...}:
let
  gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;  
    # cursorTheme.package = pkgs.bibata-cursors;
    # cursorTheme.name = "Bibata-Modern-Ice";
    
    # theme.package = pkgs.solarc-gtk-theme;
    # theme.name = "SolArc-Dark";
    
    # iconTheme.package = gruvboxPlus;
    # iconTheme.name = "GruvboxPlus";
  };
}