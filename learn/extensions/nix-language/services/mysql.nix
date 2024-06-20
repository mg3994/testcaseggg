{ lib, pkgs, config, ... }: {
  options.services.mysql = {
    enable = lib.mkEnableOption ''
      MySQL server.

      The server is initialized with a passwordless user root. So to create additional users and
      create databases use `mysql -u root`.
    '';

    package = lib.mkOption {
      type = lib.types.package;
      description = "MySQL package to use.";
      default = pkgs.mysql;
      defaultText = lib.literalExpression "pkgs.mysql";
      example = lib.literalExpression "pkgs.mysql80";
    };
  };
}
