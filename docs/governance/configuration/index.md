# Micro/NanoService YAML

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

!!! info
		- **Scope:** _MicroService Specific_
		- **File:** `cyvive.yaml`
		- **Location:** _Git Repository_ / _CI/CD Pushed_

## Understanding

… core component of the **Universal MicroServices Language**. This file describes the specific MicroService Governance policy to be extracted and implemented on demand in a Cloud Agnostic Cluster.

While _Cyvive_ doesn't mandate a specific adoption approach, a truely minimal configuration file is achieved through following industry best practices for structure and oragnisation.

_Cyvive_'s configuration language is architecturally and contexturally derived from partnership with 3 Universities and over 35 industry publications for providing a governance via policy meta-model that agnostically interfaces with the most complex orchestration technology while articulately able to be used in conversation.

_This file is a powerhouse behind agnostic infrastructure, and provides the most simple abstraction of deployment available today._

## Naming

**Cyvive** aligns with **Cloud Native** and **MicroServices** approaches. However, this **Universal MicroServices Language** is flexible enough to be used with OSIMMv2 / TOGAF as such the following naming conventions apply:

**MicroServices**:
- Suite
- Micro
- Nano

**OSIMMv2 / TOGAF**
- Group     -> Suite
- Service   -> Micro
- Component -> Nano

**CloudFunctions**
- Functions -> Nano

> If your PaaS can efficiently start instances in 20ms that run for half a second, then call it serverless
> Adrian Cockcroft AWS VP - 2016

In the context of this quote, any well designed container with proper governance and management can be classified as a _function_. For this reason, **Cyvive** uses the terminology _Nano_ instead of _function_ to more appropriately cover the functions and nanoservices classifications.

## Absolute Minimum File Structure

!!! note
		'⇛' character is used throughout this documentation where items are mandatory with respect to the parent YAML key. If not specified, then item is optional.

```
exampleSuite:
⇛ exampleMicro:
⇛   version: 'v1.8.x'
```

… this minimum structure is all that is necessary for _Cyvive_ to commence governance and interface with the orchestration technology at a minimum level.

If _Cyvive_ was then used to govern this application / service in a _deploymentTarget_ called 'preproduction' using the _template_ 'perf' against _Kubernetes_ as a orchestrator the following would happen:

- a `Deployment` would be created using the DockerHub hosted image: exampleSuite/exampleMicro:v1.8.x
- a `Service` would be created mapping port 80 to the `Deployment`
- a _DNS_ entry would be created in the cluster as `exampleMicro.exampleSuite.preproduction.svc.cluster.local`
- any other applications governed by _Cyvive_'s and allowed to be deployed against this _template_ would also be deployed following an automated dependency order.

!!! note
		SemVer is rapidly becoming the version management approach of choice for development as it balances the needs of devoplers and continous container deployment well while maintaining business requirements for release management and change requests.

## Micro/NanoService Inheritence Structure

```
exampleSuite:
⇛ exampleMicro:
    nano: 'identifier'
⇛   version: 'vTag'
```

… the typical structure used in a governance model would provide `nano`, `micro`, `suite` as units of categorization. _Cyvive_ inherits this concept where typically `suite` would be a higher level _Business Unit_ correctly decomposed containing a collection of _MicroServices_. 

The splitting point between `micro` and `nano` typically has a line of demarkation drawn between the need for an internal data model and direct algorithmic processing. 

The exact definition and demarkation of `suites` is left to the client, however by default when requesting a _container_ from the _container repository_ the format will be as such: 
- `exampleSuite/exampleMicro:vTag` or 
- `exampleSuite/exampleMicro-exampleNano:vTag` if `nano` key has been provided

As such its possible to use _Cyvive_ with any level of complexity in application relationships, while keeping isolation and deployment in a layered security approach.

## Suite Level Configuration / Technology Descriptor

```
exampleSuite
  exampleMicro: {}
  suite: {}
```

… is available for all suites under governance. Where applicable identical specifications at the `suite` level override the `template` level. Its not necessary for `suite` information to be specified as a pre-requisite to adding a Micro/NanoService.

