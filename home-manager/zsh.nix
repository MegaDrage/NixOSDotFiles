{config, ...}:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    shellAliases = {
    };
    # dotDir = "${config.xdg.dataHome}/zsh";
    initExtra = "eval \"$(direnv hook zsh)\"";
  };
}
