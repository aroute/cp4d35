#!/bin/bash

./cpd-cli uninstall --assembly watson-discovery --namespace zen --arch x86_64 --verbose
./cpd-cli uninstall --assembly edb-operator --namespace zen --arch x86_64 --verbose
./cpd-cli uninstall --assembly wsl --namespace zen --arch x86_64 --verbose
./cpd-cli uninstall --assembly wml --namespace zen --arch x86_64 --verbose
./cpd-cli uninstall --assembly db2wh --namespace zen --arch x86_64 --verbose
./cpd-cli uninstall --assembly lite --namespace zen --arch x86_64 --verbose

oc delete scc cpd-user-scc
oc delete scc cpd-zensys-scc
oc delete crd cpdinstalls.cpd.ibm.com

oc delete namespace zen
