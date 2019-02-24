title: Cyvive
description: Cloud Agnostic Operation & Governance Platform

## 60 Second Overview
<video width="100%" controls muted autoplay>
   <source src="https://res.cloudinary.com/tayloredtechnology/video/upload/v1535790141/cyvive.io/video/teaser.mp4" type="video/mp4; codecs=hevc">
   <source src="https://res.cloudinary.com/tayloredtechnology/video/upload/v1535790141/cyvive.io/video/teaser.mp4" type="video/webm; codecs=vp9">
   <source src="https://res.cloudinary.com/tayloredtechnology/video/upload/v1535790141/cyvive.io/video/teaser.mp4" type="video/mp4">
</video>

## Why?

The modern Information Technology Development Approach is based on **Speed, Scale & Margin**. As a result organizations of all sizes are embracing the **Cloud Native** approach to designing, building and running applications based on Infrastructure-as-a-Service (IaaS) in combination with operational tools and services such as Continous Integration (CI), Continous Deployment (CD), Containers, and Orchestrators. 

To execute **Cloud Native** five layers are required:

1. Infrastructure (Bare Metal / Cloud)
2. Provisioning
3. Runtme
4. Orchestration & Management
5. Application Definition / Development

This simplistic layering opens a world of choices, when combined with the reality that some tools in one layer work better with specific tools than others, a complex exponential selection process is established.

There is a strong market need for simplicity, sanity and control of the n+1 choices available when using **Cloud Native** architecture.


## What?

Cyvive provides **Immutable Change**, from the instrastructure through to moment in time understanding of deployed applications. Everything is Immutable. This means your business, or parts of it can be reproduced, moved or upgraded safely. This **Immutable Change** is provided through two key approaches:

### Operational Platform

Infrastructure-as-a-Service, expects the cloud service provider to deliver infrastructure components that would otherwise exist in an on-premises data center. These components could consist of servers, storage and networking as well as the virtualization layer, which the IaaS provider hosts in its own data center. While they may also provide Platform-as-a-Service (PaaS) offerings such as cloud functions, container execution api's, or even Kubernetes variations. By design, they are not turn-key offerings.

**Cyvive**, however, is. As an operational platform, it directly interfaces with the cloud provider (or Bare Metal) of choice using the provides IaaS interactions to provision an immutable collection of components necessary to run the orchestrator of choice. The default being Kubernetes

### EcoSystem

**Cloud Native** requires a collection of tools, or an extended ecosystem of services to understand and, unlock and leverage its full potential. Each tool, when selected by companies typically goes through a process, that takes months for an efficient team with multitudes of Proof of Concepts, each potentially causing *back to the drawing board moments*. The modern company doesn't have the luxury of time to assess, stabilize and incrementally add each component of the **Cloud Native** ecosystem while guaranteeing stability amongst change management in their Digital Transformation journey.

**Cyvive** takes the best in breed tool for each part of the EcoSystem and manages its lifecycle. Choices are available between Open Source or Propriatory where possible. Such careful selection and management of the Best in Breed Candidates of the EcoSystem unlocks the power of the Orchestrator to perform often significantly beyond its standard capabilities

### Governance

MicroServices are a suite of applications providing a specific function. They are also a key part of **Cloud Native** architecture, and while there are many benefits to adopting this model over alternatives such as OSIMM / TOSCA. Orchestration & Management alone is insufficient and inefficient to managing complex deployments as each has independent release cycles.

The defacto approach to MicroServices is to run them within a container, in most situations, even the _functions / serverless_ approach ultimately runs within a container. As such to actually execute the code, open source and propriatory libraries (which are regularly updated) are aggregated into the container, where to comply with security and zero day vulnerability patching must be updated regularly.

Ironically, 50 MicroServices are often the tipping point for unmanagable complexity. 50 MicroServices can have a maximum of 1225 interactions, versions, and dependencies between eachother. It is also a realistic expectation that at least one of the Open Source libraries used in each MicroService will need to be updated, tested and validated as production safe. Once every couple of days, or potentially 700 redeploys a month.

While the Continous Integration System may validate the code is safe, by nature MicroServices require Continous Deployment / Promotion through environmental complexity to _proove_ they are production stable. 

MicroServices also have their own independent dependency graph, so actual deployments may not be as simple as replacing a single service in isolation each time.

**Cyvive**, as the Premier MicroService Governance solution, streamlines all complexities through dynamic dependency graphs, an industry standard configuration & communication syntax, release management, configuration and version management for MicroServices through to Infrastructure. 

Any part of your infrastructure can be deployed on-demand, with all relevant dependent services, in any environment.

### Cloud Agnostic

It is no longer a realistic expectation that companies can enhance their technology stack by partnering with a single cloud provider. With the growing multitude of high quality cloud providers, each offering niche tools a multi-cloud strategy is a necessity.

**Cyvive**'s detailed Governance and Operational Capabilities allow rapid movement of workloads between cloud providers at an unprecidented scale. It is now a realistic expectation that every hour your entire company can be migrated between clouds based on lowest instance pricing. Without disruption of service.


## How?

We worked with 3 Universities, and over 35 industry publications to analyse trends and approaches to modelling, scaling, interacting and managing MicroService deployents at diabolical scale. The result is the core configuration language of **Cyvive**, a direct extension of natural descriptive language used in companies today.

We also cross partnered to understand and explore each part of the **Cloud Native** EcoSystem to architect and craft a well-balanced blend of services capable of supporting over 2,500 nodes with 500 containers each. (Yes, Cyvive has been applied to managing over 1 million containers) 

We pushed _immutability_ down to the operating system, every machine self registers, and is managed exclusively by **Cyvive**. There is no human access available to the actual machine. Making **Cyvive** inaccessible to human error.

While **Cyvive** is orchestrator independent, it has been actively used with Kubernetes since version 1.6.x (March 2017)

Finally, we selected Terraform for cloud provider & bare metal interactions. Properly tuned, full _immutable_ lifecyle management was possible while leveraging all the important functionalities of major cloud providers.

## Where?

- All Major Public Clouds
- AMD64 / ARM64 Chipsets
- Bare Metal (**Cyvive** creates its own cloud on metal)

**Cyvive**: The Premier Cloud Agnostic Operation & Governance Platform
