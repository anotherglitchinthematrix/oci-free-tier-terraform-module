#!/usr/bin/env bash

TERMINATE=0;

function abort {
  TERMINATE=1;
}

trap abort 0 1 2 3 6 9 15;

# Retry until succeed.
while true; do
  terraform apply -no-color -auto-approve # 1> /dev/null;
  if [[ $? -eq 0 || $TERMINATE -eq 1 ]]; then break; fi;
done;
