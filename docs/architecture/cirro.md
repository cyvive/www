title: Cyvive ~ Cirro
description: Lightest piece of Cyvive's essence possible

## Kubernetes Simplified...

<div markdown="1" class="two-column">

Developers, not operations are expected to know and understand most of Kubernetes API's. At the very least detailed knowledge of all the **Pod** interfaces is required.

Developers are premium assets in a company, their time literally translates to profit enablement, so why distract them with part-time administration of something as complex as Kubernetes?

</div>

<div markdown="1" class="two-column">

![zoomify](https://res.infoq.com/articles/kubernetes-effect/en/resources/fig1large-1517591489814.jpg){.center}

</div>

---

What if it were possible to invert the paradigm, allowing Developers to ask for what they need instead of context switching to interface with something more complex than the current MicroService they are delivering.

What if all you needed to deploy your application in production, validating its safe, scalable, all dependencies automatically managed and working was:

```yaml
billingSystem:
  validateCreditCard:
    expect: validateAntiPiracy
    version: v1.2.2
```

This is the power of _Cyvive: Cirro_. 4 lines vs 100+ in vanilla Kubernetes.

## Features

- Immutable Applications
- Standard Kubernetes API Interactions
- Deep GitOps Integration
- Personal isolated deployments of Company / Business Unit / Developer on demand
- Shadow Traffic Compatible. (Why do I want this?)
- Continuous Delivery, focused on fail fast, verify everything
- Customizable Meta Template Environments, Development & Test, Highly Available, Performance, Production
- Versioning of Environment(s), Software Suite, Containers & Components
- Federated Configuration Management of all Applications
- Graphical & CLI interfaces to visualize dependency management, adjust and deploy.
- Deep Dependency discovery & management over 5 deployment layers for rapid deployment. (See it in action)
- Transient, local mounted scratch disks
- Zone & Region aware pod scheduling
- Repacking or Condensing of Running services and provisioned infrastructure every 10 minutes. (6 times per hour)
- †Transparency of data packets sent for Billing purposes
- NameSpace Level Isolation, permitting custom bridging should it be necessary
- †Safe Shadow Traffic Replication (automatic disposal of shadow responses)
- Parallel Control of Kubernetes. Cyvive only interacts with NameSpace(s) it has created, all other's are free to be managed via any alternative legacy approach.

## Automatic Configuration of...

- Pods
- Services
- Stateful Sets
- Load Balancers
- Ingress / Egress
- Supported Services Mesh's
- Configuration
- Secrets
- Horizontal Pod Autoscaling (HPA)
- etc

## Cloud Provider Support

- Google Cloud
- Amazon Web Services
- Bare Metal (Digital Rebar)
- Azure Cloud
- Alibaba Cloud (International)

## Integrations Ecosystem support...

- Envoy Variants
- - Istio
- - Ambassador
- Cluster Network Interface (CNI) Optimized
- - Cilium
- External DNS
- Cloud Native Storage
- - @Single Write: OpenEBS
- - @Multi Write: GlusterFS
- Secrets
- - HashiCorp Vault
- - GitHub: †Zero Trust Secrets

† Marked items were premiered by Cyvive as a Kubernetes Operational Platform
