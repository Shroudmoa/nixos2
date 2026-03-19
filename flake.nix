{
  description = "Hyprland on Nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations.MyVM = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
        
        home-manager.nixosModules.home-manager

  
        {
          _module.args = {
            pkgsunstable = import nixpkgs-unstable {
              system = "x86_64-linux";
            };
          };
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              pkgsunstable = import nixpkgs-unstable {
                system = "x86_64-linux";
              };
            };

            users = {
              vm = import ./home.nix;
              vm2 = import ./home2.nix; 
            };
#            users.vm = import ./home.nix;
            backupFileExtension = "backup";
          };

#          home-manager = {
 #           useGlobalPkgs = true;
  #          useUserPackages = true;
   #         users.vm = import ./home.nix;
    #        backupFileExtension = "backup";
         # };
        }
      ];
    };
  };
}
