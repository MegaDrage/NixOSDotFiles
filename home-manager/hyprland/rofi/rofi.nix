{ pkgs, config, lib, ... }:
{
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "drun,filebrowser,run";
        show-icons = true;
        icon-theme = "Papirus";
        location = 0;
        font = "JetBrainsMono Nerd Font Mono 12";
        drun-display-format = "{icon} {name}";
        display-drun = " Apps";
        display-run = " Run";
        display-filebrowser = " File";
      };
      theme =
        {
          "*" = {
            bg = lib.mkDefault "#${config.stylix.base16Scheme.base00}";
            bg-alt = lib.mkDefault "#${config.stylix.base16Scheme.base09}";
            # foreground = lib.mkDefault "#${config.stylix.base16Scheme.base01}";
            selected = lib.mkDefault "#${config.stylix.base16Scheme.base08}";
            active = lib.mkDefault "#${config.stylix.base16Scheme.base0B}";
            text-selected = lib.mkDefault "#${config.stylix.base16Scheme.base00}";
            text-color = lib.mkDefault "#${config.stylix.base16Scheme.base05}";
            # border-color = lib.mkDefault "#${config.stylix.base16Scheme.base0F}";
            urgent = lib.mkDefault "#${config.stylix.base16Scheme.base0E}";
          };
          "window" = {
            width = lib.mkDefault "50%";
            transparency = "real";
            orientation = lib.mkDefault "vertical";
            cursor = lib.mkDefault "default";
            spacing = lib.mkDefault "0px";
            border = lib.mkDefault "2px";
            border-color = "@border-color";
            border-radius = lib.mkDefault "20px";
            background-color = lib.mkDefault "@bg";
          };
          "mainbox" = {
            padding = lib.mkDefault "15px";
            enabled = true;
            orientation = lib.mkDefault "vertical";
            children = map lib.mkDefault [
              "inputbar"
              "listbox"
            ];
            background-color = lib.mkDefault "transparent";
          };
          "inputbar" = {
            enabled = true;
            padding = lib.mkDefault "10px 10px 200px 10px";
            margin = lib.mkDefault "10px";
            background-color = lib.mkDefault "transparent";
            border-radius = "25px";
            orientation = lib.mkDefault "horizontal";
            children = map lib.mkDefault [
              "entry"
              "dummy"
              "mode-switcher"
            ];
            # background-image = lib.mkDefault ''url("~/Pictures/Wallpapers/beautifulmountainscape.jpg", width)'';
          };
          "entry" = {
            enabled = true;
            expand = false;
            width = lib.mkDefault "20%";
            padding = lib.mkDefault "10px";
            border-radius = lib.mkDefault "12px";
            background-color = lib.mkDefault "@selected";
            text-color = lib.mkDefault "@text-selected";
            cursor = lib.mkDefault "text";
            placeholder = "🖥️ Search ";
            placeholder-color = lib.mkDefault "inherit";
          };
          "listbox" = {
            spacing = lib.mkDefault "10px";
            padding = lib.mkDefault "10px";
            background-color = lib.mkDefault "transparent";
            orientation = lib.mkDefault "vertical";
            children = map lib.mkDefault [
              "message"
              "listview"
            ];
          };
          "listview" = {
            enabled = true;
            columns = 2;
            lines = 6;
            cycle = true;
            dynamic = true;
            scrollbar = false;
            layout = lib.mkDefault "vertical";
            reverse = false;
            fixed-height = false;
            fixed-columns = true;
            spacing = lib.mkDefault "10px";
            background-color = lib.mkDefault "transparent";
            border = lib.mkDefault "0px";
          };
          "dummy" = {
            expand = true;
            background-color = lib.mkDefault "transparent";
          };
          "mode-switcher" = {
            enabled = true;
            spacing = lib.mkDefault "10px";
            background-color = lib.mkDefault "transparent";
          };
          "button" = {
            width = lib.mkDefault "5%";
            padding = lib.mkDefault "12px";
            border-radius = lib.mkDefault "12px";
            background-color = lib.mkDefault "@text-selected";
            # text-color = lib.mkDefault "@text-color";
            cursor = lib.mkDefault "pointer";
          };
          "button selected" = {
            # background-color = lib.mkDefault "@selected";
            # text-color = lib.mkDefault "@text-selected";
          };
          "scrollbar" = {
            width = lib.mkDefault "4px";
            border = 0;
            handle-color = lib.mkDefault "@border-color";
            handle-width = lib.mkDefault "8px";
            padding = 0;
          };
          "element" = {
            enabled = true;
            spacing = lib.mkDefault "10px";
            padding = lib.mkDefault "10px";
            border-radius = lib.mkDefault "12px";
            background-color = lib.mkDefault "transparent";
            cursor = lib.mkDefault "pointer";
          };
          "element normal.normal" = {
            background-color = lib.mkDefault "inherit";
            text-color = lib.mkDefault "inherit";
          };
          "element normal.urgent" = {
            background-color = lib.mkDefault "@urgent";
            text-color = lib.mkDefault "@foreground";
          };
          "element normal.active" = {
            background-color = lib.mkDefault "@active";
            text-color = lib.mkDefault "@foreground";
          };
          "element selected.normal" = {
            background-color = lib.mkDefault "@selected";
            text-color = lib.mkDefault "@text-selected";
          };
          "element selected.urgent" = {
            background-color = lib.mkDefault "@urgent";
            text-color = lib.mkDefault "@text-selected";
          };
          "element selected.active" = {
            background-color = lib.mkDefault "@urgent";
            text-color = lib.mkDefault "@text-selected";
          };
          "element alternate.normal" = {
            background-color = lib.mkDefault "transparent";
            text-color = lib.mkDefault "inherit";
          };
          "element alternate.urgent" = {
            background-color = lib.mkDefault "transparent";
            text-color = lib.mkDefault "inherit";
          };
          "element alternate.active" = {
            background-color = lib.mkDefault "transparent";
            text-color = lib.mkDefault "inherit";
          };
          "element-icon" = {
            background-color = lib.mkDefault "transparent";
            text-color = lib.mkDefault "inherit";
            size = lib.mkDefault "36px";
            cursor = lib.mkDefault "inherit";
          };
          "element-text" = {
            background-color = lib.mkDefault "transparent";
            font = "JetBrainsMono Nerd Font Mono 12";
            text-color = lib.mkDefault "inherit";
            cursor = lib.mkDefault "inherit";
            vertical-align = lib.mkDefault "0.5";
            horizontal-align = lib.mkDefault "0.0";
          };
          "message" = {
            background-color = lib.mkDefault "transparent";
            border = lib.mkDefault "0px";
          };
          "textbox" = {
            padding = lib.mkDefault "12px";
            border-radius = lib.mkDefault "10px";
            background-color = lib.mkDefault "@bg-alt";
            text-color = lib.mkDefault "@bg";
            vertical-align = lib.mkDefault "0.5";
            horizontal-align = lib.mkDefault "0.0";
          };
          "error-message" = {
            padding = lib.mkDefault "12px";
            border-radius = lib.mkDefault "20px";
            background-color = lib.mkDefault "@bg-alt";
            text-color = lib.mkDefault "@bg";
          };
        };
    };
  };
}

