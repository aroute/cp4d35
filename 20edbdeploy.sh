#!/bin/bash
# First run with dry-run argument.
# Re-run without dry-run argument.
export REG=$(oc get route image-registry -n openshift-image-registry -o jsonpath='{.spec.host}')
./cpd-cli install \
--repo repo.yaml \
--assembly edb-operator \
--optional-modules edb-pg-base:x86_64 \
--arch x86_64 \
--storageclass ibmc-file-gold-gid \
--accept-all-licenses \
--transfer-image-to ${REG}/zen \
--cluster-pull-prefix image-registry.openshift-image-registry.svc:5000/zen \
--insecure-skip-tls-verify \
--target-registry-username $(oc whoami) \
--target-registry-password $(oc whoami -t) \
--latest-dependency \
--namespace zen \
--verbose --$1
