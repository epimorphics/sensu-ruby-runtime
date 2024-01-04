#!/bin/bash

mkdir -p dist
mkdir -p assets
mkdir -p scripts

# Alma platform
platform="almalinux9.3" test_platforms="almalinux:9 debian:12 ubuntu:22.04" ./build_scripts/build_and_test_platform.sh
retval=$?
if [[ retval -ne 0 ]]; then
  exit $retval
fi
