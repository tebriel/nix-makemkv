{ pkgs ? import <nixpkgs> { }
, pkgsLinux ? import <nixpkgs> {
  system = "x86_64-linux";
  config.allowUnfree = true;
}
}:

pkgs.dockerTools.buildImage {
  name = "tebriel/nix-makemkv";
  config = {
    Cmd = [ "${pkgsLinux.makemkv}/bin/makemkvcon" "--help" ];
  };
}
