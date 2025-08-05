{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos95 = {
      url = "github:Peritia-System/NixOS-95-BETA";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }: {
    modules = {
      taskbar = ./nixos95/taskbar.nix;
    };
  };
}
