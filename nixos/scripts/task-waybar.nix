{ pkgs, ... }:
let
task-waybar = pkgs.writeShellApplication {
  name = "task-waybar";
  runtimeInputs = [
    pkgs.swaynotificationcenter
  ];
  text = ''
  sleep 0.1
  swaync-client -t &
  '';
};
in {
  environment.systemPackages = [task-waybar];
}