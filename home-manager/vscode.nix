{pkgs, ...}: {
    programs.vscode = {
        enable = true;
        # package = pkgs.vscodium;  
        userSettings = {
            "files.autoSave" = "afterDelay";
            "editor.fontFamily" = "'JetBrains Mono'";
            "editor.fontSize" = 13;
            "editor.fontLigatures" = true;
        };
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
            yzhang.markdown-all-in-one
            jnoortheen.nix-ide
            mkhl.direnv
            arrterian.nix-env-selector
            llvm-vs-code-extensions.vscode-clangd
            ms-python.python
            #kiteco.kite
            #EricSia.pythonsnippets3
            aaron-bond.better-comments
        ];
    };
}
