{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      update-dependencies = pkgs.writeShellApplication {
        name = "update-dependencies";
        runtimeInputs = with pkgs; [ gh gettext nushell ];
        text = ''
          nu -n -c 'use ${./lib.nu} *; update-dependencies'
        '';
      };

      git-create-pr = pkgs.writeShellApplication {
        name = "git-create-pr";
        runtimeInputs = with pkgs; [ git gh update-dependencies ];
        text = ''
          current_branch_name=$(git branch --show-current)
          branch_name=$(date -u +%Y_%m_%d_%H_%M_%S)

          echo "Creating git branch ''${branch_name}"
          git checkout -b "''${branch_name}"

          echo "Generating Dockerfile and README"
          update-dependencies

          echo "Diffing the changes"
          if git diff --exit-code; then
            echo "We did not change the code"
          else
            echo "We changed the code"
            git config user.name "dockerfile-generator"
            git config user.email "dockerfile-generator@github.actions"
            git commit -a -m "Code changes from dockerfile-generator"
            git push --set-upstream origin "''${branch_name}"
            gh pr create --title "Automated dependency bumping"                           \
                         --body "Dependencies are updated by dockerfile-generator script" \
                         --label "dependencies"
          fi

          echo "Switching back to ''${current_branch_name}"
          git switch "''${current_branch_name}"
          echo "Deleting ''${branch_name} branch"
          git branch --delete "''${branch_name}"
        '';
      };
      new-release = pkgs.writeShellApplication {
        name = "new-release";
        runtimeInputs = with pkgs; [ gh ];
        text = ''
          release_id="v$(head -n 1 Dockerfile | sed 's|^FROM google/cloud-sdk:\([0-9\\.]*\)-alpine.*$|\1|')"
          echo "Creating release: ''${release_id}"
          gh release create "''${release_id}" --generate-notes --title "''${release_id}"
        '';
      };
      nix-update = pkgs.writeShellApplication {
        name = "nix-update";
        runtimeInputs = with pkgs; [ nix git gh ];
        text = ''
          current_branch_name=$(git branch --show-current)
          branch_name=$(date -u +%Y_%m_%d_%H_%M_%S)

          echo "Creating git branch ''${branch_name}"
          git checkout -b "''${branch_name}"

          echo "Updating nix inputs"
          nix flake update

          echo "Checking"
          nix flake check

          echo "Diffing the changes"
          if git diff --exit-code; then
            echo "We did not change the code"
          else
            echo "We changed the code"
            git config user.name "nix-flake-updater"
            git config user.email "nix-flake-updater@github.actions"
            git commit -a -m "Code changes from nix-flake-updater"
            git push --set-upstream origin "''${branch_name}"
            gh pr create --title "Automated nix flake update"                           \
                         --body "Nix flake inputs are updated" \
                         --label "dependencies"
          fi

          echo "Switching back to ''${current_branch_name}"
          git switch "''${current_branch_name}"
          echo "Deleting ''${branch_name} branch"
          git branch --delete "''${branch_name}"
        '';
      };
    in {
      checks.x86_64-linux.dockerfile-linting =
        (pkgs.runCommand "hadolint" { buildInputs = [ pkgs.hadolint ]; } ''
          hadolint ${self}/Dockerfile --ignore DL3047 > $out
        '');
      devShells.x86_64-linux = {
        default = pkgs.mkShell {
          packages = [
            pkgs.nushell
            pkgs.gh
            pkgs.gettext
            git-create-pr
            new-release
            nix-update
          ];
        };
        git-create-pr = pkgs.mkShell { packages = [ git-create-pr ]; };
        new-release = pkgs.mkShell { packages = [ new-release ]; };
        nix-update = pkgs.mkShell { packages = [ nix-update ]; };
      };
    };
}
