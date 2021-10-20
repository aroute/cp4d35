#!/bin/bash

./cpd-cli --namespace zen --assembly watson-discovery --verbose
./cpd-cli --namespace zen --assembly edb-operator --verbose
./cpd-cli --namespace zen --assembly wsl --verbose
./cpd-cli --namespace zen --assembly wml --verbose
./cpd-cli --namespace zen --assembly db2wh --verbose
./cpd-cli --namespace zen --assembly lite --verbose

oc delete scc cpd-user-scc
oc delete scc cpd-zensys-scc
oc delete crd cpdinstalls.cpd.ibm.com

oc delete namespace zen