It is possible for a Micro/NanoService to inherit configuration information from the `suite` level, thus allowing enhanced security over a traditional deployment model, where keys can be present in the application environment and unknown to developers with MicroService / NanoService source code access.

Additional information on the `suite` Technology Descriptors is [available](./suites.md)

## MicroService Technology Descriptor

```
exampleSuite
  exampleMicro:
    availability: {}
    circuitBreaker: {}
    commandLineInterface: {}
    component: string
    daemon: boolean
    endpoint: {}
    environment: {}
    label: {}
    layer: string
    repository: {}
    resource: {}
    security: {}
    stateful: {}
    version: {}
```

… illustrates a high level overview of the logical configuration sections. Detailed information is located under each subheading below. Where values for keys are shown they are the default values.

### availability

```
exampleSuite:
  exampleMicro:
    availability:
      gracePeriod:
        boot: 1
        stability: 0
        termination: 5
      minimum: 1
      maximum: 2
      probe:
        health:
          interval: 10
          path: '/'
          port: 80
        ready:
          interval: 5
          path: '/'
          port: 80
        timeout: 1
      scalingEvent: {}
```

- `gracePeriod`: minimum time in seconds to wait for events to occur
	- `boot`: Micro/NanoService & operating system startup boot time, this should be the minimum time before a health check endpoint is available to process a request.
	- `stability`: amount of time to wait for the health check endpoint to ensure consistent returns after boot time has been completed. This is typically used in legacy applications that need to stabilize their upstream and downstream communications when started or have large amounts of data to sync.
	- `termination`: is the maximum amount of time to wait before hard terminating the container operating system. It does not guarantee the Micro/NanoService will have or take this long to terminate, its just the maximum amount of time to wait for the signal from the container operating system to ensure its okay to terminate. (Note: the termination signal is sent immediately to all container processes, this is the period before the kill signal is sent)
- `minimum`: guaranteed minimum number of replicas to always be deployed in the _deploymentTarget_
- `maximum`: when scaling ensure that this number is not exceeded
- `probes`: notify the underlying orchestrator of Micro/NanoService status. Where `/health` is actual health, and `/ready` is ability to recieve traffic
	- `interval`: time in seconds for checking endpoint
	- `path`: endpoint path relative to container
	- `port`: internal port the probe endpoint is listening on
	- `timeout`: this option is not nested under each probe as failures are being monitored for, its expected that timeout values should apply to all check related endpoints equally.
- `scalingEvent`: is a passthrough object of trigger events to integrate with orchestration support in triggering scaling up and down of the replicas.

**Note:** With respect to deployment timeouts, **Cyvive**'s standard approach is to stall deployments as failed if the Micro/NanoService fails to enter `ready` state using one of the following timelines in order of priority rounded to the nearest second:

1. **probe.ready** specified: `(gracePeriod.boot + gracePeriod.stability + (probe.ready.interval * 2)) * 3.3`
2. **probe.health** specified: `(gracePeriod.boot + gracePeriod.stability + probe.health.interval) * 3.3`
3. **gracePeriod.stability**: `(gracePeriod.boot + gracePeriod.stability + 10) * 3.3`
4. **gracePeriod.boot**: `(gracePeriod.boot + 10) * 3.3`
5. **default settings**: `33` seconds

As seen above 10% buffer is applied to times to ensure container schedulling / restarting via the orchestrator doesn't introduce false-positives

### circuitBreaker

!!! info
    configuration structure still stabilizing 

### commandLineInterface

```
exampleSuite:
  exampleMicro:
    commandLineInterface:
      argument: []
      command: ''
```

… is an override path for container start commands. While most startups will embed the start command and respective arguments in the container image itself, efficient governance exposes all configuration, execution and dependency information. As such the organisation can choose to embed startup information in the container metadata or expose via governance layer.

- `argument`: standard cli arguments for execution. e.g. ['--list', '--debug']
- `command`: root command to execute when starting the container. e.g. '/usr/local/bin/command' should this not be specified then the default command the container was built with will be executed.

