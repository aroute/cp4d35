#!/bin/bash

set -e

for n in watson-discovery ibm-minio-operator wsl wml ; do ./cpd-cli uninstall --assembly ${n} --include-dependent-assemblies --namespace zen --arch x86_64 --verbose ; done

./cpd-cli uninstall --assembly db2wh --include-dependent-assemblies --namespace zen --arch x86_64 --profile cpd-admin-profile --verbose

oc delete pvc -n zen --all

#./cpd-cli uninstall --assembly watson-discovery --namespace zen --arch x86_64 --verbose
#./cpd-cli uninstall --assembly edb-operator --namespace zen --arch x86_64 --verbose
#./cpd-cli uninstall --assembly wsl --namespace zen --arch x86_64 --verbose
#./cpd-cli uninstall --assembly wml --namespace zen --arch x86_64 --verbose
#./cpd-cli uninstall --assembly db2wh --namespace zen --arch x86_64 --verbose
#./cpd-cli uninstall --assembly lite --namespace zen --arch x86_64 --verbose

oc delete scc cpd-user-scc
oc delete scc cpd-zensys-scc
oc get crd |grep discovery.watson* | xargs oc delete crd
oc get crd |grep db2u.databases* | xargs oc delete crd
oc get crd |grep cloudpackopen.ibm.com* | xargs oc delete crd
oc get crd |grep modeltrain.ibm.com* | xargs oc delete crd

oc delete namespace zen
