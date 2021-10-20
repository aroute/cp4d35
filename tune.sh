#!/bin/bash

ENTITLEMENT_KEY=enter_api_key
oc project kube-system
oc create secret docker-registry cpregistrysecret --docker-server cp.icr.io/cp/cpd --docker-username cp --docker-password $ENTITLEMENT_KEY --docker-email a@b.c
oc apply -f setkernelparams.yaml -n kube-system
oc apply -f norootsquash.yaml -n kube-system
