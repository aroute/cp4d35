# Deploy Cloud Pak for Data 3.5 (CP4D) on IBM Cloud OpenShift (ROKS)

## Log in

1. Git clone this repository
```shell
git clone https://github.com/aroute/cp4d35.git
```

2. Log in to your OpenShift cluster.
```shell
oc login ...
```

## Pre-requisite

1. Increase the persistent storage for registry if not done already. DO NOT use this script for cluster provisioned via Tech Zone.
```shell
./modifyVol.sh
```

2. Activate the registry.
```shell
cd cp4d35/
./registry.sh
```

3. Tune/optimize nodes and set NFS permissions. Get your entitlement key via [Container software library on My IBM](https://myibm.ibm.com/products-services/containerlibrary). Source: [Obtaining the installation files](https://www.ibm.com/docs/en/cloud-paks/cp-data/3.5.0?topic=tasks-obtaining-installation-files).
```shell
export entitlement_key=eyJhbGcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
```shell
sed -i 's/enter_api_key/'"$entitlement_key"'/g' tune.sh
```
```shell
./tune.sh
```

4. Get `cpd-cli` utility.
```shell
./cli.sh
```

5. Ensure entitlement key variable is set properly with your key.
```shell
echo $entitlement_key
```

7. Populate your api key into `repocopy.yaml` file.
```shell
sed -i 's/enter_api_key/'"$entitlement_key"'/g' repocopy.yaml
```

8. Replace `repo.yaml` file.
```shell
rm repo.yaml && mv repocopy.yaml repo.yaml
```

9. Choose and select only one of the two storage classes. If you provisioned OpenShift cluster at Technology Zone with NFS, then select `managed-nfs-storage`; otherwise, select `ibmc-file-gold-gid`. 
```shell
export storageclass=ibmc-file-gold-gid
```
OR
```shell
export storageclass=managed-nfs-storage
```

## Deploy

📌 Note: These scripts will install CP4D in a `zen` project.

### Lite Assembly (control plane)
```shell
./00lite.sh 
```
⏰ 30 minutes.

### DB2 Warehouse
```shell
./01db2wdeploy.sh
```
⏰ 30 minutes.

### Watson Studio
```shell
./02wsldeploy.sh
```
⏰ 1 - 2 hours.

### Watson Machine Learning
```shell
./03wmlwdeploy.sh
```
⏰ 1 - 2 hours.

### EDB Operator
```shell
./04edbdeploy.sh
```
⏰ 30 minutes.

### Watson Discovery

📌 Note: Watson Discovery uses Block Gold storage.

```shell
./05discoverydeploy.sh
```
⏰ 2+ hours.

## Patches/upgrades

At the time of the writing, only two of the assemblies require patches: `modeltrain-classic` and `watson-discovery`. 

First, check for available patches:
```shell
./cpd-cli status --repo ./repo.yaml --namespace zen --patches --available-updates
```
Scroll up and look for available patches in the following section:
```console
  Patch availability check:

    No info on available patches has been found
```
Apply the two available patches.
```shell
./patch_modeltrain.sh
```
```shell
./patch_discovery.sh
```
Re-run and check to ensure patches have been applied.
```shell
./cpd-cli status --repo ./repo.yaml --namespace zen --patches --available-updates
```

## Troubleshooting

**1. The `wd-discovery-ranker-*` keeps failing.**

### Resolution

Resolution provided by IBM support.
```
oc edit deployment/wd-discovery-ranker-monitor-agent
```
1.1. Update the `initialDelaySeconds` value in `LivenessProbe` to `15`

1.2. Update the `initialDelaySeconds` in `ReadinessProbe` to `45`

<br>

**2. How do I check the status of all the assemblies?**

### Resolution

Run the following script to check the status of the control plane, and all the deployed assemblies.
```shell
./statusall.sh
```

## Uninstall

TBA (full uninstall script is not verified)


