# Tracker

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

!!! summary
		Auto-management of application infrastructure requirements and container change tracking

## REST Routes

!!! note
		structure: {{TYPE}} {{ROUTE}} {{JSON BODY}} Tracker Names follow the format: group.name

* **DELETE /trackers/{{group}}.{{name}}**
* **GET /trackers/ {}** ~ returns all active trackers. For security reasons, this does not container the OAUTH tokens used for GitHub access
* **GET /trackers/{{group}}.{{name}} {}** ~ returns a specific tracker by name
* **POST /trackers/**
* **PUT /trackers/{{group}}.{{name}}**
  ```
  {
    id: 'string',
  	token: 'string',
  	repo: 'string',
  	sourcePath: 'string',
  	tag: 'string' ~ optional
  	branch: 'string' ~ optional
  	commit: 'string' ~ optional
  }
  ```

## Enabling

Any of the [deployment patterns](../yaml-definitions/index.md) can be used to enable tracking functionality. The general approach is to start with a vanilla cluster, and enable tracking for each application to be managed by **Cyvive.io**. By sending a POST request. When tracking is enabled **Cyvive.io** will injest the _cyvive.yaml_ file in the GitHub repository and configure accordingly.

## Approach

<!--
(TODO enable pull queues) On first injestion of tracked *cyvive.yaml* application deployment files are generated, and *pull* queues are populated for each deployed namespace such that on next scheduled release (with respect to each namespsace) the newly tracked application will be deployed.

(TODO production specific ConfigMaps)
(TODO trigger que advancement when container ready condition is fullfilled)
!!! note
    Newly tracked applications are still bound by release management and must advance through each *flow* environment type as per specified release timelines i.e. dev -> ha -> preprod -> prod
-->

Once the application has been added to tracker one of several scenarios can occur:

1.  _cyvive.yaml_ in application's GitHub repo is modified.
2.  Application _container_ is updated
3.  New Version of Application _container_ is created

In scenario 1, **Cyvive.io** will que the configuration changes until scenario 2 or 3 occur. This guarantees that updated infrastructure requirements are not applied to non-prepped containers.

In scenario 2 or 3 **Cyvive.io** will add to _dev_ release que.

## Preferred Versioning

Container labels, can be either fixed or follow SemVer standards. Tracking module polls both GitHub & Container Image Repository for changes / updates to images via API hashes (container images are not downloaded)
