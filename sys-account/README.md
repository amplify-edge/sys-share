# Directory Structure

```
├ sys-account
├── Makefile
├── README.md
├── bin-all
│   ├── cli
│   └── client
├── example
│   ├── cli
│   │   └── go
│   ├── client
│   │   └── flu
│   └── server
│       └── go
├── generate.go
├── proto
│   └── v2
└── service
    ├── flu
    └── go
```

## Notes

1. generate.go contains protobuf generation and service builds.
2. Makefile / Magefile / etc contains the recipe of how to build the examples.
3. `bin-all` contains binary builds from the `example` directory.
4. `example` directory contains all the example using protobuf services from `service` directory for their specific kind.
5. `proto` contains the protobuf schema definition, versioned.
6. `service` contains generated protobuf and grpc services, as well as proxy / business logic model separated from the protobuf generated model


### Services Directory Layout

#### Flutter

```
flu/lib
├── pkg
│   ├── pkg.dart
│   ├── routes
│   ├── shared_repositories
│   └── shared_services
├── rpc
│   └── v2
├── sys_share_sys_account_service.dart
└── view
    ├── screens
    ├── view.dart
    └── widgets
```

- `pkg`  contains business logic for: repository and services as well as routes.
- `rpc` contains generated protobuf schema and services.
- `view` contains all the view layer of this service (widgets, screens).

#### Go

```
go
├── pkg
│   ├── account_models.go
│   ├── auth_model.go
│   ├── helper.go
│   ├── service_proxy.go
│   └── sys_account_proxy.go
└── rpc
    └── v2
```

- `rpc` contains generated protobuf schema and services.
- `pkg` contains business logic, i.e. business logic model and its convenient functions, service proxy, etc.
