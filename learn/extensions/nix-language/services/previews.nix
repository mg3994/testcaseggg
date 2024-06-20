# idx.previews service definition.

{ config, lib, ... }:
let
  inherit (lib) types;
  newPreviewTypeOptions = {
    command = lib.mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Command to execute";
    };
    env = lib.mkOption {
      type = types.attrsOf types.str;
      default = { };
      description = "Environment variables to set.";
    };
    manager = lib.mkOption {
      type = types.enum [ "web" "flutter" ];
      description = "Manager";
    };
    cwd = lib.mkOption {
      type = types.str;
      default = "";
      description = "Working directory";
    };
  };
  legacyPreviewTypeOptions = newPreviewTypeOptions // {
    id = lib.mkOption {
      type = types.nonEmptyStr;
      description = "ID for the preview";
    };
  };
  newPreviewType =
    types.submodule ({ ... }: { options = newPreviewTypeOptions; });
  legacyPreviewType =
    types.submodule ({ ... }: { options = legacyPreviewTypeOptions; });
in {
  options.idx.previews = {
    enable = lib.mkEnableOption "" // {
      default = true;
      description = ''
        Set this to `true` to enable IDX Previews.

        This feature provides a way to run and reload your apps automatically as you are developing them.
      '';
    };

    previews = lib.mkOption {
      description = ''
        Preview configurations.

        Define the commands IDX executes in your developer environment.

        Example:

        ```nix
        {pkgs, ...}: {
          idx.previews = {
            enable = true;
            previews = {
              web = {
                command = ["yes"];
                cwd = "subfolder";
                manager = "web";
                env = {
                  HELLO = "world";
                };
              };
            };
          };
        }
        ```
      '';
      type = types.either (types.attrsOf newPreviewType)
        (types.listOf legacyPreviewType);
      default = { };
    };
  };
}
