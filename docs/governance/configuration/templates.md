# Templates YAML

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

!!! info
		- **Scope:** _deploymentTarget_
		- **File:** `*.template.yaml`

## Understanding

… core component of the **Universal MicroServices Language**. This file describes the `template`'s available for _deploymentTarget_ to be created from. Its the highest level of inheritance for governance and configuration when deploying a collection of Micro/NanoServices into a _deploymentTarget_. Specified items are inherited as low priority defaults unless overriden.

_Cyvive_'s configuration language is architecturally and contexturally derived from partnership with 3 Universities and over 35 industry publications for providing a governance via policy meta-model that agnostically interfaces with the most complex orchestration technology while articulately able to be used in conversation.

_This file is a powerhouse behind agnostic infrastructure, and provides the most simple abstraction of deployment available today._

## Template Technology Descriptors

… are logically grouped into four meta-categories, and while the individual `template` can have any name assigned to it, the `template` must belong to a meta-category. Where each meta-catagory is based on the following `operatingEnvironment` logical progression:
**development** ⇛ **high availability development** ⇛ **performance** ⇛ **production**

### Default Template Names
**dev** (type: _development_)
  - single container availability
  - minimum resource allocation
  - probes:
    - ready
**ha** (type: _high availability development_)
  - dual container availability
  - minimum resource allocation
  - probes:
    - ready
**perf** (type: _performance_)
  - dual container availability
  - maximum resource allocation
  - probes:
    - ready
    - health
**prod** (type: _production_)
  - high availability
  - horizonal autoscaling
  - maximum resource allocation
  - probes:
    - ready
    - health

`template` type selection is controlled via the `operatingEnvironment` field. The following states select the `operatingEnvironment`:
- [] @ **dev** (default)
- ['DEVLIKE'] @ **dev** (alterantive for direct specification)
- ['HALIKE'] @ **ha**
- ['PRODLIKE'] @ **prod**
- ['HALIKE', 'PRODLIKE'] @ **perf**

This approach enables any number of copies or versions of _deploymentTarget_ to be deployed or updated with identical or slightly varied configuration. Additionally as the governance process is version aware, multiple versions of the Micro/NanoService can co-exist in the same _deploymentTarget_

**Cyvive.io** provides this default set of Template Technology Descriptors not to enforce direction on organisations but to assist with rapid adoption and integration with existing processes. The default Templates cover all `operatingEnvironment` types that an organization would utilize in developing and promoting an Micro/NanoService through its Continuous Delivery / Deployment lifecycle. While isolating and adding the infrastructure complexities step by step to assist with narrowing debugging focus.

When creating a _deploymentTarget_ **Cyvive.io** will deploy in parallel constrained by priority order all Micro/NanoServices relying on the container orchestration technology to confirm that each Micro/NanoService has started correctly. Should a service fail to start the failure will be reported back, otherwise a sucess response will be recieved.

## Root Structure

```
dev:
ha:
perf:
prod:
mandatory:
(others)
```
As mentioned previously any custom name can be used for a `template` except `mandatory` as its a reserved `operatingEnvironment`: All information populated in this key will be deployed into **all** _deploymentTarget_'s

Should `mandatory` be used, it follows the same structure as **Cyvive.io**'s [Micro/NanoService](./index.md) with the exception of `groups` as the `mandatory` key replaces the `group` key. As such the dedicated `group` configuration is also unavailable for `mandatory`

## Template Technology Descriptor

!!! note
		'⇛' character is used throughout this documentation where items are mandatory with respect to the parent YAML key. If not specified, then item is optional.

```
example:
  environment: {}
⇛ operatingEnvironment: []
  resource: {}
```

### environment

… structural copy of [Micro/NanoService Environment](./index.md#environment)

### operatingEnvironment

```
dev:
⇛ operatingEnvironment:
⇛   []
```

`template` type selection is controlled via the `operatingEnvironment` field. The following states select the `operatingEnvironment`:
- [] @ **dev** (default)
- ['DEVLIKE'] @ **dev** (alterantive for direct specification)
- ['HALIKE'] @ **ha**
- ['PRODLIKE'] @ **prod**
- ['HALIKE', 'PRODLIKE'] @ **perf**

### resource

… structural copy of [Micro/NanoService Resource](./index.md#resource)

