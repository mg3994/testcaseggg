# testcaseggg_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop


//// export port=8086 #dont use restricted ports (8000, 9000-9002)
// export API_SERVICE="https://$port-$WEB_HOST"
// echo $API_SERVICE

```

{
  "previews": [
    {
      "command": [
        "flutter",
        "run",
        "--machine",
        "-d",
        "android",
        "-d",
        "localhost:5555"
      ],
      "id": "android",
      "manager": "flutter"
    },
    {
      "command": [
        "echo 'test'"
      ],
      "id": "ios",
      "manager": "web"
    }
  ]
}
```