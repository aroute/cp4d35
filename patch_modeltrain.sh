#!/bin/bash

# Type patch name as the first argument and dry-run as the second argument
# Run the second time without dry-run.

export REG=$(oc get route image-registry -n openshift-image-registry -o jsonpath='{.spec.host}')

# oc delete cronjobs watchdog-alert-monitoring-cronjob watchdog-alert-monitoring-purge-cronjob zen-watchdog-cronjob diagnostics-cronjob

./cpd-cli patch \
--repo ./repo.yaml \
--assembly modeltrain-classic \
--namespace zen \
--patch-name modeltrain-classic-1.0.2-patch-2 \
--transfer-image-to ${REG}/zen \
--cluster-pull-prefix image-registry.openshift-image-registry.svc:5000/zen \
--insecure-skip-tls-verify \
--target-registry-username $(oc whoami) \
--target-registry-password $(oc whoami -t) \
--action transfer \
--verbose
