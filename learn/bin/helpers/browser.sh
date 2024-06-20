#!/usr/bin/env sh
#
# Copyright (c) Microsoft Corporation. All rights reserved.
#
ROOT="$(dirname "$(dirname "$(dirname "$(readlink -f "$0")")")")"

APP_NAME="code-oss-cloud-workstations"
VERSION="1.83.1"
COMMIT="70b3ad99742f399fee08e39534bf7e649b81921a"
EXEC_NAME="code-oss-cloud-workstations"
CLI_SCRIPT="$ROOT/out/server-cli.js"
"$ROOT/node" "$CLI_SCRIPT" "$APP_NAME" "$VERSION" "$COMMIT" "$EXEC_NAME" "--openExternal" "$@"
