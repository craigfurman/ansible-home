#!/bin/bash -e

if [ -n "$1" ]; then
  con="$1"
  echo "running with --con=$con"
  shift
fi

pushd $(dirname $0)
cmd="ansible-playbook --ask-become-pass -i hosts main.yml"

if [ -n "$con" ]; then
  cmd="$cmd --con=$con"
fi

$cmd
popd
