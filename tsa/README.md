
# Trust Service API

Trust Services API is an open-source software solution for the area of signing/validation, secure policy management and policy execution with the purpose to provide trusted services around decision evaluations and verifications. 

### Product Scope

The Trust Services API offers a suite of services and applications that may be utilized independently as standalone components. These components have the purpose to ensure a consistent level of trust between different participants and elements within a federated secure data infrastructure, like for example [Gaia-X](https://gaia-x.eu/). This Trust Services API is part of the Gaia-X Trust and Identity Management toolstack. The creation and validation of digital signatures are of particular significance in this context. The scope of capabilities includes:

* Signing and verifying data

* Enabling policy-driven trust

* Ensuring trust-chains between participants

* Validating signatures

This encompasses the necessary tools (e.g., Command Line scripts) to operate and maintain the software components in an enterprise environment, focusing on high availability, security, monitoring, and logging based on common standards.
The Trust Services component functions are provided case-dependent as either runtime or library components. Runtime components expose endpoints as REST services. Additionally, policy configuration with GitOps is available to facilitate the provisioning and sharing of policies. 

[Architecture diagram](TrustedServicesV2.png)

[Component diagram](component-diagram.png)

The component diagram displays all available applications within the Trust Services API toolset and their dependencies.


# Services overview

### Policy
The [policy](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy/) service offers a REST API to evaluate and execute OPA policies written in the Rego language. The policy engine includes custom functions for use during policy execution. The service also provides endpoints for exporting and importing policy bundles, subscribing to policy changes, and policy administration (e.g., listing policies, locking/unlocking specific policies).

### Signer 

The [Signer](https://gitlab.eclipse.org/eclipse/xfsc/tsa/signer) service is a powerful application providing a REST API for creating Verifiable Credentials (VC) and Verifiable Presentations (VP) in the [W3C 1.0 credential format.](https://www.w3.org/TR/vc-data-model/) It also offers endpoints for signing arbitrary data, adding cryptographic proofs to existing VC/VPs, and fetching public keys necessary for signature verification. It can be used as a standalone application for signing and verifying. Due to its dependency on Vault/HSM, it can also store VCs.

### Cache

[Cache](https://gitlab.eclipse.org/eclipse/xfsc/tsa/cache/) service exposes HTTP interface for working with Redis.

### InfoHub

[Information Hub](https://gitlab.eclipse.org/eclipse/xfsc/tsa/infohub/) service is responsible for exporting and importing policy data wrapped in Verifiable Credentials and Verifiable Presentations.

### Task

The [Task](https://gitlab.eclipse.org/eclipse/xfsc/tsa/task/) service provides an HTTP interface for executing asynchronous (HTTP) Tasks and Task lists.

Tasks are created by clients making HTTP requests. In order to create a Tasks are created via HTTP requests, and a TaskTemplate must be present in the Storage to create a task. Newly created tasks are added to a Queue, and the current implementation of the [Queue interface](https://gitlab.eclipse.org/eclipse/xfsc/tsa/task/-/blob/main/internal/service/queue.go) uses a persistent database. An executor component retrieves tasks from the Queue for execution. Clients receive an immediate response with the `taskID` and can later query the state of the task and retrieve its result either by querying the Cache service or the task HTTP interface.


## How to build Trust Service API

All Trust Service API applications are developed in Golang. In Go, the process of translating source code into a binary executable is called `building`. Once this executable is built, it will contain not only your application, but also all the support code needed to execute the binary on the target platform. This means that a Go binary does not need system dependencies such as Go tooling to run on a new system. Putting these executables in an executable filepath on your own system will allow you to run the program from anywhere on your system.

**Build instructions**

Each application has specific deployment instructions: 

* [signer](https://gitlab.eclipse.org/eclipse/xfsc/tsa/signer#local-binary)

* [policy](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy#local-binary)

* [cache](https://gitlab.eclipse.org/eclipse/xfsc/tsa/cache#local-binary)

* [infohub](https://gitlab.eclipse.org/eclipse/xfsc/tsa/infohub#local-binary)

* [task](https://gitlab.eclipse.org/eclipse/xfsc/tsa/task#local-binary)


## Local deployment

If you want to get an initial understanding and feeling of the components you may want to start with local deployment. This [repository](https://gitlab.eclipse.org/eclipse/xfsc/tsa/workspace) contains instructions for setting up all Trust Service API services locally, allowing for a playground and local development environment. It uses Docker Compose to bootstrap the services and their dependencies.


## Cloud deployment

Installations of the applications are scripted and templated to ensure automated cloud deployment. All component Helm charts are available under the `deployment` folder in each application/service repository.

**Deployment instructions**

Each application has specific deployment instructions, detailing requirements and dependencies for the services:


* [signer](https://gitlab.eclipse.org/eclipse/xfsc/tsa/signer/-/tree/main/deployment/helm/)

* [policy](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy/-/tree/main/deployment/helm/)

* [cache](https://gitlab.eclipse.org/eclipse/xfsc/tsa/cache/-/tree/main/deployment/helm/)

* [infohub](https://gitlab.eclipse.org/eclipse/xfsc/tsa/infohub/-/tree/main/deployment/helm/)

* [task](https://gitlab.eclipse.org/eclipse/xfsc/tsa/task/-/tree/main/deployment/helm/)

**Notes for production deployment:** Each organization may have its own deployment and security policies, which must be applied to Trust Service API services. But in any case, please consider a load balancer and API gateway in front of the services. Also its strongly recommend to ensure that Vault/HSM is accessible only by the Signer.


## How to use Trust Service API

Each service/application includes a description of the available APIs. Swagger files can be accessed directly from the service README files: 

* [signer](https://gitlab.eclipse.org/eclipse/xfsc/tsa/signer#openapi-documentation)

* [policy](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy#policy-service)

* [cache](https://gitlab.eclipse.org/eclipse/xfsc/tsa/cache#api-documentation)

* [infohub](https://gitlab.eclipse.org/eclipse/xfsc/tsa/infohub#information-hub)

* [task](https://gitlab.eclipse.org/eclipse/xfsc/tsa/task#task-service)


In order to help you to a learn more about the usage of the Trust Service API we created a walkthru with detailed exercises, please have a look at [examples](examples.md)

## Executing tests

A number of tests have been prepared for each TSA service. These tests are useful for understanding the sequence flow. The tests are written in Gherkin style, which is helpful for comprehending the purpose of each feature.
All tests are available [here](https://gitlab.eclipse.org/eclipse/xfsc/tsa/tests/-/tree/main/src/test/resources/features/tsa).

Test scenarios are categorized by different services and include various cases.

1. For `tests` requiring a database, you need to prefill the database with test data.
2. To prefill the database with test data, you may use the example data stored [here](https://gitlab.eclipse.org/eclipse/xfsc/tsa/tests/-/tree/main/test_data/mongo). This data should be imported into your MongoDB instance.

An example of the flow how to create a Verifiable Credential is provided for your [reference](https://gitlab.eclipse.org/eclipse/xfsc/tsa/tests/-/blob/main/src/test/resources/features/tsa/signer/v1/credential/proof/POST.feature#L12).


**Instructions for Executing Gherkin tests**

Detailed instructions for test execution are available [here](https://gitlab.eclipse.org/eclipse/xfsc/tsa/tests#setup)


## Monitoring and Logging 

### Monitoring

For infrastructure monitoring, you may use any of the existing monitoring tools. Common tools for infrastructure monitoring include Nagios, Zabbix, Prometheus, Datadog etc., each offering various features tailored to different monitoring needs.

An available endpoint for each service `/liveness`, can be used as an indicator of service health and readiness.


### Logging

Trust Service API may work with varios logging frameworks, such as graylog, fluentD or logstash to support logging and analysis by enterprise infrastructures. 
The supported frameworks/tools may be chosen based on the internal company rules and security policies.

Each application has detailed logging instructions:


* [signer](https://gitlab.eclipse.org/eclipse/xfsc/tsa/signer#logging)

* [policy](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy#logging)

* [cache](https://gitlab.eclipse.org/eclipse/xfsc/tsa/cache#logging)

* [infohub](https://gitlab.eclipse.org/eclipse/xfsc/tsa/infohub#logging)

* [task](https://gitlab.eclipse.org/eclipse/xfsc/tsa/task#logging)
