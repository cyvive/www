title: Cyvive ~ Immutable Operational Platform
description: Understanding Cyvive's Immutable Operational Platform

## In Relation to Cloud Native

[Cloud Native Computing Foundaton (CNCF)](https://www.cncf.io/) graduated two significant projects that have disrupted the Information Technology industry at a scarcely precedented scale. **Kubernetes** and **ContainerD**. It is no co-incidence that **Cyvive** is an enabler for both technologies.

- **Kubernetes** has been utilized and supported by Cyvive since September 2016 (Kubernetes 1.6.x)
- **ContainerD** literally provides the operating system Cyvive has utilized since shortly after Google Kubernetes Engine was released, making us one of the early adopters of the technology. 

## Enterprise Acceleration

**Speed, Scale, Margin**; is the core mantra of most (if not all) Enterprise today. In fact, such is the drive for these three key factors, that the restraint on progress is no longer human related, but reaction related. A clear example in point is, churn rate for unorchestrated containers is roughly once every **6 days**, wherease orchestrated containers are **2x a day**, or 12 times faster. If your infrastructure is capable of operating at scale and speed, development will rise to meet the restraints.

### Security

With the advent of *DevSecOps* there is sane reason why Security is not defacto included with *Speed, Scale, Margin*. For **Cyvive**, security is so critical that every part of its operation puts security first. Notable functionality being:

- †Immutability: Every deployed node is Immutable. From the Control plane, through to storage nodes. If a breach did occur, the node can be terminated without adverse affects to the workload.
- Container Certification: Containers are by default blacklisted from deployment into Kubernetes, unless they pass required security rules such as *No CVE's present that a patch is available for* 
- †Deploys into existing Enterprise Setup Cloud Network
- †Cloud Provisioning continually reviewed and developed in conjunction with Cloud Certified Engineers
- †TTY and SSH disabled by default on *all* Nodes. Immutable nodes have no need of terminal interactions
- †Transparency of data packets sent for Billing purposes
- †No Vendor Access to Cloud. Your Cloud contains sensitive business data, as a Vendor we shouldn't have access to it, even in debugging and assistance situations, our only access is via screenshare.
- †Isolation of System and Kubernetes schedulled workloads. There is no physical method available within the Node for Kubernetes workloads to interact with System Container processes as ContainerD provides solid namespace separation
- †ETCD access disabled. Control plane is and should be the only allowed mechanism to access Kubernetes core database
- †Workload Isolation & Security Advantages of Virtual Machines (VM) for Containers
- †Zero Trust Secrets. 
- †Upgrade Flexibility. Just because **Cyvive** releases an upgrade, it shouldn't necessitate the upgrade of a working cluster. Enterprise has the choice of which upgrades they want to apply and when

† Marked items were premiered by Cyvive as a Kubernetes Operational Platform

**Networking Security**

- Ingress & Egress
- NameSpace Level Isolation, permitting custom bridging should it be necessary
- Multi-Cluster Policy Enforecment (or Multi-Cloud Provider as **Cyvive** is cloud agnostic)
- †Safe Shadow Traffic Replication (automatic disposal of shadow responses)
- Transparent Encryption between Nodes
- Tagging and tracing of routed packets
- Availability Zone and DataCentre aware networking

† Marked items were premiered by Cyvive as a Kubernetes Operational Platform

### Scale

**Cyvive** is designed to operate at datacenter scale. Its not unusual for some clients to run 2,500+ nodes at 500 containers per node. In Hybrid, Bare Metal or Cloud environments. 

When it comes to replacing a DataCenter, the following are important for enablement:

- †Choice of upgrade paths. Availability Zone blackout or Per Instance Type
- †CPU Architecture options. AMD64 or AARM64 are both supported
- Persistent Storage available within the Cluster. ZFS management, and replication functionality baked-in
- †Control Plane AutoRecovery and Healing.
- †Control Plane resizing based on node demand.
- Multi-Cloud or Agnostic implementation.
- Capable of Policy Enforcement *without* Mesh Network, spanning multiple clusters. 
- †ETCD Persistence, Recovery and Snapshotting

† Marked items were premiered by Cyvive as a Kubernetes Operational Platform

### Margin

Cloud Providers are in fierce competition with eachother, and the balance of power has never been so in favour of the customer. Specifically, the utilization of *Spot* or *Premptive* instances allows a per-hour billing and cost optimization previously untapped. Provided you can migrate the bulk of your Information Technology infrastrcture every hour. With **Cyvive**, you can, and that's not all:

**Cyvive** is the premier continual Kubernetes optimization platform within the following specifications:

- Repacking or Condensing of Running services and provisioned infrastructure every 10 minutes. (6 times per hour)
- †Deep understanding of accessible verses system reserved infrastructure resource allocation
- †Continual progression with all major cloud providers optimizing Cloud Provisioning against billing functions and reduced spending.
- Network throughput measured at twice that of standard loopback
- †Kubernetes Control Plane Resizing
- ETCD Stacked on the Control Plane, no additional dedicated ETCD instances are required.

† Marked items were premiered by Cyvive as a Kubernetes Operational Platform

### Speed

To gain a full understanding of the Speed benefits **Cyvive** offers, visit the [Governance](../governance/index.md) area.

