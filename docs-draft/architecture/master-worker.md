# Master Worker

!!! summary
		distributed synchronized control of replicated company technology stacks

## Reasoning

Container orchestration backends, while awesome, tend to lack a unified application synchronization plane. They allow application deployment, and infrastructure interconnectivity in many cases replicating datacenter functionality but for applications to discover and communicate between namespaces life is more challenging.

Within the same namespace, DNS lookups would suffice, but inter-namespace API interaction with the backend is necessary for discovery or a force pushed DNS address of services in other namespaces.

There is also the security and inter-namespace networking rules often applied to consider.

In selecting a model for inter-namespace communication, _Cyvive.io_ only requires top down communication, as events in individual namespaces shouldn't need to communicate upstream.

## Approach

For inter-namespace communication, _Cyvive.io_ went through a series of evolutions, from DNS synchronization to Peer 2 Peer discovery and mesh networking. Ultimately as _ConfigMaps_ and databases were able to be persisted in each namespace, the simplest and most synchronistic implementation was for _Cyvive.io_ to adopt a master / worker model where:

* workers are scoped namespace deployment orchestrators. They watch for changes from their database and deploy as necessary.
* master interacts with the database _ConfigMap_ in each namespace directly, pushing updates to be pulled by the workers on next backend orchestrator sync.
