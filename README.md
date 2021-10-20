
1. Git clone this repository
```shell
git clone https://github.com/aroute/cp4d35.git
```

2. Log in to your OpenShift cluster.
```shell
oc login ...
```

3. Increase the persistent storage for registry, if not done already.

4. Activate the registry.
```shell
cd cp4d35/
./registry.sh
```

5. Tune/optimize nodes 
```shell
oc create -f setkernelparams.yaml
```

6. Enable NFS file permission by running.
```shell
oc create -f norootsquash.yaml
```

7. Get `cpd-cli` utility.
```shell
./01cli.sh
```

8. Update the default repo.yaml file by inserting your entitlement key. The key is available via [Container software library on My IBM](https://myibm.ibm.com/products-services/containerlibrary). Source: [Obtaining the installation files](https://www.ibm.com/docs/en/cloud-paks/cp-data/3.5.0?topic=tasks-obtaining-installation-files).

8.1. Create a variable for your entitlement key.
```shell
export entitlement_key=eyJhbGcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

8.2. Populate your api key into `repocopy.yaml` file.
```shell
sed -i 's/enter_api_key/'"$entitlement_key"'/g' repocopy.yaml
```

8.3. Replace `repo.yaml` file.
```shell
rm repo.yaml && mv repocopy.yaml repo.yaml
```

UPDATED: September 23, 2021

NOTE: The IBM's Catalog method no longer provides Terraform scripted install of CP4D 3.5. 

This is a work-in-progress. This repo helps in setting up of ...

1. Cloud Pak for Data CLIs
2. Deploy DB2 Warehouse
3. Deploy Watson Studio
4. Deploy Watson Machine Learning
5. Deploy Watson Discovery

This repo is applicable towards CP4D install on ROKS using File/Block storage. It does not cover Sofware Defined Storage (Portworx, OCS, etc).

Patch documentation is [here](https://www.ibm.com/support/pages/available-patches-ibm-cloud-pak-data#3.5.2).

Contact aali@us.ibm.com for questions or Slack [@aali](https://ibm.enterprise.slack.com/user/@W54KBUZ34).

primary purpose: automate the enablement
