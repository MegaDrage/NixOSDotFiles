{...}:
{
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
        name = "palenight";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      favorite-apps = [
        "floorp.desktop"
        "code.desktop"
        "org.gnome.Terminal.desktop"
        # "spotify.desktop"
        # "virt-manager.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "dash-to-panel@jderose9.github.com"
        "sound-output-device-chooser@kgshank.net"
        "space-bar@luchrioh"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.png";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };
  };
}