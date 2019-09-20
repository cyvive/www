title: Cyvive ~ Architecture
description: Application in daily life

## Architecture: Overview

Foundationally while Cyvive is built on the [_Language of the Fog_](http://www.foggyubiquity.com/language) it has been tailored to be Enterprise Grade in terms of security & stability. While maintaining sufficient iterative adoption for startups to use in production within 24 hours.

## Security

### Cirro

Cyvive has two entry and interaction points:
- binary available on [GitHub: Cyvive](https://github.com/cyvive/cyvive/releases)
- GUI / Dashboard.

Both are architected in accordance with [OWASP](https://www.owasp.org/)

In recognizing that Cyvive is powering / enabling low level critical infrastructure with sensitive workloads, we are transparent about what we collect & transmit back to our servers. The structure of the transmitted data is always available at the following [permalink](TODO).

Additionally, Cyvive follows a one way communication model. Connections are only outgoing, all data is encrypted using [Eran Hammer's IRON Cryptographic Seals](https://www.npmjs.com/package/@hapi/iron) with synchronized rotating certificates.

Finally, as there is no inbound interaction with clusters running Cyvive, there is no possibly or external interaction or manipulation with clusters running Cyvive. Should support be requested, it is provided via your choice of two-way screen-sharing tools.

### Culumo, Strato, Nimbo

As [HashiCorp's Terraform](https://www.terraform.io/) is used to orchestrate the cloud provider(s) of your choice. There is a requirement to store additional data.

You will already be aware that the `terraform.tfstate` files contain critical update & uninstallation information that if lost or corrupted would be detrimental to ongoing cluster operations. As such to support your choice of multiple cloud providers Cyvive retains a copy of the `terraform.tfstate` file secured via client side encryption and one hour authorization session tokens for transmission & updates.

Additionally, as these tiers provide images for deployment on your infrastructure. The following are applied to each assembled image:

- Isolation of System processes vs Application (Kubernetes) processes
- Security relevant `alpha` & `beta` Kubernetes flags enabled by default
- Immutable Disk Images
- Read Only Operating System. No part of the image is read/write compatible. A separate disk must be mounted as an operational scratch disk.
- Scratch Disk & RAM Shredding pre-shutdown. (Best effort - not all cloud providers offer support)
- Unlimited Mounted Storage Disks (Not Shredded on Shutdown)
- Autonomic NameSpace Isolation. Cross-NameSpace communication disabled by default.
- Per-NameSpace Ingress with Automatic TLS certificates.
- Transparent Layer 3 encryption between nodes via IPSec
- Network Policy & IPv6 Security enforced via BPF (Linux Kernel)
- SSH & TTL actively removed from all Images. (Immutable Machine Images)
- Container Certification pre-deployment into Kubernetes
- Meshed / Cross Cluster (Federated) VPN & IPSec tunnels between clusters
- Process Level Network Routing, preventing sidecar injection attacks as is possible with Envoy.
- External ETCD access disabled, entire backup / restore / scale process implemented via Control Plane itself
- Machine Images can be extended & stored in Clients Object Storage directly (Optional Upgrade)

## Stability

> The single largest destabilizer of Kubernetes clusters is the upgrade process.

### Cirro

Cyvive validates directly against Kubernetes OpenAPI specification. Every interaction has been checked and validated meticulously and follows the official mapped upgrade path for all Kubernetes API endpoints.

Additionally, Cyvive is architected in compliance with Cloud Native Computing Foundation Architecture. Its own & plugin interactions are event driven via Redis configured for data persistence redundantly replicated across all three control plane nodes. Regular encrypted backups are stored in the cloud providers block store as an extra layer of redundancy.

Interactions with Kubernetes API are also automatically rate-limited based on cluster size, to prevent de-stabilization of ETCD or API timeouts for Kubernetes.

### Culumo, Strato, Nimbo

As isolation is implemented between System & Kubernetes processes, an exact understanding of System operation requirements are possible. Or in Whiskey making terms the _angel offering_ is known. There's no cross-talk or overallocation of Applications into the reserved System space, ensuring stronger stability of scheduling than is available in most distributions.

Automatic two way resizing of Control Plane without downtime. Not only does this reduce operational bills, but ensures continual data integrity scanning of ETCD and a more robust control plane controlled backup / restore process than is possible with standard Kubernetes distributions.

Stacked ETCD directly on Control Plane

Single Machine Image used for Control Plane / Worker Nodes / Storage Nodes, ensures smaller footprint and simpler upgrade process.

Machine images implement a distributed peer-2-peer replication system for all containers reducing demand on Container Registry (critical if self-hosting / bare metal)

Optional Minor Upgrades. Cyvive understands that most Corporations will struggle to maintain pace with Kubernetes & the extended EcoSystem releases on a regular timeline. As such Cyvive was architectually designed to respect upgrade choices. Each Cyvive upgrade contains detailed release nodes respecting changes to Cyvive itself, Kubernetes & the implemented EcoSystem. The only *mandatory* upgrade is latest and first release between Kubernetes minor versions. As these are always one way upgrades due to Kubernetes API migrations. However, _when_ these upgrades are applied is entirely your choice.

## High-Level Architecture Diagram

