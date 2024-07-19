{ pkgs, ... }: 
{
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.space-bar
    gnomeExtensions.arcmenu
    hyprshot
  ];
}