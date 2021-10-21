#!/bin/bash

set -e

./cpd-cli status --repo ./repo.yaml --namespace zen --patches --available-updates
