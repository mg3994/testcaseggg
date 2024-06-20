{ lib, pkgs, config, ... }: {
  options.services.postgres = {
    enable = lib.mkEnableOption "PostgreSQL server";

    package = lib.mkOption {
      type = lib.types.package;
      description = "PostgreSQL package to use.";
      default = pkgs.postgresql;
      defaultText = lib.literalExpression "pkgs.postgresql";
      example = lib.literalExpression "pkgs.postgresql_15";
    };

    extensions = lib.mkOption {
      type = with lib.types;
        listOf
        (enum (builtins.attrNames config.services.postgres.package.pkgs));
      default = [ ];
      example = lib.literalExpression ''[ "pgvector" "postgis" ];'';
      description = "Postgres extensions to install.";
    };
  };
}
