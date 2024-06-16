{pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName  = "MegaDrage";
    userEmail = "dragonpsui@gmail.com";
    lfs.enable = true;
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}

