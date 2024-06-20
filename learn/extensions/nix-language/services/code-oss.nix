# idx.previews service definition.

{ lib, ... }: {
  options.idx = {
    enable = lib.mkEnableOption "Code OSS Enabled(ignored/always true)." // {
      default = true;
      internal = true;
    };

    extensions = lib.mkOption {
      description = ''
        Code extensions you want to install in your IDX workspace.

        This is a list of fully qualified extension ids, for example `''${publisherId}.''${extensionId}`.

        You can find a list of available extensions on the [Open VSX Registry](https://open-vsx.org/)
        and enter them in your `dev.nix` file by `''${publisherId}.''${extensionId}`.
      '';
      type = with lib.types; listOf (either nonEmptyStr path);
      default = [ ];
    };
  };
}
