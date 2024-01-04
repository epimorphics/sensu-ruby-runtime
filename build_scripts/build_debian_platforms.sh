#!/bin/bash

mkdir -p dist
mkdir -p assets
mkdir -p scripts

platform="debian" test_platforms="debian:10 ubuntu:22.04 ubuntu:20.04 almalinux:9" ./build_scripts/build_and_test_platform.sh
retval=$?
if [[ retval -ne 0 ]]; then
  exit $retval
fi
