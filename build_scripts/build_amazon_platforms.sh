#!/bin/bash

mkdir -p dist
mkdir -p assets
mkdir -p scripts

# Amazon 2 platform
platform="amzn2" test_platforms="almalinux:9 debian:10 ubuntu:22.04 ubuntu:20.04" ./build_scripts/build_and_test_platform.sh
retval=$?
if [[ retval -ne 0 ]]; then
  exit $retval
fi

