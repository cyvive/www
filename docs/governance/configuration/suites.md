# Suite YAML

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

!!! info
		- **Scope:** _Suite for Micro/NanoService Inheritence_
		- **File:** `*.suite.yaml`
		- **Location:** _Governance Repository_ / _CI/CD Pushed_

## Understanding

… core component of the **Universal MicroServices Language**. This file describes the specific suite level governance policy to be extracted and implemented on demand in the cluster orchestration infrastructure against Micro/NanoService registered against this suite.

_Cyvive_'s configuration language is architecturally and contexturally derived from partnership with 3 Universities and over 35 industry publications for providing a governance via policy meta-model that agnostically interfaces with the most complex orchestration technology while articulately able to be used in conversation.

_This file is a powerhouse behind agnostic infrastructure, and provides the most simple abstraction of deployment available today._

## Group Level Configuration / Technology Descriptor

```
exampleGroup:
  suite:
    environment: {}
    repository:
      image:
        auth: {}
        domain: 'hub.docker.io'
        owner: 'exampleRedux'
    security: {}
```

… `suite` is a reserved keyword. It directly specifies that all keys present are applied to all Micro/NanoServices also registered against the suite.

### environment

… structural copy of [Micro/NanoService Environment](./index.md#environment)

### repository

```
exampleGroup:
  suite:
    repository:
      image:
        auth: {}
        domain: 'hub.docker.io'
        owner: 'exampleRedux'
```

… defaults for Micro/NanoServices related to this `suite`. Typically the `suite` would map directly to a business unit or complex service. Based on this, the `suite`'s may be logically stored in different image repositories.

There are some differences from [Micro/NanoService Repository](./index.md#repository) as can be seen below
```
image:
  auth:
    'exampleGroup': 'ZmF0aG9tYWJsZQo='
  domain: 'gcr.io'
  owner: 'internal'
```

- `auth`: is a series of base64 encoded objects containing the Docker login information.
- `domain`: container repository domain information, this will become the default for all items registered against this suite
- `owner`: change the default owner from the suite name (e.g. exampleGroup) for all items registered against this suite

### security

… structural copy of [Micro/NanoService Security](./index.md#security)


