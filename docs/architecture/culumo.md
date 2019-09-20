title: Cyvive ~ Culumo
description: Data Centre Grade Immutable Kubernetes

## Data Centre Operational Platform for Kubernetes...

The primary benefit of Kubernetes adoption is commencement of a cloud agnostic journey. Yet the vast majority of Kubernetes distributions focus on the needs of small business. Or expect an operational team to be available for continual maintenance.

The industry standard for Enterprise grade Kubernetes cluster management is 3 dedicated people per cluster. What if this could be reduced to 1 per cloud provider?

What if Kubernetes could mostly be managed autonomously, and still align with the Enterprise release cycle and Service Level Agreements (SLA) or commitments?

**Cyvive: Culumo** is designed to operate at datacenter scale. Its not unusual for some clients to run 2,500+ nodes at 500 containers per node. In Hybrid, Bare Metal or Cloud environments.

Only an Operational Platform (**Cyvive**) can provide such a solution.

## Features

- †Immutability: Every deployed node is Immutable. From the Control plane, through to storage nodes. If a breach did occur, the node can be terminated without adverse affects to the workload.
- †Deploys into existing Enterprise Setup Cloud Network
- †Cloud Provisioning continually reviewed and developed in conjunction with Cloud Certified Engineers
- †No Vendor Access to Cloud. Your Cloud contains sensitive business data, as a Vendor we shouldn't have access to it, even in debugging and assistance situations, our only access is via screenshare.
- †Isolation of System and Kubernetes scheduled workloads. There is no physical method available within the Node for Kubernetes workloads to interact with System Container processes as ContainerD provides solid namespace separation
- †ETCD access disabled. Control plane is and should be the only allowed mechanism to access Kubernetes core database
- †Workload Isolation & Security Advantages of Virtual Machines (VM) for Containers
- †Upgrade Flexibility. Just because **Cyvive** releases an upgrade, it shouldn't necessitate the upgrade of a working cluster. Enterprise has the choice of which upgrades they want to apply and when
- Authentication, OpenID Connect Identity (OIDC) / OAuth2.0 / LDAP


When it comes to replacing a DataCenter, the following are important for enablement:

- †Choice of upgrade paths. Availability Zone blackout or Per Instance Type
- †CPU Architecture options. AMD64 or AARM64 are both supported
- Persistent Storage available within the Cluster. ZFS management, and replication functionality baked-in
- †Control Plane AutoRecovery and Healing.
- †Control Plane resizing based on node demand.
- NameSpace Level Isolation, permitting custom bridging should it be necessary
- Transparent Encryption between Nodes
- Capable of Policy Enforcement *without* Mesh Network, spanning multiple clusters.
- †ETCD Persistence, Recovery and Snapshotting
- †Deep understanding of accessible verses system reserved infrastructure resource allocation
- †Kubernetes Control Plane Resizing
- ETCD Stacked on the Control Plane, no additional dedicated ETCD instances are required.
- †Continual progression with all major cloud providers optimizing Cloud Provisioning against billing functions and reduced spending.
- Container Certification: Containers are by default blacklisted from deployment into Kubernetes, unless they pass required security rules such as *No CVE's present that a patch is available for*

† Marked items were premiered by Cyvive as a Kubernetes Operational Platform


