#!/bin/bash
cd cpd-cli-workspace/
rm -rf *
cd ..
./cpd-cli adm -r repo.yaml --assembly db2wh --namespace zen --accept-all-licenses
./cpd-cli adm -r repo.yaml --assembly db2wh --namespace zen --accept-all-licenses --apply
export REG=$(oc get route image-registry -n openshift-image-registry -o jsonpath='{.spec.host}')
./cpd-cli install \
--repo repo.yaml \
--assembly db2wh \
--namespace zen \
--storageclass ${storageclass} \
--accept-all-licenses \
--transfer-image-to ${REG}/zen \
--cluster-pull-prefix image-registry.openshift-image-registry.svc:5000/zen \
--insecure-skip-tls-verify \
--target-registry-username $(oc whoami) \
--target-registry-password $(oc whoami -t) \
--latest-dependency \
--verbose

./cpd-cli status --assembly db2wh --namespace zen
