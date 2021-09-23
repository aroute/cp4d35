#!/bin/bash
cat <<EOF >>discovery-override.yaml
wdRelease:
  deploymentType: Development
EOF
cd cpd-cli-workspace/
rm -rf *
cd ..
./cpd-cli adm --repo ./repo.yaml --assembly watson-discovery --arch x86_64 --accept-all-licenses --namespace zen --verbose
