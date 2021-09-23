#!/bin/bash
cd cpd-cli-workspace/
rm -rf *
cd ..
./cpd-cli adm --repo ./repo.yaml --assembly wml --arch x86_64 --accept-all-licenses --namespace zen --verbose
