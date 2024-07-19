{...}:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      position= "top";
      layer= "top";
      height= 5;
      margin-top= 0;
      margin-bottom= 1;
      margin-left= 0;
      margin-right= 0;

      modules-right = [
        "battery"
      ];

      battery = {
        format = "{icon} {capacity}%";
        format-icons = [" " " " " " " " " "];
        format-charging = " {capacity}%";
        format-full = " {capacity}%";
        format-warning = " {capacity}%";
        interval = 5;
        states = {
            warning = 20;
        };
        format-time = "{H}h{M}m";
        tooltip = true;
        tooltip-format = "{time}";
      };
    };
  };
}