### nano

```
exampleSuite:
  exampleMicro:
    nano: ''
```

… provides a namespace separation for `nano`Services. Typically used when the MicroService would need to be logicaly broken down further than is possible within the `suite` specification. Or when only algorithmic processing capabilities are necessary

### daemon

```
exampleSuite:
  exampleMicro:
    daemon: false
```
… upgrades the Micro/NanoService to run as a _Daemon_ in the _deploymentTarget_. This ensures that every physical node belonging to this suite will have this _Daemon_ available on a low-latency local network hop.

### endpoint

```
exampleSuite:
  exampleMicro:
    endpoint:
      domain: {}
      port: 80
      provide: ['/']
      scheme: 'https'
      require: []
```

… are created for every Micro/NanoService by default and register DNS via the following schema: `nanoName-microName.suiteName.deploymentTarget.domain`

- `port`: open port for inbound interaction.
- `provide`: **important** for correct dependency management the `provide` endpoints are the registration points for Micro/NanoService searching and generation in the deployment graph.
- `scheme`: extensible against the scheme definitions in RFC standards, the key types are _http_ and _https_ where specifying https will cause auto-creation of SSL certificates at the cluster ingress point.

**Exploring the complex root keys:**

```
domain:
  'xyz.com': ['DEVLIKE', 'HALIKE', 'PRODLIKE']
  'testing.co': ['DEVLIKE']
```
The `domain` object is structured as follows:
- `key`: the domain name to expose against. This should be the Fully Qualified Domain Name (_FQDN_) as autogenerated DNS structure applies inside the cluster only.
- `value`: array of `operatingEnvironment`'s valid for exposing against. Exposure follows the schema mentioned previously, however it can be overridden as necessary

```
require:
  - 'redux.exampleSuite:443/api/v1/ending': ['incoming']
  - 'exampleMicro.exampleSuite:80/v1/': ['incoming', 'outgoing']
  - '162.0.5.2:8080/': ['outgoing']
```
The `require` object is quite important, and while optional, strongly recommended to always be supplied. It identifies all dependencies this Micro/NanoService has and helps contribute to the deployment order when creating a _deploymentTarget_. In the event a `require` is not registered with **Cyvive** it will be considered external to the cluster and **assumed** to already exist.

A useful note is that different versions of the same Micro/NanoService can be consumed by other eachother. This is achieved via the `version` key where each governance technology descriptor registers against the Micro/NanoService version.

The `require` object is structured as follows:
- `key`: Uniform Resource Identifier (URI) [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) compliant. The scheme is unnecessary as any routing restrictions are scoped as above
- `value`: traffic direction for filewall / security registration

### environment

```
exampleSuite:
  exampleMicro:
    environment:
      file:
        config: {}
        secret: {}
      variable: {}
```

… all items are directly exposed to the Micro/NanoService.

**Exploring the complex root keys:**
```
files:
  config:
    'alpha':
      mountPath: '/alpha'
      data:
        - name: configDetail
          value: 'string of information'
    'delta':
      inheritSuite: false
```

Each item in `config` is a representation of a _ConfigMap_ with individual items specified in the array object under `data`. Each item represents an individual file. `mountPath` is the directory location in the container that the _ConfigMap_ should be mounted to.

If `inheritSuite` is provided the configuration will be loaded from the suite settings enabling a more 'global' oriented view of configuration

```
files:
  secrets:
    'secretname':
      type: 'opaque'
      mountPath: '/secret-location'
      data:
        - name: secretInfo
          value: (base64 string)
    'anothersecret':
      inheritSuite: false
```

Each item in `secrets` is a map with individual items under `data` representing files to be mounted into the `mountPath` location in the container.


If `inheritSuite` is provided the secret will be loaded from the suite settings enabling a more 'global' oriented view of configuration

```
variable:
  'exposeName': 'exposeValue'
```

Direct mapping of the `key` to `value` provided as an environmental variable when executing the container start command.

Additionally **Cyvive** exposes some helper variables to identify the current context of the Micro/NanoService:

