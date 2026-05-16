{
  description = "Valhalla - Raspberry Pi server configuration environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            name = "valhalla-ansible";

            buildInputs = with pkgs; [
              ansible
              ansible-lint
              python3
              python3Packages.jmespath
              openssh
              sshpass
            ];

            shellHook = ''
              echo "Valhalla ansible environment ready"
              echo "Ansible version: $(ansible --version | head -1)"
            '';
          };
        });
    };
}
