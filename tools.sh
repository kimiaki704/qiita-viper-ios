#!/usr/bin/env bash
# debug log
set -e

# Homebrew

if [ ! $(which brew) ]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "homebrew found."
fi

if [ ! $(which mint) ]; then
  echo "Installing mint..."
  brew install mint
else
  echo "mint found."
fi

# Mint

echo "Installing library via Mint..."

mint bootstrap

echo "Finish Installing library via Mint!"

