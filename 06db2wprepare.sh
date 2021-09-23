#!/bin/bash
cd cpd-cli-workspace/
rm -rf *
cd ..
./cpd-cli adm -r repo.yaml --assembly db2wh --namespace zen --accept-all-licenses
