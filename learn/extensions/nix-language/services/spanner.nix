{ lib, ... }: {
  options.services.spanner = {
    enable = lib.mkEnableOption "Google Cloud Spanner Emulator";

    grpc-port = lib.mkOption {
      type = lib.types.port;
      default = 9010;
      description = "The TCP port to which the emulator should be bound.";
    };

    rest-port = lib.mkOption {
      type = lib.types.port;
      default = 9020;
      description = "The port at which REST requests are served";
    };

    fault-injection =
      lib.mkEnableOption "random fault injection into transations";
  };
}
