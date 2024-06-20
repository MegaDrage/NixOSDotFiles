{pkgs, ...}:
let
  gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;  
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    
    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";
    
    iconTheme.package = gruvboxPlus;
    iconTheme.name = "GruvboxPlus";
  };
}