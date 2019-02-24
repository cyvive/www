# Deployment Patterns

!!! summary
		Architectured for use in Enterprise & Startup organisations **Cyvive.io** is typically used in one of the following deployment patterns

In addition to these deployment patterns any of **Cyvive.io**'s Plugins can be hot added to the deployment or baked into the container.

Its assumed that prior to using any of these deployment patterns, the user is familiar with the [Getting Started](../getting-started.md) guide and has setup _cyvive.yaml_ files in each GitHub repository they wish to track & manage via **Cyvive.io**

Additionally, please remember that these deployment patterns only apply to **Cyvive.io** master, and its initial startup. All subsequent startups will automatically download the configuration database from the backend and expect changes to occur through the API. All workers are exclusively managed by **Cyvive.io** itself.

## Vanilla Cyvive.io

This is the most common deployment pattern, as GitHub application repositories have already been configured for injestion by **Cyvive.io**. A vanilla master is deployed, and then the cluster administrator would enable tracking on repositories to be managed

* Select the appropriate [backend](../backends) to install **Cyvive.io** on
* Deploy **Cyvive.io** via the deployment file for the backend version your currently using in the backends _/deploy-Cyvive.io/vX.X.X_ directory
* Use **Cyvive.io**'s [tracker](../rest-apis/tracker.md) interface to add the GitHub repositories

## Embedded YAML's Cyvive.io

!!! note
		While its possible to fork the open source repository, add the YAML's and build a new container, this approach is only recommended where custom backends or propriatory (in-house) plugins are necessary. For the vast majority of users the extra overhead of keeping a fork current with **Cyvive.io**'s development is an unnecessary overhead

This pattern is utilised when a database hasn't been initiated and bulk import of applications is required.

* Create a new Container extension file, if using Docker use the released version as the base image in FROM
* Place _{{name}}.app.yaml_ files in _/Cyvive.io/default_ directory for all the applications that should be managed by **Cyvive.io** applications can be deployed in separate files or merged into a single file _app.yaml_
* (Optional) Place _{{name}}.tracker.yaml_ files in _/Cyvive.io/default_ directory for every application that should be tracked, auto-deployed / updated / managed via **Cyvive.io**
* Modify the _/deploy-Cyvive.io/vX.X.X/cyvive.yaml_ in the appropriate [backend](../backends) to use your custom file & deploy.

## Backend Managed Cyvive.io

In this pattern the configuration management system implemented via the backend is used for initial setup of **Cyvive.io** passing in the _{{name}}.app.yaml_ & _{{name}}.tracker.yaml_ files directly into the image on container boot.

* In your respective backend, pre-populate _ConfigMap_ type items with _{{name}}.app.yaml_ & _{{name}}.tracker.yaml_ files
* Modify the backend's _/deploy-Cyvive.io/vX.X.X/cyvive.yaml_ with additional information to deploy the app & tracker yamls from the previous step into the _/default_ directory in the **Cyvive.io** container & deploy.
