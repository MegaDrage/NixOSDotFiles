{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "gruvbox-plus";

  src = pkgs.fetchurl {
    url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.4.0/gruvbox-plus-icon-pack-5.4.zip";
    sha256 = "1zpr9ha5x3546ms8gqhzs8j7inhz1j4disap7s897zmfipj88zd5";
  };

  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/
    ${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
