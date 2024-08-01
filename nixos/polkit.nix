{pkgs, ...}:
{
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
    extraConfig = ''
      DefaultTimeoutStopSec=10s
      polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.policykit.exec" &&
          action.lookup("command_line") == "/usr/bin/bash [绝对路径]/.config/nekoray/config/vpn-run-root.sh" &&
          subject.isInGroup("wheel")) {
          return polkit.Result.YES;
      }
      })
    '';
  };
}