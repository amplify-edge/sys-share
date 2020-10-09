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
