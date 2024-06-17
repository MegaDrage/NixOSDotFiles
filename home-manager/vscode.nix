{pkgs, ...}: {
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;  
        userSettings = {
            "files.autoSave" = "afterDelay";
            "editor.fontFamily" = "'JetBrains Mono'";
            "editor.fontSize" = 15;
            "editor.fontLigatures" = true;
            "editor.letterSpacing" = 0.4;
            "editor.smoothScrolling" = true;
        };
        extensions = with pkgs.vscode-extensions; [
            yzhang.markdown-all-in-one
            jnoortheen.nix-ide
            mkhl.direnv
            arrterian.nix-env-selector
            llvm-vs-code-extensions.vscode-clangd 
            ms-python.python
            #kiteco.kite
            #EricSia.pythonsnippets3
            aaron-bond.better-comments
            bungcip.better-toml
        ];
    };
}