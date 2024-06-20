{ lib, ... }: {
  options.services.redis = {
    enable = lib.mkEnableOption "Redis server";

    port = lib.mkOption {
      type = lib.types.port;
      default = 0;
      description = ''
        Configures the port Redis will listen on.

        By default tcp is disabled and redis only listens on /tmp/redis/redis.sock.
      '';
    };
  };
}
