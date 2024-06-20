{ lib, ... }:
let t = lib.types;
in {
  options.idx.workspace = {
    onCreate = lib.mkOption {
      type = t.attrsOf (t.either t.path t.str);
      default = { };
      description = ''
        Commands to execute when the workspace is created and opened for the first time.

        This can be useful to setup the development environment. For example, here we are
        specifying `npm install` to run:

        ```nix
        {pkgs, ...}: {
          idx.workspace.onCreate = {
            npm-install = "npm install";
          };
        }
        ```
      '';
    };
    onStart = lib.mkOption {
      type = t.attrsOf (t.either t.path t.str);
      default = { };
      description = ''
        Commands to execute whenever the workspace is opened.

        This can be useful to start build watchers. For example, here we are
        specifying 2 commands to run:

        ```nix
        {pkgs, ...}: {
          idx.workspace.onStart = {
            npm-watch-fe = "npm run watch:frontend";
            npm-watch-be = "npm run watch:backend";
          };
        }
        ```
      '';
    };
  };
}
