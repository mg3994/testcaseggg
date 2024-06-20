{ lib, ... }: {
  options.services.pubsub = {
    enable = lib.mkEnableOption ''
      Google Pub/Sub emulator.

      More documentation on using the emulator can be found here:
      https://cloud.google.com/pubsub/docs/emulator#using_the_emulator
    '';

    port = lib.mkOption {
      type = lib.types.port;
      default = 8085;
      description = ''
        Configures the port Pub/Sub will listen on.
      '';
    };
    project-id = lib.mkOption {
      type = lib.types.strMatching "[a-z][a-z0-9-]{5,29}";
      default = "idx-pubsub-emulator";
      description = ''
        Project ID to use to run the Pub/Sub emulator.
        This project is for testing only, it does not have to exist and is only used locally.
      '';
    };
  };
}
