# General Operations Concept:
Between the Train components (TDZM, TTFM and TTV) there are practically no differences in how they should be operated, which is why we provide a joint operations Guide & Concept in this document.

Cases where there are specific details for specific components will be clearly marked.

## TDZM Specific Operation actions
There might be the requirement to rollover the DNS Keys in case they are compromised. To do this follow the steps outlined below:

1. Get current zone contents via REST API and store as JSON.
2. Clean/Delete the TDZM Deployment, in particular the Volumes.
3. Create a new TDZM instance (this will generate new keys).
4. Replay zone contents from JSON via REST API from 1.

## Backup:
Any volumes created by the Deployments should be backed up using your preferred way to backup kubernetes volumes. Configurations are provided fully through Configmaps and can also be backed up by your preferred backup solution.

The TTFM should store the Trustlists and accompanying VCs in a configured IPFS store. You should ensure this IPFS store is backed up properly.

Volumes that should be backed up:
- TDZM volume that contains the zonedb

## Logs
All components log to standard output. You should use your preferred log handling configuration/solution for the runtime environment you are using, e.g.: Kubernetes, Podman or Openshift.

Logs should be kept for some time to allow for tracing of errors, as well as auditing which actions were submitted by whom.

## Monitoring
All components provide an OpenTelemetry endpoint that gives you health information. Check the Usage/API guides for each component for secific REST Route information.

Monitoring of Metrics such as cpu, ram, disk usage should be handled by the container orchestrator or other external solutions.

## Upgrade & Patching
To upgrade/patch a running release without downtime, there should be a basic switchover strategy used. This is achieved through the following steps:

1. Start the patched/upgraded version of your service
2. Verify the patched/upgraded version is running
3. Switch traffic to the patched/upgraded version
4. Switch off the old version

**Difference for TDZM**

To upgrade the TDZM you can follow the same strategy, but you must make sure a backup of the zonedb volume is created first. You must also make sure that no "write" requests will be sent by the TFM to the TDZM component, as this could lead to inconsistencies between zonedb and DNS files.

Essentially during an upgrade the TDZM should be considered as "Read only" until the upgrade is complete.