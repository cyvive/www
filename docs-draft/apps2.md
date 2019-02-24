# YAML @ Apps

!!! info
		- **Scope:** _App Specific_
		- **File:** `cyvive.yaml`
		- **Location:** _Application Repository_ / _CI/CD Pushed_

## Requirements

- **Cyvive**
… minimal, but extensible with complexity and application understanding description for deployment and management on any infrastructure.

The only restrictions _Cyvive.io_ places on application descripiton and deployment is the concept that every applicaton must be tied to a group. This is modeled on the 'owner/application' model that Docker registries also follow.

This file is the powerhouse behind agnostic infrastructure, and provides the most simple abstraction of deployment available today.

This file works in tandem with the 'Cyvive.io.namespaces.yaml' file that lives in the built Cyvive.io docker file: see [YAML: namespaces](./namespaces.md) and will be deployed into all available namespaces unless veto'd

## Bare Minimum File Structure

!!! note
		'~' character is used throughout this documentation where items are mandatory.

```
exampleGroup:
  exampleApp:
    imageTag: 'v1.8.x'
```

<!-- `language` is required as while the source, code repository can automatically detect the coding language used, infrastructure deployments cannot as its not possible to discover the container configuration or 'guess' the language the container is using without starting the container. **NOTE langage selection not currently implemented, specified in documentation for API understanding** -->

!!! note
		SemVer is rapidly becoming the version management approach of choice for development as it balances the needs of devoplers and continous container deployment well while maintaining business requirements for release management and change requests.

## Root Structure

```
exampleGroup:
```

Groups are flexible macro deployment units. There is no enforcement of 'what' exactly a group should be as it can greatly vary from business to business.

In our industry experience, typically groups appear to model one of the following patterns:

* **Business Unit Separation** every logical business unit has a collection of apps that interface with other parts of the business / consumer.
* **Service Oriented Architecture** where a collection of microservices are combined to form a logical unit. i.e. Frontend (Browser), Backend (API), DataBase

As such its possible to use _Cyvive.io_ with any level of complexity in application releationships, while keeping isolation and deployment in a layered security approach.

## Group Template

```
exampleGroup:
  group: {}
  app: {}
  anotherApp: {}
```

### group

```
exampleGroup:
  group:
		authRepository: {}
		config: {}
		secrets: {}
    containerOwner: ''
    containerRepository: ''
    depends: []
    omitFromDeploy: []
    omitFromNamespaces: []
    serviceAccount: {}
```

`group` is a special key in the tree structure. Without it there is no way to differentiate shared `group` level configuration requirements from applications level configuration.

