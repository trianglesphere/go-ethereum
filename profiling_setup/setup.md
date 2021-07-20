1. Gather the following binaries:
	- geth (instrumented)
	- jaeger-all-in-one
	- jaeger-pg-store
2. Set up a postgres database on the node
	- Will need to configure it to accept a connection from jaeger-pg-store
3. Start up jeager
	- Needs to have the password & run as a user that has the permissions
4. Start up geth
