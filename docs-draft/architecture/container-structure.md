# Container structure

!!! summary
		File locations & structure for injections

**Cyvive.io** is an enterprise ready product, as such its a single binary file that reads configuration information for API access and backend discovery from the following directories:

* **/default** ~ templates to load for initial creation & population of database… ignored after database has been created
* **/deploy** ~ database(s) are stored in the backend and auto-pushed into this directory. _due limitations of backends running ETCD maximum database size is 1 MB per file_
* **/generated** ~ contains all generated deployment files that **Cyvive.io** generates. Base directory contains the databases
* **/generated/templates/cluster** ~ _(master only)_ cluster level deployment files used for mandatory support services auto deployed and managed in the cluster
* **/generated/templates/namespaces** ~ all _flow_ namespaces are auto-generated with all applications, full generation is performed to provide the cluster administrator the option of dry-run genertaing deployment information for manual modification & deployment using unmanged tools. (_in reality extracing these files is only done for testing purposes by cluster administrators, but is a frequently requested feature_)

## Essential Files

_Cyvive.io_ uses 3 files to manage state and configuration:

* `*.app.yaml`: application configuration files
* `*.namespace.yaml`: namespace configuration files
* `*.tracker.yaml`: connection information for github & container repositories

_Cyvive.io_ will scan for the global `app.yaml` and any files ending in `.app.yaml` as part of its initialization process.

There is a default `namespace.yaml` included in _Cyvive.io_ that suits most organisational needs.

Its not necessary to provide `app.yaml` or `tracker.yaml` files for _Cyvive.io_ deployment.