- `SELF_NAME`: name of the Micro/NanoService. This will also be the `hostname` of the running container
- `SELF_NAME_LOADBALANCER`: to assist in discovery, this is the LoadBalancer endpoint for incluster communication to this container and its replicas. This is relative to the deploymentTarget and not the Fully Qualified Domain Name (FQDN)
- `SELF_DEPLOYMENTTARGET`: _deploymentTarget_ that the Micro/NanoService has been deployed into
- `SELF_IP`: the internal cluster IP of the container

The following self-explanatory variables are also available to the container when specified via **Cyvive**'s governance:

- `SELF_MIN_MEMORY`
- `SELF_MIN_CPU`
- `SELF_MAX_MEMORY`
- `SELF_MAX_CPU`

### hardWired

```
exampleSuite:
  exampleMicro:
    hardWired:
      clusterDNS: ''
```

… is a catch-all for compatibility with non-governed processes. _It is strongly recommended not to use these keys unless absolutely necessary_ as each key will disable some governance functionality and introduce independent manual management scenarios that wouldn't normally be necessary.

- `clusterDNS`: is a hard overwrite of the cluster internal load balancer endpoint for the Micro/NanoService. It disables the autogeneration capabilities and can help with initially migrating non Cloud Native items.

### label

```
exampleSuite:
  exampleMicro:
    label:
      # app:			autocompleted ~ appName
      # component:	        autocompleted ~ component
      # release:		autocompleted in PRODLIKE environments ~ canary or stable
      # tier:			autocompleted ~ suiteName
      # version:		autocompleted ~ version key
      {any others you require}
```

Any labels not specified above can be used to help identify the applications & services. As the aforeentioned labels are reserved by **Cyvive** for governance, any custom values provided will be ignored as they are used for asset tracking

Although there is nothing stopping its use, the recommended approach is not to use _hotfix_ as a label or _blue_ / _green_ for deploys as when running Micro/NanoServices en masse at scale, _canary_ has been observed repeatedly as a more stable; reduced risk; and governable approach as everything passes through a 'canary' state anyway. (Under candidate based releases hotfixes are just releases that have been accelerated through the canary phase)

Additionally, **Cyvive** uses _Shadow Traffic Replication_ where return values are thrown away to prevent interference with production. This further provides isolation over the standard 'canary' approach validating the safety of the entire ecosystem to promote as a validated whole.

There is no limit to how many labels can be specified

### layer

```
exampleSuite:
  exampleMicro:
    layer: 'base'
```

… is a concept often used in Enterprise Architecture and earlier iterations of MicroServices. **Cyvive** underwent an extreemly careful active engagement process with its users prior to introducing this key.

The layer concept is used as part of the dependency graph generation process. Prioritizing and guaranteeing deployments of each layer prior to commencing the next, failing fast when any layer fails to deploy.

**Layers in Order**
1. data
2. communication
3. cache
4. backend
5. frontend

While strictly not necessary to specify, if known the `layer` should be specified as it allows for accelerated parallel deployment in the desired _deploymentTarget_

### repository

