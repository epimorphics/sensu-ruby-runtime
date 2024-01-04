#!/bin/bash

mkdir -p dist
mkdir -p assets
mkdir -p scripts

# Alpine platform
platform="alpine" test_platforms="alpine:3.14.1" ./build_scripts/build_and_test_platform.sh
retval=$?
if [[ retval -ne 0 ]]; then
  exit $retval
fi

