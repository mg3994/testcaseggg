{ lib, ... }: {
  options.services.docker = { enable = lib.mkEnableOption "Rootless docker"; };
}
