{
  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      checks.x86_64-linux.dockerfile-linting =
        (pkgs.runCommand "hadolint" { buildInputs = [ pkgs.hadolint ]; } ''
          hadolint ${self}/Dockerfile > $out
        '');
      devShells.x86_64-linux.default =
        pkgs.mkShell { packages = [ pkgs.trivy ]; };
    };
}
