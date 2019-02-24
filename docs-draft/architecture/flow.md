# Flow

!!! summary
		Evolution of Git Flow / Trunk while providing a technical platform for alternative Git Deployment approaches

## Reasoning

Continuous Integration (CI) & Continous Deployment pipelines are not new. Using them in conjunction with a multitude of containers (microservices) under various levels of control and integration expands the pipeline path and spin-up options exponentially.

Typically this exponential growth would result in various mocking approaches or integration agreements between microservice or container providers. But keeping these in sync is more than daunting.

_Cyvive.io_ abstracts management and synchronization of individual repositories to a higher _Agile_ and _Kanban_ approach where stories; features; hotfixes are represented through short-lived named branches in Git. Short-lived named branches is a common development model most organisations are familiar with and use day to day in their _Agile_ and _Kanban_ tracking tools.

## Approach

… undertaken is to hook into the GitHub Branch Events API for each tracked repository. Whenever a new branch is created _Cyvive.io_ deploys a namespace using the branch name.

Take `feature-132` as a sample branch that affects two microservices:

* `frontend`
* `external-dep`

When either microservice is pushed to GitHub the new branch event is emitted. _Cyvive.io_ issues the `flow create namespace` command using the default `dev` template. (As the entypoint into the flow pull ecosystem). As _Cyvive.io_ configuration for applications can contain [`depends`](../yaml-definitions/apps.md#depends) and [`omitFromDeploy`](../yaml-definitions/apps.md#omitFromDeploy). Further reading about how dependency mapping and deployment is achived can be found [here](./application-dependencies.md)

A full interdependent namespace has now been deployed as an ecosystem for microservice tests and changes to experiment and proove in.

When the other microservice is deployed, _Cyvive.io_ recognising the existing branch name, updates **only** the microservice running in the namespace branch. Integration and dependency tests between the two microservices can now be sucessfully completed in a fully replicated tech stack.

After acceptance, code from the `feature-132` branch would typically be merged back into a long-lived branch. _Cyvive.io_ recieving the _deleted branch_ even from GitHub would delete the _namespace_ branch.

## Pulling

… of microservice updates is baked into _Cyvive.io_, as such careful observation of the prior example would identify that each _namespace_ managed by _Cyvive.io_ is looking to pull and deploy changes constantly for the life of the _namespace_.

As such, its possible to implement a full environmental deloyment lifecycle via approprately named branches (Git Flow style) where _Cyvive.io_ will pull the latest changes into that branch based on the environmental template it was deployed with originally.

Complex deployment & release logic can be achieved through the [Release Management Plugin].
