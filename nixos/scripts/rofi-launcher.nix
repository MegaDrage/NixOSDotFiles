{ pkgs, ... }:
let
rofi-launcher = pkgs.writeShellApplication {
  name = "rofi-launcher";
  text = ''
    if pgrep -x "rofi" > /dev/null; then
      # Rofi is running, kill it
      pkill -x rofi
      exit 0
    fi
    rofi -show drun
  '';
};
in {
  environment.systemPackages = [rofi-launcher];
}