{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      scanner = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/scanner/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      operator = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/operator/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
    
    homeConfigurations = {
      gunner = home-manager.lib-homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/gunner/home.nix ];
      };
    };
  };
}
