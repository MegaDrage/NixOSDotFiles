{config, pkgs, ... }: 
{
  imports = [
    ./hypr-settings/scripts.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    systemd.enable = true;
    settings = {
      windowrule = [
       "float, pavucontrol"
      ];
      exec-once = [
        "polkit-agent-helper-1 &"
        "systemctl start --user polkit-gnome-authentication-agent-1 &"
        "waybar &"
        "swaync &"
        "hypridle &"
        "nm-applet --indicator"
      ];

      general = {
        "$mod" = "SUPER";
        "$scriptsDir" = "$HOME/.config/hypr/scripts";
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        # "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        # "col.inactive_border" = "0x00000000";
        border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        # disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      dwindle = {
        no_gaps_when_only = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
        no_gaps_when_only = false;
      };

      decoration = {
        rounding = 5;
        active_opacity = 0.90;
        inactive_opacity = 0.90;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 1;
          passes = 4;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        drop_shadow = true;

        shadow_ignore_window = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
        # "col.shadow" = "rgba(00000055)";
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };
      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
        # "$mod, W, exec, hyprctl dispatch exit 1"
      ];
      binds = [
        "Control_L&Alt_L, Delete, exec, hyprctl dispatch exit"
      ];
      bind = [
        # Lock
        "$mod SHIFT, L, exec, hyprlock"
        "$mod, Q, killactive,"
        "$mod, Return, exec, kitty"
        "$mod, B, exec, one.ablaze.floorp"	
        "$mod, D, exec, rofi-launcher"

        # Window control

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"
        "$mod CTRL, left, resizeactive, -80 0"
        "$mod CTRL, right, resizeactive, 80 0"
        "$mod CTRL, up, resizeactive, 0 -80"
        "$mod CTRL, down, resizeactive, 0 80"
        "$mod ALT, left, moveactive,  -80 0"
        "$mod ALT, right, moveactive, 80 0"
        "$mod ALT, up, moveactive, 0 -80"
        "$mod ALT, down, moveactive, 0 80"
        # Workspace control
        "$mod SHIFT,F,togglefloating"
        "$mod,1,workspace,1"
        "$mod,2,workspace,2"
        "$mod,3,workspace,3"
        "$mod,4,workspace,4"
        "$mod,5,workspace,5"
        "$mod,6,workspace,6"
        "$mod,7,workspace,7"
        "$mod,8,workspace,8"
        "$mod,9,workspace,9"
        "$mod,0,workspace,10"
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
        # Move to Workspace
        "$mod SHIFT,1,movetoworkspace,1"
        "$mod SHIFT,2,movetoworkspace,2"
        "$mod SHIFT,3,movetoworkspace,3"
        "$mod SHIFT,4,movetoworkspace,4"
        "$mod SHIFT,5,movetoworkspace,5"
        "$mod SHIFT,6,movetoworkspace,6"
        "$mod SHIFT,7,movetoworkspace,7"
        "$mod SHIFT,8,movetoworkspace,8"
        "$mod SHIFT,9,movetoworkspace,9"
        "$mod SHIFT,0,movetoworkspace,10"
        # Screenshot a window
        "$mod, PRINT, exec, hyprshot -m window"
        # Screenshot a monitor
        ", PRINT, exec, hyprshot -m output"
        # Screenshot a region
        "$mod SHIFT, PRINT, exec, hyprshot -m region"
        ", xf86TouchpadOn, exec, $scriptsDir/TouchPad.sh #disable touchpad"
        ", xf86TouchpadOff, exec, $scriptsDir/TouchPad.sh #enable touchpad"
      ];
      binde = [
        # Laptop brigthness
        ", xf86MonBrightnessDown, exec, $scriptsDir/Brightness.sh --dec" 
        ", xf86MonBrightnessUp, exec, $scriptsDir/Brightness.sh --inc" 
      ];

      bindel = [
        # Sound 
        ", xf86audioraisevolume, exec, $scriptsDir/Volume.sh --inc #volume up"
        ", xf86audiolowervolume, exec, $scriptsDir/Volume.sh --dec #volume down"       
      ];

      bindl = [
        ", xf86AudioMicMute, exec, $scriptsDir/Volume.sh --toggle-mic #mute mic"
        ", xf86audiomute, exec, $scriptsDir/Volume.sh --toggle"
        ", xf86Sleep, exec, systemctl suspend  # sleep button"
        ", xf86Rfkill, exec, $scriptsDir/AirplaneMode.sh #Airplane mode"
        ", xf86AudioPlayPause, exec, $scriptsDir/MediaCtrl.sh --pause"
        ", xf86AudioPause, exec, $scriptsDir/MediaCtrl.sh --pause"
        ", xf86AudioPlay, exec, $scriptsDir/MediaCtrl.sh --pause"
        ", xf86AudioNext, exec, $scriptsDir/MediaCtrl.sh --nxt"
        ", xf86AudioPrev, exec, $scriptsDir/MediaCtrl.sh --prv"
        ", xf86audiostop, exec, $scriptsDir/MediaCtrl.sh --stop"
      ];
      input = {
        kb_layout= "us,ru";
        kb_options= "grp:win_space_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };
    };
  };
}
