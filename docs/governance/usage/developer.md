# QuickStart: Usage for Developers

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

## Governance Overview

_Cyvive.io_ is a [Layer 4 - 7 OSIMM Compliant](http://www.opengroup.org/soa/source-book/osimmv2/p2.htm) and as such implements a _Governance via Policy_ approach through YAML configuration files created per application / service / component.

The language used in configuration description is not arbritary, and is the culmination of 35 respected academic and industry studies with _containerization_ viewpoint spanning from MicroServices Architecture through to Enteprise Architecture principles.

The configuration approach is powerful enough to handle governance of any type of application in the modern technology stack including 'cloud functions' while being flexible enough to be used in ordinary conversation between teams, departments and vendors.

A detailed explanation of the configuration options is [available](../configuration/index.md)

## Enabling Governance of your Service / Application / Component

… is accomplished via a POST call to _Cyvive.io_. If running via the provided 'httpie' container
```
http POST cyvive:3000/data technologyDescriptor:='{"exampleGroup": {"exampleApp": {"version": "v1.8.x"}}}'
```
YAML as a string can also be provided if required under the technologyDescriptorYAML parameter

Governance assets are automatically versioned based on the `version` parameter

## Deploying a Governed Service / Application / Component

… is also done via POST call. If running via the provided 'httpie' container
```
http POST cyvive:3000/namespace deploymentTarget=development require:='["exampleApp.exampleGroup/"]' template=dev
```

Briefly expanding the parameters:

- `deploymentTarget` is the namespace / environment that _Cyvive.io_ should create or update
- `require` albiet an optional field will be used frequently by all developers. It provides the `root` of the governed dependency tree(s) to be deployed. As _Cyvive.io_ is Layer 7 compliant each `require` is a Uniform Resource Identifier (URI)
- `template` is a higher level Governance Technology Descriptor. At its core separated into 4 logicical types (development (*dev*) => high availability (*ha*) => performance (*perf*) => production (*production*)) with the default names provided in bold. Any number of `template`(s) can be created with custom names for each as long as they map to one of the core types for enabling / disabling elevated functionality. Additional information is [available](../configuration/templates.md)

## Removing a _deploymentTarget_

… accomplished via standard DELETE call. If running via the provided 'httpie' container
```
http DELETE cyvive:3000/namespace/development
```

## Purging a Service / Application / Component from Governance

… accomplished via standard DELETE call. If running via the provided 'httpie' container
```
http DELETE cyvive:3000/data/exampleGroup.exampleApp
```
This will not actively purge any deployed assets in targets, just this asset from Governance and by defacto future deployments.

## Additional Reading / Information

- [QuickStart: Govenor](./govenor.md)
- [Cyvive.io Configuration](../../configuration)
- [Cyvive.io Endpoints](../../endpoints)
- [Single Application / Service Example](https://github.com/cyvive/example-singular)
- [Multiple Application / Service Example](https://github.com/cyvive/example-multiple) {migrating}
- [Dependecy Application / Service Example](https://github.com/cyvive/example-dependencies) {migrating}
