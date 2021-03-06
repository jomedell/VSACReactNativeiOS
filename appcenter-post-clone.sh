#!/usr/bin/env bash

# Install the proper node version
set -ex
brew uninstall node@6
NODE_VERSION="10.14.0"
curl "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.pkg" > "$HOME/Downloads/node-installer.pkg"
sudo installer -store -pkg "$HOME/Downloads/node-installer.pkg" -target "/"