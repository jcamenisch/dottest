#!/usr/bin/env bash

is_executable () {
	type $1 &> /dev/null
}

perform_install() {
  echo "Installing $1..."
  brew install $1
}

ensure_installed () {
  echo -n 'Checking for `'$1'` executable...'
  if is_executable $1; then
    echo 'already installed'
  else
    perform_install $1
  fi
}

# Install testing tool
# See https://empty.sourceforge.net/
# TODO:
# Check if empty is already installed
ensure_installed empty