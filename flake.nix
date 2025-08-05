{
  description = "Flake for NixOS-95 theme";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

  };

  outputs =
    { flake-parts, systems, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./nixos95 ];
      nixosModules.nixos95 = import ./nixos95;
      systems = import systems;
    };
}