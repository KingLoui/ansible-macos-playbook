#!/usr/bin/env bash

set -o errexit
set -o errtrace
set -o nounset

REPO="https://github.com/KingLoui/ansible-macos-playbook.git"
TARGET_DIR="$HOME/devenv/ansible-macos-playbook"

# Ask for sudo password upfront if needed
if ! sudo -n true 2>/dev/null; then
    echo "Enter Sudo "
    sudo -v
    # Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

if test ! $(which brew); then
  echo "Installing Homebrew..."
  yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Done"
else
  echo "Homebrew is already installed"
fi

if test ! $(which ansible); then
  echo "Installing Ansible"
  brew install ansible
  echo "Done"
else
  echo "Ansible is already installed"
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "Cloning playbook repository"
  mkdir -p "$TARGET_DIR" && git clone $REPO "$TARGET_DIR"
else
  echo "The playbook repository is already in place"
fi

cd "$TARGET_DIR"

echo "Running the playbook"
ansible-playbook main.yml
