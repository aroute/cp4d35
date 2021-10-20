#!/bin/bash

./cpd-cli adm --repo repo.yaml --assembly lite --namespace zen --arch x86_64 --verbose --accept-all-licenses
./cpd-cli adm --repo repo.yaml --assembly lite --namespace zen --arch x86_64 --verbose --accept-all-licenses --apply

./cpd-cli install \
--repo ./repo.yaml \
--assembly lite \
--arch x86_64 \
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

./cpd-cli status --assembly lite --namespace zen
