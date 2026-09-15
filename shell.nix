{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz") {} }:

pkgs.mkShell {
    buildInputs = with pkgs; [
        go
        gopls
        go-tools
        golangci-lint
        git
        govulncheck
    ];

    shellHook = ''
        export GOPATH="$PWD/.gopath"
        export GOBIN="$GOPATH/bin"
        export PATH="$GOBIN:$PATH"
        echo "Go $(go version) ready"
    '';
}
