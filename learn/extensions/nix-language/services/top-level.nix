# Defines the config schema for Monospace workspaces.

{ lib, ... }:
let types = lib.types;
in {
  options = {
    channel = lib.mkOption {
      type = types.enum [ "stable-23.05" "stable-23.11" "stable-24.05" "unstable" ];
      description = ''
        nixpkgs channel to use.

        This channel defines the contents of the `pkgs` argument.
      '';
      default = "stable-23.11";

    };
    env = lib.mkOption {
      type = types.attrsOf types.anything;
      description = ''
        Environment variables that are set inside the developer environment.

        These are propagated to all of your shells and the preview server.
        Environment variables can be especially useful if your application
        requires a specific set of variables.

        Example:

        ```nix
        {pkgs, ...}: {
          env = {
            HELLO = "world";
          };
        }
        ```
      '';
      default = { };
    };

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      description = ''
        Packages to install in the environment.

        You can use the `pkgs` argument to select packages to install, for example `pkgs.python3`.
        Note that the contents of `pkgs` depends on the selected `channel` channel option.

        Example:

        ```nix
        {pkgs, ...}: {
          channel = "stable-23.11";
          packages = [pkgs.vim];
        }
        ```

        You can search for available packages here: [stable-23.11](https://search.nixos.org/packages?channel=23.11) or [unstable](https://search.nixos.org/packages?channel=unstable).
      '';
      default = [ ];
    };
  };
}
