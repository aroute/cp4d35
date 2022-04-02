#!/bin/bash

set -e

## This pulls the CLI for Linux. If you are on Mac, replace the URL with Mac specific binary file.

# curl -sLo /tmp/cpd-cli.tar.gz https://github.com/IBM/cpd-cli/releases/download/v3.5.4/cpd-cli-linux-EE-3.5.4.tgz
# curl -sLo /tmp/cpd-cli.tar.gz https://github.com/IBM/cpd-cli/releases/download/v3.5.6/cpd-cli-linux-EE-3.5.6.tgz
# curl -sLo /tmp/cpd-cli.tar.gz https://github.com/IBM/cpd-cli/releases/download/v3.5.7/cpd-cli-linux-EE-3.5.7.tgz
curl -sLo /tmp/cpd-cli.tar.gz https://github.com/IBM/cpd-cli/releases/download/v3.5.8/cpd-cli-linux-EE-3.5.8.tgz
tar xzvf /tmp/cpd-cli.tar.gz -C . 
rm -rf /tmp/cpd-cli.tar.gz
