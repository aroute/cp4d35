#!/bin/bash
oc patch cj usermgmt-ldap-sync-cron-job --patch '{"spec": {"suspend": false}}'
./cpd-cli status --namespace zen --assembly lite --patches
