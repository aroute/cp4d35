#!/bin/bash
oc create route reencrypt --service=image-registry -n openshift-image-registry
oc patch route image-registry -p '{ "metadata": { "annotations": {"haproxy.router.openshift.io/balance": "source" }}}' -n openshift-image-registry
