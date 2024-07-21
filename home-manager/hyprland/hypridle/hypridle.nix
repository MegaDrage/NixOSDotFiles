{...}:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 0 && brightnessctl --device=platform::kbd_backlight -s set 0"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r && brightnessctl --device=platform::kbd_backlight -r";  
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 900; # 15min
          on-timeout = "systemctl suspend";
        }
        {
          timeout = 1800; # 30min
          on-timeout = "systemctl hibernate && kill $(pidof hyprlock)";
        }
      ];
    };
  };
}