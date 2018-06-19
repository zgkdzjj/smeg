#!/bin/bash
# Load RVM into a shell session *as a function*
if [[ -s "/home/deploy/.rvm/scripts/rvm" ]] ; then

  # try source deploy's rvm
  source "/home/deploy/.rvm/scripts/rvm"

elif [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/share/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/share/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"
  exit 1

fi

rvm use "2.4.1"

# execute argument
eval $1
