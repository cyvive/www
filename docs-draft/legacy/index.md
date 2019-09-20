# Overview

!!! warning
    This functionality was originally offered by the parent company as a separate product **Fathomable**. It is undergoing consolidation into **Cyvive**'s core and is restricted to _beta_ customers at this time. Please contact your account manager via live-chat should you wish to participate.

!!! summary
		Understanding how **Cyvive.io**'s exposed (behind a security layer) API's operate and expected results when interacting with them.

## Resoning

Security and the ability to easily integrate with the existing enterprise technology stack is paramount to success for long-term adoption of any product. As **Cyvive.io** is dircetly interacting with the underlying container orchestration plaform, its essential that **Cyvive.io**'s security levels are as strong as what would be used in the cluster or higher.

All REST API's are protected by [MultiFactorAuthentication](../architecture/authentication.md)

This section provides detailed information on each of the available REST API's, their requirements, returned values and expected results of what will occur in the cluster.
