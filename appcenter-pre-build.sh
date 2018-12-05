#!/usr/bin/env bash
set -e

# Lint
yarn lint

# Test the code
# yarn test

# Check packages for vulnerabilities
yarn security-check

# Bump the build number
yarn buildNumberBump

# Generate the Alpha environment file
ENVFILE=env.alpha.config node ./App/Config/.env-generator.js

# Generate the sentry properties files
echo "defaults.url=$SENTRY_URL
defaults.org=think-research
defaults.project=virtualcaremobile
auth.token=$SENTRY_AUTH_TOKEN
cli.executable=node_modules/@sentry/cli/bin/sentry-cli
" >./ios/sentry.properties

cp ./ios/sentry.properties ./android/sentry.properties
