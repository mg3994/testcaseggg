#!/bin/bash
# WARNING: run ./build.sh first!
sudo rm -rf /opt/code-oss/extensions/monospace/
sudo mkdir -p /opt/code-oss/extensions/monospace/
sudo cp package.json /opt/code-oss/extensions/monospace/
sudo cp -rf dist/ /opt/code-oss/extensions/monospace/dist/
# Visual update in the terminal
tput bold ; tput setaf 125
echo "Pushed new vscodeplugin build ... now just reload the workspace (not this tab)"
tput init ; tput sgr0