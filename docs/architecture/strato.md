title: Cyvive ~ Strato
description: Within Cloud Provider Multi-Cluster Transparency

## Transparency bridge & manage multiple clusters in the same data-centre...

A nominal Kubernetes deployment pattern involves running separate _Production_ and _Everything Else_ clusters. This is a perfectly fine approach to deployment and management. However this model naturally implies that each cluster would also have appropriately zoned and named `NameSpace(s)` in alignment with the usual categories of Development & Test, Highly Available, and Performance.

Sometimes Companies need more. They for legal, regulatory or internal reasons require data categorization to also be applied to their infrastructure. An immature approach is to leverage the NameSpace isolation functionality of Kubernetes or enforce a Service Mesh. But these approaches only progress so far and often fail the required checklists.

**Cyvive: Strato** in its ability to bridge, mesh and transparently link clusters & their management together resolves this issue _within the same cloud provider_

## Features

- Multi-Cluster Network Policy's
- Region & Zone Aware Cluster Bridging
- Restriction of Workloads to Specific Clusters
- Transparent (Level 3) Encryption between clusters
