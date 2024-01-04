#!/bin/bash

for platform in alma alpine amazon debian
do
  ./build_scripts/build_${platform}_platforms.sh
  retval=$?
  if [[ retval -ne 0 ]]; then
    exit $retval
  fi
done

