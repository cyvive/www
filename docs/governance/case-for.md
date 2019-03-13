title: Cyvive ~ The Case For Governance
description: The Case For Governance

## Global Scene Today

Applications have been transitioning from a Monolithic approach to Service Oriented for a number of years, and while different languages offered alternate approaches and standards such as [12Factor](https://12factor.net/) and [OSIMMv2](http://www.opengroup.org/soa/source-book/osimmv2/) started to emerge as to best practices for managing MicroService and Service Oriented applications (SOA). 

The disruption of containerization and more specifically Docker resulted in a mass exodus from more traditional architectural approaches towards **Cloud Native** Architecture.

After the advent of Docker it became rapidly apparent that MicroService centric technology and stateful workloads had challenges in organizational implementation. Specifically around the areas of scheduling and persistent storage. To further complicate the scene developers were expected to understand how linux operating systems work from a process 1 layer and become specialists in system administration and orchestration of Highly Available applications overnight.

What typically resulted (and still does) is a multitude of containers running MicroServices assembled in various pet environment and machines. In need of traditional infrastructure architecture and external services such as Layer 4/7 LoadBalancers to and Cloud Interfaces to ensure the MicroServices run acceptably.

To achieve this the concept of Container Orchestration was created where the landscape rapidly consolidated into a single orchestrator and cloud provider. **Kubernetes** carrying the additional advantage of being cable of abstracting the underlying infrastructure cloud services and provisioning away from the MicroService interactions and scope.

As of today, Kubernetes has 400+ API endpoints, with 50+ core. It rolls out breaking releases every quarter and aggressively removes depreciated API endpoints to keep its complexity lighter. Its an excellent and highly resilient technology, but requires organizations to keep up with its release cycle to ensure a happy path for all co-existent tooling. Cloud Native Computing Foundation has been created to assist in ensuring key extensions / installers and components of Kubernetes stay current and functioning.

Kubernetes also abstracts the concept of physical environments into a logical layer. An excellent approach to creating multiple test or production environments on demand, with default settings that can also be isolated at via network from eachother.

## The Challenge

Ideally MicroServices should be able to be deployed independently of eachother, live separate life cycles and handle dependencies sanely. In reality there are always dependencies, even if the primary dependency is on a stateful storage interface or broker if following the [MicroService Saga](https://microservices.io/patterns/data/saga.html) pattern. 

Additional complexity is also realised that MicroServices in Enterprise Environments provide more of a Cloud Friendly / Native approach but still follow similar pricinciples of TOGAF / OSIMMv2.

OSIMMv2         ->  MicroServices:

- Service       ->  Suite of MicroServices
- Component     ->  MicroService
- Sub-Component ->  Function

Decomposition typically falls to Business Units which in turn typically offer a collection of Services (Suites of MicroServices) for consumption by customers or other Business Units within the same company. 

Ironically, 50 MicroServices are often the tipping point for unmanagable complexity. 50 MicroServices can have a maximum of 1225 interactions, versions, and dependencies between eachother. It is also a realistic expectation that at least one of the Open Source libraries used in each MicroService will need to be updated, tested and validated as production safe every couple of days. Potentially 700 redeploys a month.

To further complicate the process and management of MicroServices the industry expectation is that the MicroService should understand its own limits and requirements for appropriate scheduling and scaling out when under load. Thus each MicroService should be performance tested with each release. Immediately causing the need for versioning of MicroService configuration, and the ability to progressively manage the configuration in environments that the MicroService has or will be deployed in.

In a nutshell the challenges plaguing MicroServices are:

- versioned configuration management
- versioned secrets management
- dependencies on other MicroServices
- Infrastructure requirements and resourcing

## Governance Re-surfacing

In traditional Application Lifecycle pre-revolution the infrastructure requirements would have been handled by a Governance layer, describing exactly what Infrastructure, configuration, performance and resources the application would have needed.

In the container world, the closest functional alternative has been Docker Compose, quickly failing to be effective when operating on multiple machines or preserving environment secrets for application consumption.

[Rancher](https://rancher.com/), following in the footsteps of [Panamax](https://github.com/CenturyLinkLabs/panamax-ui) also tried to provide a light weight governance and dependency management approach through a service catalogue, but this is only useful for initial deployments of applications into environments and forces a hard externally managed blue / green deployment approach which is not enterprise friendly or startup safe.

The issue most approaches share is they come from the infrastructure and orchestration approach, which ultimately makes sense as infrastructure is what the orchestration is providing the MicroService.
Unfortunately becoming a part-time system admin is not what most developers aspire to, and they quickly find the orchestrator over-complex for their needs while in reality *it may not be complex enough.*

Fortunately, **Cyvive** worked with 3 Universities, and over 35 industry publications to analyse trends and approaches to modelling, scaling, interacting and managing MicroService deployents at diabolical scale. The result is the core configuration language of **Cyvive**, a direct extension of natural descriptive language used in companies today. This **Universal MicroService Language** allows abstraction of the complexity of orchestration, management and infrastructure away from DevSecOps, while opening up communication between business, encompasing current and future development.

As such, a Suite of MicroServices; MicroService; or Function can all share the same descriptive language, and that meta-language can consistently hold through each advancement of containerization or orchestration irrespective of the underlying complexity of interface.

This ironically, is Governance revised and re-applied in a methodology that integrates with existing systems of communication and development cycles.

## Alternative non-Governed Kubernetes Approaches

Fundamentally fall into the following categories:

### Template Driven

The approach used by this collection is to focus on desired end-state while stripping out the technical implementation detail. They use template languages such as TOML, GOTemplate, Jinja2 and others to achieve this.

The most well known of all these is Helm which ironically labels and describes itself as a package manager built on templates. It extends the Kubernetes API and requires additional security settings to be enabled in the cluster to operate safely and effectively.

The major challenge with this approach is that its strength lies in user submitted packages being crafted correctly with enough configuration options to be relevant. So while it appears to save time for initial deployment of some MicroServices most organizations end up re-writing large portions of existing templates or maintaining their own with an abstraction layer. Additionally its not upgrade safe, as the Kubernetes endpoints regularly migrate and configuration will need to be actively maintained and assessed for all applications every quarter.
Additionally, exact versioning matching against the MicroService can be challenging as the template approach works best with a central repository / server with configuration outside the MicroService repository
The irony of the template approach is that while it appears to be simpler, it actually requires a deeper understanding of the orchestration technology than most developers would need in their day to day work as all moving template parts are necessary to be learnt in depth.

Typically this approach is used when a central team owns and maintains all templates along with the orchestration platform (Kubernetes) Some template approaches go as far as defining an entire programming language to build upon.

### CI/CD extensions

A common emerging pattern is to extend the CI/CD tool with the bare minimum information to achieve a successful Kubernetes deployment. Then when the version deployed is changed by the CI/CD process the existing deployment is rolled forward / patched.

While in principle this approach seems an easy win, it suffers from many of the same challenges as the Template Approach in that the deployment templates become outdated and need to be reviewed every quarter. It requires specialist knowledge and often heavy repetition between MicroServices in detailing their configuration which is prone to mistakes, and there is no standardization between MicroServices in naming of configuration. Additionally secrets and configuration become challenging when wanting to abstract away from or share between MicroServices at a business unit level.

### Developer Assistance

A continually shifting landscape of tools, some offer benefit for a variable period of time, but most are created to scratch their own itch in a sense. The trend in this space is to remove the CI/CD pipeline entirely by building the container on the local machine, and abstract a development environment directly against the local Docker Daemon typically based on Docker Compose. Lots of innovation, but nothing that accelerates development in a solid way that's well maintained and sustainable for multiple languages.

These also bleed into baseline libraries for MicroService development where they can force developer to implement Cloud Native approaches in their MicroServices such as sharding and synchronization locks. The main benefit is that interaction with the orchestration tooling can happen from the same language as the developer is working in, but as the cost of integration and visibility of more complex Services. i.e. works well in isolation

### Alternative Non-Kubernetes Approaches

Are focused on extending infrastructure tools such as CHEF and PUPPET to interface nostalgically with an orchestration technology.
While these tools are excellent for those with a deep infrastructure background, they have never historically been picked up well by developers who when forced down this route prefer to use the orchestration technology directly over the infrastructure tooling.

