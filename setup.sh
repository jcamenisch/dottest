#!/usr/bin/env bash

is_executable () {
	type $1 &> /dev/null
}

perform_install() {
  echo "Installing $1..."
  # TODO:
  #  - Check for presence of brew
  #  - Possibly support alternative package managers
  brew install $1
}

ensure_installed () {
  echo -n 'Checking for `'$1'` executable...'
  if is_executable $1 || brew list $1 2>&1 > /dev/null; then
    echo 'already installed'
  else
    # TODO: Handle failure
    #  - Idea: take a second argument with instructions on how to install manually
    perform_install $1
  fi
}

ensure_brew_tap() {
  echo -n 'Checking for brew tap `'$1'`...'
  if brew tap | grep -q $1; then
    echo 'already present'
  else
    brew tap $1
  fi
}

ensure_symlink() {
  echo -n 'Checking for symlink `'$1'`...'
  if [ -L $1 ]; then
    echo 'already present'
  else
    target=$(readlink -f $2)
    echo "setting to $target"
    ln -s $target $1
  fi
}

# Install coredns
# See https://coredns.io/
ensure_installed coredns

#=======================#
# Install testing tools #
#=======================#

# See https://github.com/bats-core/bats-core
# TODO: Manage version using asdf or Docker
ensure_brew_tap kaos/shell
ensure_installed bats-core
ensure_installed bats-support
ensure_installed bats-assert

ensure_installed dig

ensure_symlink test_helpers/bats-support $(brew --prefix bats-support)
ensure_symlink test_helpers/bats-assert $(brew --prefix bats-assert)