While flexible, naming of groups is important as the resulting auto-generated app, domain and Docker registry names will by default incorporate the GroupName (can be veto'd if required)

As **Cyvive.io** doesn't mandate how to run your infrastructure design (just greatly simplifies it), `group` wide settings can live in several places:

The normal approach most users tend to take is to initially put group settings into each app as relevant, and then as the group becomes defined merge the 'global' settings into _Cyvive.io.groups.yaml_

### authRepository

```
exampleGroup:
	group:
		authRepository:
			'exampleGroup':
				- name: ''
				- value: ''
```

An array of Docker permission files for repository access.

### config

```
exampleGroup:
	group:
		config:
			'configname':
				mountPath: '/somewhere'
				data:
					- name: configDetail
						value: 'string of information'
```

Each item in `config` is a representation of a _ConfigMap_ with individual items specified in the array object under `data`. Each item represents an individual file. `mountPath` is the directory location in the container that the _ConfigMap_ should be mounted to.

### secrets

```
exampleGroup:
	group:
		secrets:
			'secretname':
				type: 'opaque'
				mountPath: '/secret-location'
				data:
					- name: secretInfo
						value: (base64 string)
```

Each item in `secrets` is a map with individual items under `data` representing files to be mounted into the `mountPath` location in the container.

### containerOwner

```
exampleGroup
	group:
		containerOwner: 'exampleRedux' # default = ''
```

_Cyvive.io_ when generating the repository URL for the container retrieval automatically populates the owner with the parent _groupName_ i.e. `exampleGroup`. This is the override field

!!! warning
		It is **strongly** recommended not to use this field as the group name should also be the container owner name in the registry for organisation and consistency.

### containerRepository

```
exampleGroup
	group:
		containerRepository: 'quay.io'
```

`containerRepository` is the actual location of the Docker registry that stores container images. Default is 'quay.io' as this is often used by enterprise and SME for its security scanning.

<!-- TODO upgrade containerRepository to cluster & namespace levels for full defaulting and tree inheritance -->

### depends

```
exampleGroup:
  group:
    depends: # default = []
      - itStarts
      - itShouldStart.something
```

This is a cross linking between application groups. More specific to the git-flow / trunk approach Cyvive.io assists in implementing for Continuous Deployment.

Listings here specifically enforce that groups & / or applications are also deployed into the namespace whenever this group is deployed.

<!-- TODO: Additionally, adding a depends ensures that the applications in this group will not be deployed until these dependent applications succeed in receiving traffic. -->

In understanding how `depends` works, using the provided values

* _itStarts_ is a group and all apps in that group are necessary for any application in this group to function
* _itShouldStart.something_ is an application inside the group _itShouldStart_ and this specific application must be running for any application in this group to function.

### omitFromDeploy

!!! warning
		"Gotcha" values must be quotation wrapped to ensure they resolve correctly

```
exampleGroup:
  group:
    omitFromDeploy: # default = []
      - 'stub'
      - 'stub.stubbed'
```

A list of _apps_ within this group that will be blacklisted from deploying in all environments / namespaces.

### omitFromNamespaces

```
exampleGroup:
  group:
    omitFromNamespaces: # default = []
      - prod
```

A list of _namespaces_ that this group should be banned from. This is the reverse compliment of _namespaces.omitFromDeploy_ and is architecturally used differently. _namespaces.omitFromDeploy_ typically specifies permanently banned groups and applications to prevent accidental deployment, while _omitFromNamespaces_ at the group level is used for temporary barring while pre-mature for deployment.

### serviceAccount

```
exampleGroup:
  group:
    serviceAccount: # default = {}
      name: specificOne
      roleRef: view
```

Following the Kubernetes serviceAccount principles, if a custom serviceAccount is required for permissions / group access this would create it using the 'roleRef' of a matching ClusterRole. The default account if this is omitted is 'default' with no minimal to no permissions

## App Template

```
exampleGroup
  exampleApp:
		config: {}
		secrets: {}
    depends: {}
    environment: {}
    ha: {}
    imageTag: 'latest'
    ingress: {}
    labels: {}
    probes: {}
    resources: {}
    stateful: {}
		daemon: true
		args: []
		terminationGracePeriodSeconds: '30'
    vetos: {}
```

### config

```
exampleGroup:
	exampleApp:
		config:
			'configname':
				mountPath: '/somewhere'
				data:
					- name: configDetail
						value: 'string of information'
			'anotherconfig':
				inheritGroup: true
```

Each item in `config` is a representation of a _ConfigMap_ with individual items specified in the array object under `data`. Each item represents an individual file. `mountPath` is the directory location in the container that the _ConfigMap_ should be mounted to.

If `inheritGroup` is provided the configuration will be loaded from the group settings enabling a more 'global' oriented view of configuration

### secrets

```
exampleGroup:
	exampleApp:
		secrets:
			'secretname':
				type: 'opaque'
				mountPath: '/secret-location'
				data:
					- name: secretInfo
						value: (base64 string)
			'anothersecret':
				inheritGroup: true
```

Each item in `secrets` is a map with individual items under `data` representing files to be mounted into the `mountPath` location in the container.


If `inheritGroup` is provided the secret will be loaded from the group settings enabling a more 'global' oriented view of configuration


### environment

```
exampleGroup:
  exampleApp:
    environment:
      itStarts: awesome
      {any others you require}
```

Everything under environment will be exposed to the application. Should environmental names be the same as those specified in 'namespaces' then these will take priority.

### depends

```
exampleGroup
  exampleApp:
    depends:
      - 'exampleApp2'
      - 'itShouldStart.something'
```

Logically follows the same approach as `group.depends`. However its scoped to apps within this group.

Its possible to also specify dependencies on an external application in another group.

<!-- And this application will not be deployed until these are capable of receiving traffic -->

### ha

_API will be re-written with Kubernetes Metrics re-write_

```
exampleGroup:
  exampleApp:
    ha:
      minReplicas: 1
      maxReplicas: 2
      maxUnavailable: "30%"
      maxSurge: "10%"
      autoScaler:
        targetCPUUtilizationPercentage: '75'
```

### imageTag

```
exampleGroup:
  exampleApp:
    imageTag: 'latest'
```

This is the only truly 'opinionated' approach in _Cyvive.io_, SemVer is getting more traction for structured releases and provides an excellent approach to versioning where if used and autoDeploy is enabled then _Cyvive.io_ will automatically deploy relevant versions into their respective environments.

_Cyvive.io_ deployment approach integrates with the 'Flow' specfication in [namespaces](/api/namespaces) such that following SemVer:

* **patch**: changes applied to all environments
* **minor**: changes applied to 'DevTest' & 'HA' environments
* **major**: changes applied to 'DevTest' only

Additionally _namespace.releaseFrequency_ is respected for all deployments.

As such _autoDeploy_ is typically safe to leave enabled as an initiated process must be activated to promote release versions between environment types.

If a fixed label i.e. 'latest' is used instead then _Cyvive.io_ will scan for changes to the underlying deployment following _namespace.releaseFrequency_ settings. When changes are detected they will be applied automatically.

!!! note
		This fixed label approach is only supported by _Cyvive.io_ because of community requests from startup. Its not a release / rollback safe strategy and should be used sparingly.

### ingress

```
exampleGroup:
  exampleApp:
    ingress:
      additionalDomains:
        - name: anotheredux.co
        - name: 'another.co'
          paths:
            - path: '/additional'
              port: another
						- path: '/another'
							port: 8765
      additionalPorts:
        - name: another
          port: 8765
          expose: true
          paths:
            - '/override'
        - name: redux
          port: 9990
      exposeDevelopment: true
      exposeProduction: true
      paths:
				- '/override'
      vetos:
        defaultPort: 5678
        disableFromURLGroup: true
        disableFromURLNamespace: true
        disableOutputGroup: true
        disableOutputNamespace: true
        disableService: true
        domainName: somewhere.co
				exposeService: true
        fqdn: awesome-app.dev.else.co
        ignoreTLS: true
				name: 'myapp'
```

Its important to understand that as **Cyvive** configurations are Application centric, ingress is with respect to the Application's requirements.

Getting traffic in and out of your cluster in a sensible and controlled way is challenging. We follow the approach of _Kubernetes_ in creating ingress points (Egress to come) using the cluster auto-mapping capabilities (if available) to create the actual DNS & Load Balancers with your cloud provider.

L7 Load Balancing is option-wise complex to say the least. Any suggestions on how to simplify the mapping are welcome

By default, _ingress_ is created for every application in the namespace using the default format of: `appName.groupName.namespace.clusterFQDN`

If `servicePorts` contains `ingress: true` then this additional port will also be mapped with the default format of: `port-appName.groupName.namespace.clusterFQDN`

Walking through the options:

* `additionalPorts`: every port listed here will map to the created service. The actual name of the service is autogenerated from the application deployment name and _must_ be modified according to the rules there to change.
* `paths`: everywhere `paths` is mentioned an array of additional paths to add to the ingress are listed. This is a full override of the default '/' path option so if you need this enabled with additional paths it will need to be added
* `additionalDomains`: very simple logic mapping, for each additionalHost what are the paths and ports that should be exposed. _Cyvive.io_ makes no assumptions about an additionalHost as its a common use-case to restrict routes on secondary domains.
* `disableFromURLGroup`: removes `groupName` from the generated output URL
* `disableFromURLNamespace`: removes `namespaceName` from the generated output URL
* `disableService`: will turn off _ingress_ and _service_ capabilities for this application. Not all applications need to be exposed to other applications in the cluster and this toggle is to permit that use-case
* `domainName`: override of automatically generated hostname. The full DNS including FQDN for the cluster must be specified
* `defaultPort`: by default its `80` this provides an override capability. Note the name of the servicePort `default` doesn't change, just the port number it maps to.
* `ignoreTLS`: when TLS is enabled in the namespace, with termination specified as _cluster_ an additional TLS field is created to allow cluster based TLS termination. HTTP traffic is disabled by default when TLS is enabled. This allows HTTP traffic to also reach the cluster.
* `name`: overrides the service name to assist with existing hard wired DNS apps

!!! note
		_Kubernetes_ currently has a restriction where only HTTP & HTTPS ports can be used for _ingress_ externally. The API will be upgraded when this limitation is removed.

### labels

```
exampleGroup:
  exampleApp:
    labels:
      # app:    autocompleted ~ appName
      # tier:   autocompleted ~ groupName
      # track:  autocompleted ~ namespace.releaseFrequency || can override
      # release: autocompleted in PRODLIKE environments ~ canary or stable
      {any others you require}
```

Any labels can be used to help identify the applications & services. The following are reserved labels that are generated by Cyvive.io based on the provided yaml to accurately identify what's deployed where. Text following the '~' sign in the based on the above yaml

* _app_: autocompleted ~ appName
* _tier_: autocompleted ~ groupName
* _track_: autocompleted ~ namespace.releaseFrequency || _can override_. Track determines how often this environment promotes its candidate release
* _release_: autocompleted ~ canary or stable. releases are candidate style i.e. canary -> stable

Hotfix isn't a label as we strongly suggest following SemVer for deployments, and as seen all applications have the ability to promote through the 'canary' state. Effectively under candidate based releases hotfixes are just releases that have been accelerated through the canary phase.

You are free to add as many custom labels as you need.


### probes

```
exampleGroup:
  exampleApp:
    probes:
      healthCheck: '/override'
      minBoot: 10
      minStability: 30
      pollingInterval: 10
      port: 80
      rebootFactor: 200
      timeout: 1
```

All times are specified in seconds.

_Ideally pod health-checking would run through 'GOSS'_

* `healthCheck`: default is '/'
* `port`: default 80 cannot use servicePort names as they don't exist at this level.
* `rebootFactor`: is a percentage value of stability that should be allowed before the pod is considered unavailable and should be restarted.

### resources

```
exampleGroup:
  exampleApp:
    resources:
      max:
        cpu: 500m
        memory: 1Gi
      min:
        cpu: 300m
        memory: 1Gi
      qos: ''
```

Depending on the infastructure backend chosen, this can get complex. _Cyvive.io_'s approach is much simpler in that if you know what your performance test values / app requirements are they can be placed here.

`max` should be the absolute maximum requirements that we are prepared to allocate to this pod.

`min` should be the minimum required to actually start and run your application with the expectation that if these aren't allocated the application won't be able to start or operate.

If neither `min` or `max` are specified then the namespace defaults will be used.

`qos` follows _Kubernetes_ approach:

* **guaranteed**: highest possible level, everything not this level will suffer 'pause' events to ensure these pods continue to operate.
* **burstable**: _default_ `min` values are allocated to the pod as minimum required to run. No upper limits are placed on resources.
* **bestEffort**: can be used when the application is lowest priority of them all. `min`, `max` and `namespace default` values are totally ignored. (Currently un-implemented due to lack of user demand)

### stateful

```
exampleGroup:
	exampleApp
		stateful:
			databaseName: ''
			individualServices: true	# default = false
			noCompact: true						# default = false
			replicas: 3
			sharedStorage: true				# default = false
			volumes:
				'avolume':
					mountPath: '/avolume'
					size: '10Gi'
					storageClass: ''
```

* `databaseName`: standard application naming will be applied if this field is omitted. Its frequently used in custom templates for configuring some of the expected internals
* `individualServices`: some applications can operate under a common service endpoint, others such as MongoDB require fixed service endpoints for each database
* `replicas`: number of PODS that should be deployed, if the backend supports it anti-affinity rules will already be in place per Availablility Zone and Host.
* `noCompact`: in envionments that aren't 'HA' or 'PRODLIKE' **Cyvive** will auto-compact to save resources, typically this isn't a problem, however in Stateful dependent applications depending on their requirements they may be configured for n+1 guaranteed minimum levels. As such setting this flag to false will ensure `replicas` number is respected for all environment types. Additionally applications that tollerate `canCompact` will be created in parallel while those that cannot will execute sequentially
* `sharedStorage`: determines if the PODS should have mount the same storage or have unique storage per pod
* `storageClass`: the type of storage strategy that should be applied

In providing a consistent minimal configuration the `stateful` configuration integrates with `ingress` and it should be used for accessing accordingly

### terminationGracePeriodSeconds

```
exampleGroup:
  exampleApp:
    terminationGracePeriodSeconds: 30
```

Amount of time that should be given after sending _kill_ signal to the container OS before terminating and removing the container.

### vetos

There are no default values in `vetos` as these values aren't necessary for application functionality & deployment

```
exampleGroup
  exampleApp:
    vetos:
      autoDeploy: false # default = true
      containerName: 'exampleRedux'
      containerOwner: 'exampleRedux'
      containerRepository: 'hub.docker.io'
      enableProfiler: true
      isolateMetadata: true
      name: example-app
			officialImage: 'redis'
      omitFromDeploy: true
      omitFromNamespaces:
        - prodRedux
      serviceAccount:
        name: alternativeOne
        roleRef: admin
```

!!! note
		image registry autogenerated name uses the format: `containerRepository/exampleGroup/exampleApp` this can be overriden to anything you need in any combination using values for

    - `name`
    - `containerRepository`
    - `containerOwner`
    - `containerName`
		- `officialImage`

    Its recommended to override as little as possible as long-term container image management is easiest when using this auto-generated best practice.

* `name`: overrides `exampleApp` in our code sample. This impacts deployed application name & container image repository url generation. (Container Image Name can be further overriden by providing _containerName_ value)
* `enableProfiler`: is a hard override to settings applied from the namespace, this will force enable or disabled irrespective of namespace settings
* `serviceAccount`: should an account be required that isn't the group serviceAccount or 'default' i.e. another group's account. It can be overriden here. _Specifying will create the account if it doesn't exist_
* `autoDeploy`: when set to 'false' it disables any automatic deployments for the application.
* `omitFromDeploy`: when specified will hard prevent this app from being deployed to any namespace
* `omitFromNamespaces`: prevents app from being deployed on any specific namespace. See `group.omitFromNamespaces` for more information
* `containerRepository`: hard override for any upstream `containerRepository` settings
* `containerOwner`: hard override for owner in respository url
* `containerName`: hard override for name in container url
* `isolateMetadata`: every pod is deployed with an awareness of essential information about the ecosystem it lives in. Such as 'name', 'namespace', 'own*ip'. \_Cyvive.io* pushes these values into the deployed pod by default. Enabling this prevents pushing these values in.

!!! note
		**autoDeploy** is by default _enabled_ this is a design feature of _Cyvive.io_ to automatically advance deployments according to releaseFrequency when made available. Its the primary opinionated view we take that applications should be tested thorougly while being auto-promoted through environments.
