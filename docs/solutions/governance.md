title: Cyvive ~ Change Governance
description: Understanding Cyvive's Change Governance

## In Relation to Cloud Native

[Cloud Native Computing Foundaton (CNCF)](https://www.cncf.io/)'s *Orchestration & Management* and *Application Definition or Development* layers are places Kubernetes excells, but Kubernetes itself has over 50 core API's and 400+ extended API's cleverly abstracted away via Yet Another Markup Language (YAML) configuration files. For those who have used Kubernetes since the early days, there is an ingrained industry expectation that Minor revisions may contain breaking changes requiring YAML files to be updated. Especially as Beta interfaces transition to Stable. The development speed of Kubernetes ultimately means that each quarterly release requires an audit and management process of YAML files for all Kubernetes API's currently in use by the Enterprise.

Such an Audit, is not a small process and often items that *should* be upgraded are delayed until next release when the old endpoints depreciate and previously working YAML files break.

## Why Governance?

For a detailed understanding of why Governance (service composition) re-surfaced in MicroService architecture see the companion page [The Case For Governance](./case-for.md)

**Cyvive** has, since Kubernetes 1.6.x (September 2016) offered the premier Governance Solution. In March 2017 this **Universal MicroServices Language** was created via partnership with 3 Universities, and over 35 industry publications. It is the most comprehensive and universalized approach to Governance offered to date.

For the first time, developers can stop trying to describe what operations needs from them and align with the core business approaches of:

- ask for what you need
- show what your provide

### MicroService Composition

As MicroServices exist in Suites, its a frequent scenario that multiple MicroServices need to be updated in parallel, ensuring correct composition and assessing the total impact of services using existing API's can be a daunting task.

**Cyvive** uses a Machine Learning technique of Prioritized / Force Directed Graphs to identify and assess dependencies between deployed MicroServices. When combined with the Emerging GitOps standard to Continous Integraton, creating a new branch creates a new development namespace with all essential MicroServices deployed. Development now happens directly against real copies of production MicroServices, and multiple can be worked on simultaneously as part of the same GitOps Branch.

Additionally, as **Cyvive** determines the order of prioritization, MicroServices are now able to be deployed rapidly layer by layer ensuring dependent services are available before the next service is deployed.

### Configuration & Secrets Versioning

While 12Factor specifies that application configuration should be entirely through Environmental Variables, their population must be managed. In an Agnostic Cloud view, the safest place for configuration management is in Git as part of the emerging GitOps approach.

**Cyvive** builds on this approach, by utilizing Zero Trust Secrets, and tiers of Configuration Management. Whenever a change happens to the original Git repository, Cyvive versions the new configuration and manages its promotion through the cluster, incrementally rolling it out until prooven that the new configuration is safe for production consumption.

### Environment Management

Every Enterprise has several environment types. With the benefit of Kubernetes the prior physical environments are now logical via NameSpaces. But environmental permutations are also simpler increasing risk that environments may drift from their desired configuration.

**Cyvive** has four Core **Operating Environment** Technology Descriptors: 

- development
- high availability
- performance
- production

Any number of NameSpaces can be populated from these core descriptors, each maintaning independent versioning and state of currently deployed applications additionally respecting MicroService Composition, configuration and secret versions.

Additionally configuration follows a prioritization based approach where configuration can be overriden and inherited as required:

1. Environment
2. Suite / Group
3. MicroService
4. Function

### Production Stability

This **Universal MicroService Language** enables an unprecidented portability and co-ordination between Kubernetes clusters and workloads. It also, by default enables **Continous Deployment / Promotion** where each container is now a *production candidate* pushed through more complex environments until proven safe to run in production.

**Cyvive** utilises *Shadow Traffic Replication* between the Production and Performance (names able to be changed to match internal standards) environments as the final validation of application stability.

Additionally, this flexibility allows **Cyvive** to be Cloud Agnostic, in that *Premptive Instances* can be effectively used for scaling workloads and indeed the entire company's infrastructure can be migrated to whichever public cloud provides the best price for the current hour of *Premptive Instance* lease.

When an architecture is introduced, its necessary for **governance** to also co-habitiate to ensure that the software solutions within an organization adhere to the defined policies, guidelines, and standards that are defined as a function of the objectives, strategies, and regulations applied in the organization.

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.
