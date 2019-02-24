# Group YAML

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

!!! info
		- **Scope:** _Group for Application / Service / Component Inheritence_
		- **File:** `*.group.yaml`
		- **Location:** _Governance Repository_ / _CI/CD Pushed_

## Understanding

… core meta component for governance. This file describes the specific group level governance policy to be extracted and implemented on demand in the cluster orchestration infrastructure against Service / Application / Component registered against this group.

_Cyvive.io_'s configuration language is architecturally and contexturally derived from over 35 specifilized industry and academic works for providing a governance via policy meta-model that agnostically interfaces with the most complex orchestration technology while articulately able to be used in conversation.

_This file is a powerhouse behind agnostic infrastructure, and provides the most simple abstraction of deployment available today._

## Group Level Configuration / Technology Descriptor

```
exampleGroup:
  group:
		environment: {}
		repository:
			image:
				auth: {}
			  domain: 'hub.docker.io'
		    owner: 'exampleRedux'
    security: {}
```

… `group` is a reserved keyword. It directly specifies that all keys present are applied to all applications / services also registered against the group.

### environment

… structural copy of [Service / Application / Component Environment](./index.md#environment)

### repository

```
exampleGroup:
	group:
		repository:
			image:
				auth: {}
				domain: 'hub.docker.io'
				owner: 'exampleRedux'
```

… defaults for Service / Application / Components related to this `group`. Typically the `group` would map directly to a business unit or complex service. Based on this, the `group`'s may be logically stored in different image repositories.

There are some differences from [Service / Application / Componenent Repository](./index.md#repository) as can be seen below
```
image:
	auth:
		'exampleGroup': 'ZmF0aG9tYWJsZQo='
	domain: 'gcr.io'
	owner: 'internal'
```

- `auth`: is a series of base64 encoded objects containing the Docker login information.
- `domain`: container repository domain information, this will become the default for all items registered against this group
- `owner`: change the default owner from the group name (e.g. exampleGroup) for all items registered against this group

### security

… structural copy of [Service / Application / Component Security](./index.md#security)