```
exampleSuite
  exampleMicro:
    repository:
      image:
        domain: 'hub.docker'
        name: 'exampleRedux'
        officialImage: false
        owner: 'exampleRedux'
```
… image registry autogenerated name uses the format: `repository/owner/name` as such the default without `image` specified would be one of: 
- `hub.docker/exampleSuite/exampleMicro` or
- `hub.docker/exampleSuite/exampleMicro-exampleNano` if `nano` key has been provided as seen earlier in [repository](#repository)

This can be overriden to anything you need in any combination using the following values:

- `domain`: overrides `suite` or `template` `domain` settings
- `name`: overrides `exampleMicro` in the sample. This impacts deployed application name & container image repository url generation.
- `officialImage`: is a structureal specification for _DockerHub_ where official images have a different retrieval structure. Setting this as true would result in _exampleMicro_ being the official image name or if provided `name` would still override to be the official image name.
- `owner`: override for owner in technology descriptor

### resource

```
exampleSuite:
  exampleMicro:
    resource:
      max:
        cpu: 500
        memory: 1Gi
      min:
        cpu: 300
        memory: 1Gi
      qos: ''
```

… allocation is an important part of all container orchestration schedullers, and these values should be provided prior to deploying Micro/NanoService to `production` _deploymentTarget_ although, if not specified **Cyvive** will operate without issue.

- `max` absolute maximum requirements that we are prepared to allocate.
- `min` minimum required in order to guarantee application boot and ready for traffic interaction.

`qos` is **mandatory** should `min` or `max` be specified

If neither `min` or `max` are specified then `template` defaults (if specified) will be used. The ability to provide `template` resource defaults is to ensure safe co-habitation of Services / Applications / Components when / if they go rogue.

`cpu` is units of CPU core specified in 'm' thus for a single CPU core _1000_ should be used. The 'm' is omitted and should not be specified.
`memory` should always have the multiplier specified as part of the value i.e. 'Gi' any suitable value can be specified from the following: `Ki Mi Gi Ti Pi Ei`
`qos` follows the approach:

- **guaranteed**: highest possible level, everything not this level will suffer 'pause' events to ensure these pods continue to operate.
- **burstable**: _default_ `min` values are allocated to the pod as minimum required to run. No upper limits are placed on resources.
- **effort**: can be used when the application is lowest priority of them all. `min`, `max` and `namespace default` values are totally ignored. (Currently un-implemented due to lack of user demand)

### security

!!! info
    configuration structure still stabilizing 

```
exampleSuite:
  exampleMicro:
    security:
      account:
        name: alternativeOne
        reference: admin
```

- `account`: should an account be required that isn't the suite security account or 'default' i.e. another suite's account. It can be overriden here. _Specifying will create the account if it doesn't exist_

### stateful

!!! info
    configuration structure still stabilizing 

```
exampleSuite:
  exampleMicro
    stateful:
      cloudNative: false
      databaseName: ''
      individualServices: false
      replica: 3
      sharedStorage: false
      volume:
        'avolume':
          mountPath: '/avolume'
          size: '10Gi'
          storageClass: ''
```

- `cloudNative`: Enables the ability to deploy stateful applications in parallel and will automatically compact number of replicas down in envionments that aren't 'HALIKE' or 'PRODLIKE' to save resources.
- `databaseName`: standard application naming will be applied if this field is omitted. Its frequently used in custom templates for configuring some of the expected internals
- `individualServices`: some applications can operate under a common service endpoint, others such as MongoDB require fixed service endpoints for each database
- `replica`: number of PODS that should be deployed, if the backend supports it anti-affinity rules will already be in place per Availablility Zone and Host.
- `sharedStorage`: determines if the PODS should have mount the same storage or have unique storage per pod (**warhing** multi-mount storage is unsupported by most storage drivers)
- `storageClass`: the type of storage strategy that should be applied

In providing a consistent minimal configuration the `stateful` configuration integrates with `endpoint` and it should be used for accessing accordingly

Amount of time that should be given after sending _kill_ signal to the container OS before terminating and removing the container.

### version

```
exampleSuite:
  exampleMicro:
    version: 'latest'
```
… standards and application is a constantly debated aproach with different internal standards used within organizations. Internally **Cyvive** maintains governance versions based on this `key` and `value`. For effective governance of infrastructure in cloud native approaches Semantic Versioning [SemVer](https://semver.org/) is sanest choice. While Micro/NanoService versioning typically is best suited to [ComVer](https://github.com/staltz/comver)

**Cyvive**'s integration with SemVer only tracks `major` `minor` `patch` the _extensions format_ is stripped off for tracking purposes.

If its necessary to modify governance information, then SemVer should be incremented to prevent cross-contamination of prior governed assets.

Container images when using SemVer are _not_ re-pulled from the image repository each time as they should and are assumed to be immutable.

static labels i.e. `latest` can also be used with the understanding that configuration changes will be applied to all future _deploymentTarget_ and container images will be re-pulled every time.

