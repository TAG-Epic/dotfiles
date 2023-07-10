{
    description = "dotfiles";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
        home-manager.url = "github:nix-community/home-manager/release-23.05";
        wallpaper-collection = {
            url = "github:DenverCoder1/minimalistic-wallpaper-collection/main";
            flake = false;
        };
        hyprsome.url = "github:sopa0/hyprsome";
        hyprsome.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.kraken = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [home-manager.nixosModules.default (import ./machines/kraken/configuration.nix inputs)];
        };
        nixosConfigurations.sylveon = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [home-manager.nixosModules.default (import ./machines/sylveon/configuration.nix inputs)];
        };
    };
}
