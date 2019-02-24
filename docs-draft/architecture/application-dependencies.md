# Application Dependencies

!!! summary
		understanding integrations between microservices; services; applications and whole company deploys

## Reasoning

In the days of Monolithic applications, everything needed was deployed at once, on a single server. Moving forward, we have the concept of services; microservices and nanoservices. Yet for actual application functionality logical groupings of nano and microservices are necesseary to provide service functionality. In the containerization world such logical groupings while ideally independent and isolated can still have initilization and startup dependencies.

For instance, Databases should be present before backend applications, and backends should be present before webapps make API requests to backends.

In order for _Cyvive.io_ to successfully manage a _Flow_ type (Git Flow / Trunk / OneFlow) approach to application development, the capability would need to be present at a high level to deploy the entire tech stack sequentually in order into the backend's namespace.

## Approach

… is supported through creation of _graph_ dependency trees and configuration information (if known). Logically _Cyvive.io_ makes the following assumptions:

* if `depends` & `omitFromDeploy` configuration fields are unspecified for the application and this application is not referenced in another applications' `depends` or `omitFromDeploy`, then application has equal weighting for the group it belongs in and is placed into the _parallel deployment bucked_ outside the dependency _graph_
* if `depends` is specified for this application or this application is referenced in another applications `depends` then calculate applications sequential edge in the _graph_
* if `omitFromDeploy` is specified for this application or this application is referenced in another applications `omitFromDeploy` then remove from the deploy que.

Applications registerd in the dependency _graph_ are deployed sequentially following the optimal edge algorithm.

Deployment advances to next application when the currently deployed application's `isReady` status is `true`

`depends` additional information can be found [here](../yaml-definitions/apps.md#depends) `omitFromDeploy` additional information can be found [here](../yaml-definitions/apps.md#omitFromDeploy)
