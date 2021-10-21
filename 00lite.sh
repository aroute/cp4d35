#!/bin/bash

set -e

./cpd-cli adm --repo repo.yaml --assembly lite --namespace zen --arch x86_64 --verbose --accept-all-licenses
./cpd-cli adm --repo repo.yaml --assembly lite --namespace zen --arch x86_64 --verbose --accept-all-licenses --apply

export REG=$(oc get route image-registry -n openshift-image-registry -o jsonpath='{.spec.host}')

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

oc project zen
nginxpod=$(oc get pod -n zen -l component=ibm-nginx -o jsonpath='{.items[0].metadata.name}')
oc cp $nginxpod:/etc/nginx/config/ssl/cert.crt cert.crt
routepolicy=`oc get route -n zen | awk '$1 == "zen-cpd" {print $5}'`
if [[ $routepolicy != "reencrypt" ]]; then
oc delete route zen-cpd
oc create route reencrypt zen-cpd --service=ibm-nginx-svc --port=ibm-nginx-https-port --dest-ca-cert=cert.crt
oc annotate route zen-cpd --overwrite haproxy.router.openshift.io/timeout=3600s
fi