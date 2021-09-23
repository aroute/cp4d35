UPDATED: September 23, 2021

NOTE: The IBM's Catalog method no longer provides Terraform scripted install of CP4D 3.5. One alternate method is to deploy LITE (control plane) via Watson Studio. Run ./10.. ./11.. and ./12.. scripts first. This will install Control Plane with Studio. Afterwards, you may deploy DB2Warehouse and the other assemblies.

This is a work-in-progress. This repo helps in setting up of ...

1. Cloud Pak for Data CLIs
2. Update CP4D with latest patches
3. Deploy DB2 Warehouse
4. Deploy Watson Studio
5. Deploy Watson Machine Learning
6. Deploy Watson Discovery (coming)

As a prerequisite of using these scripts; you must have deployed CP4D using either the Catalog method from the IBM Cloud, or manually via the command line. This repo is applicable towards CP4D install on ROKS using File/Block storage. It does not cover Sofware Defined Storage (Portworx, OCS, etc).

### Procedure to step through the scripts.

1. Git clone the repo.
2. `cat` (read) each and every file - in sequence - before running; look for comments to understand if you need to provide any additional arguments. Patch documentation is [here](https://www.ibm.com/support/pages/available-patches-ibm-cloud-pak-data#3.5.2).
3. Bring your own `repo.yaml` file with the entitlement key: follow [this](https://www.ibm.com/support/producthub/icpdata/docs/content/SSQNUZ_latest/cpd/install/installation-files.html) official guide to set up your repo.yaml file with your own API key.

Contact aali@us.ibm.com for questions or Slack [@aali](https://ibm.enterprise.slack.com/user/@W54KBUZ34).

primary purpose: automate the enablement
