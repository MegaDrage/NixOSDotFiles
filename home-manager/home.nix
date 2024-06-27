{ pkgs, ... }:

{
  imports = [
    ./vscode.nix
    ./ranger.nix
    ./zsh.nix
    ./hyprland.nix
    ./git.nix
    ./starship.nix
    ./bat.nix
    ./gtk.nix
    ./qt.nix
    ./dfconf.nix
    ./home-packages.nix
    ./kitty.nix
  ];
  home = {
    username = "megadrage";
    homeDirectory = "/home/megadrage";
    stateVersion = "24.05";
    extraBuilderCommands = "sed -i 's/| head -1)/| head -1 || true)/' $out/activate";
  };
}
