# QuickStart: Usage for Govenors

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

## Governance Overview

_Cyvive.io_ is a [Layer 4 - 7 OSIMM Compliant](http://www.opengroup.org/soa/source-book/osimmv2/p2.htm) and as such implements a _Governance via Policy_ approach through YAML configuration files created per application / service / component.

The language used in configuration description is not arbritary, and is the culmination of 35 respected academic and industry studies with _containerization_ viewpoint spanning from MicroServices Architecture through to Enteprise Architecture principles.

The configuration approach is powerful enough to handle governance of any type of application in the modern technology stack including 'cloud functions' while being flexible enough to be used in ordinary conversation between teams, departments and vendors.

A detailed explanation of the configuration options is [available](../configuration/index.md)

## Service / Application / Component Overview

… is best described through the [Usage for Developers](./developer.md) quickstart.

## Governance Inheritence Tree

… is a Don't Repeat Yourself (**DRY**) approach efficiently utilized in Service Oriented Infrastructure (**SOI**). As such configuration follows an inheritance path ovelaying prior configuration settings where necessary.

_Overrides:_
**template** ⇛ **group** ⇛ **service / application / component**

The use of this inheritance model also allows a segregation of security concerns where naturally authorized individuals interact with the correct Governance layers for enterprise and whole company management of Services.

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

`template` type selection is controlled via the `type` field. The following states select the `operatingEnvironment`:
- [] @ **dev** (default)
- ['DEVLIKE'] @ **dev** (alterantive for direct specification)
- ['HALIKE'] @ **ha**
- ['PRODLIKE'] @ **prod**
- ['HALIKE', 'PRODLIKE'] @ **perf**

Additional information on the `template` Technology Descriptors is [available](../configuration/templates.md)

## Adding a Template Technology Descriptor

… accomplished via a standard POST call. If running via the provided 'httpie' container
```
http POST cyvive:3000/template technologyDescriptor:='{"customName": {type: ["HADEV"]}}'
```

## Removing a Template Technology Descriptor

… accomplished via standard DELETE call. If running via the provided 'httpie' container
```
http DELETE cyvive:3000/template/customName
```

This will not remove any existing _deploymentTarget_'s that utilizing this `template` it will just remove the `template` from future _deploymentTarget_.

## Group Technology Descriptor

… is available for all groups under governance. Where applicable identical specifications at the `group` level override the `template` level. Its not necessary for `group` information to be specified as a pre-requisite to adding a Service / Application / Component to a non-existent group.

It is possible Service / Application / Component to inherit configuration information from the `group` level, thus allowing enhanced security over a traditional deployment model, where keys can be present in the application environment and unknown to developers with Service / Application / Component source code access.

Additional information on the `group` Technology Descriptors is [available](./configuration/groups.md)

## Additional Reading / Information

- [QuickStart: Developer](./developer.md)
- [Cyvive.io Configuration](../../configuration)
- [Cyvive.io Endpoints](../../endpoints)
- [Single Application / Service Example](https://github.com/cyvive/example-singular)
- [Multiple Application / Service Example](https://github.com/cyvive/example-multiple) {migrating}
- [Dependecy Application / Service Example](https://github.com/cyvive/example-dependencies) {migrating}
