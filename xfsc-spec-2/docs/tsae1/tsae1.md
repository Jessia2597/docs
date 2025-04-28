## Software Requirements Specification for Gaia-X Federation Services Trust Services API Extension 1 IDM.TSA.E1


Published by

eco -- Association of the Internet Industry (eco -- Verband der Internetwirtschaft e.V.) Lichtstrasse 43h 50825 Cologne, Germany

Copyright 

© 2023 eco -- Association of the Internet Industry
This work is licensed under the Creative Commons attribution 4.0nInternational License. To view a copy of this license, visit <http://creativecommons.org/licenses/by/4.0/> or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA

![](./media/image1.png)


#### 1  [Introduction ](#introduction)

>##### 1.1  [Document Purpose ](#document-purpose)

>##### 1.2  [Product Scope ](#product-scope)

>##### 1.3  [Definitions, Acronyms and Abbreviations](#definitions-acronyms-and-abbreviations)

>##### 1.4  [References ](#references)

>##### 1.5  [Document Overview ](#document-overview)

#### 2  [Product Overview ](#product-overview)

>##### 2.1  [Product Perspective ](#product-perspective)

>##### 2.2  [Product Functions ](#product-functions)

>##### 2.3  [Product Constraints ](#product-constraints)

>##### 2.4  [User Classes and Characteristics](#user-classes-and-characteristics)

>##### 2.5  [Operating Environment ](#operating-environment)

>##### 2.6  [User Documentation ](#user-documentation)

>##### 2.7  [Assumptions and Dependencies ](#assumptions-and-dependencies)

>##### 2.8  [Apportioning of Requirements](#apportioning-of-requirements)

#### 3  [Requirements ](#requirements)

>##### 3.1  [External Interfaces ](#external-interfaces)

>>###### 3.1.1  [User Interfaces ](#user-interfaces)

>>###### 3.1.2  [Hardware Interfaces ](#hardware-interfaces)

>>###### 3.1.3  [Software Interfaces ](#software-interfaces)

>>###### 3.1.4  [Communications Interfaces ](#communications-interfaces)

>##### 3.2  [Functional ](#functional)

>>###### 3.2.1  [Policy Management Module ](#policy-management-module)

>>###### 3.2.2  [Policy Decision Engine ](#policy-decision-engine)

>>###### 3.2.3  [Task Controller ](#task-controller)

>>###### 3.2.4  [JSON-LD signatures and validations](#json-ld-signatures-and-validations)

>>###### 3.2.5  [Distributable Cache ](#distributable-cache)

>>###### 3.2.6  [eIDAS ](#eidas)

>>###### 3.2.7  [General ](#general)

>##### 3.3  [Other Nonfunctional Requirements ](#other-nonfunctional-requirements)

>>###### 3.3.1  [HTTP Requirements ](#http-requirements)

>>###### 3.3.2  [Logging Requirements ](#logging-requirements)

>>###### 3.3.3  [Performance Requirements ](#performance-requirements)

>>###### 3.3.4  [Safety Requirements ](#safety-requirements)

>>###### 3.3.5  [Security Requirements ](#security-requirements)

>>###### 3.3.6  [Software Quality Attributes](#software-quality-attributes)

>>###### 3.3.7  [Business Rules ](#business-rules)

>##### 3.4  [Compliance ](#compliance)

>##### 3.5  [Design and Implementation ](#design-and-implementation)

>>###### 3.5.1  [Installation ](#installation)

>>###### 3.5.2  [Distribution ](#distribution)

>>###### 3.5.3  [Service Meshing ](#service-meshing)

>>###### 3.5.4  [Standard Technology ](#standard-technology)

>>###### 3.5.5  [Metrics ](#metrics)

>>###### 3.5.6  [Configurability ](#configurability)

>>###### 3.5.7  [Maintainability ](#maintainability)

>>###### 3.5.8  [Reusability ](#reusability)

>>###### 3.5.9  [Runtime Stability ](#runtime-stability)

>>###### 3.5.10 [High Availability Concepts ](#high-availability-concepts)

#### 4  [System Features ](#system-features)

>##### 4.1  [Policy Management ](#policy-management)

>>###### 4.1.1  [Description ](#description)

>>###### 4.1.2  [Functional Requirements ](#functional-requirements)

>##### 4.2  [Policy Evaluation ](#policy-evaluation)

>>###### 4.2.1  [Description ](#description-policy-evaluation)

>>###### 4.2.2  [Functional Requirements ](#functional-requirements-policy-evaluation)

>##### 4.3  [Task Controller ](#task-controller-system-features)

>>###### 4.3.1  [Description ](#description-task-controller)

>>###### 4.3.2  [Functional Requirements ](#functional-requirements-task-controller)

>##### 4.4  [JSON-LD Signing and verification ](#json-ld-signing-and-verification)

>>###### 4.4.1  [Description ](#description-json-ld-signing-and-verification)

>>###### 4.4.2  [Functional Requirements ](#functional-requirements-json-ld-signing-and-verification)

>##### 4.5  [Trusted Caching ](#trusted-caching)

>>###### 4.5.1  [Description ](#description-trusted-caching)

>>###### 4.5.2  [Functional Requirements ](#functional-requirements-trusted-caching)

>##### 4.6  [eIDAS Compliant Signatures ](#eidas-compliant-signatures)

>>###### 4.6.1  [Description ](#description-eidas-compliant-signatures)

>>###### 4.6.2  [Functional Requirements ](#functional-requirements-eidas-compliant-signatures)

#### 5  [Verification ](#verification)

>##### 5.1  [Core Verification Requirements ](#core-verification-requirements)

>##### 5.2  [Acceptance Criteria ](#acceptance-criteria)

>>###### 5.2.1  [Policy Management Module ](#policy-management-module-verification)

>>###### 5.2.2  [Policy Decision Engine ](#policy-decision-engine-verification)

>>###### 5.2.3  [Task Controller ](#task-controller-verification)

>>###### 5.2.4  [JSON-LD signatures and validations](#json-ld-signatures-and-validations-verification)

>>###### 5.2.5  [Distributable Cache ](#distributable-cache-verification)

>>###### 5.2.6  [eIDAS ](#eidas-verification)

>##### 5.3  [Support for Kubernetes ](#support-for-kubernetes)

[Appendix A: Glossary ](#appendix-a-glossary)

[Appendix B: Architecture ](#appendix-b-architecture)

# List of Figures 

> Figure 1: Architecture (semi-transparent boxes are out of scope) 

# List of Tables 

> Table 1: References 
>
> Table 2: Apportioning of Requirements 
>
> Table 3: Technology Stack 
>
> Table 4: Functional Requirements Policy Management 
>
> Table 5: Functional Requirements Policy Evaluation 
>
> Table 6: Functional Requirements Task Controller 
>
> Table 7: Functional Requirements JSON-LD Signing and Verification 
>
> Table 8: Functional Requirements Trusted Caching 
>
> Table 9: Functional Requirements eIDAS Compliant Signatures


# Introduction

> To get general information regarding Gaia-X and the Gaia-X Federation Services please refer to \[TAD\] []{#1.1_Document_Purpose .anchor}and \[PRD\].

## Document Purpose

> The purpose of the document is to specify the requirements of the Identity Management and Trust Subcomponent "Trust Services API Extension 1" with the intention of a European wide public tender for implementing this software. Main audience for this document is attendees of the public tender, which are able to supply an open-source software solution for the area of Signing/Validation, Secure Policy Management and Policy Execution with the purpose to provide trusted services around Decision Evaluations and Verifications.

## Product Scope

> The product scope covers the functionalities of the Trust Services API. The aim of the Trust Services API Extension 1 is to ensure a consistent level of trust between Gaia-X participants and components. The Trust Services API can be used by all components. The creation and validation of digital signatures plays a particularly important role here. The product scope includes signing and verifying of necessary data, enabling policy driven trust, ensuring trust-chains between participants and validating eIDAS compliant signatures.
>
>
>The scope also includes necessary tools (e.g., Command Line Scripts) to operate and maintain the created software components in an enterprise environment with focus on high-availability, security and monitoring and logging based on common standards. Documentation for developer, operator and user MUST be written in markdown format which is publicly consumable over a publicly accessible source repository without access limitations.

------
>
> ![](./media/image2.png)
> If it's required to do code restructurings, modifying the current solution by adding new microservices etc. then this is explicitly allowed.
>
> Please note, that it is explicitly required to deliver the software up and running. Responsibility for existing code cannot be shifted to previous development teams.

------

## Definitions, Acronyms and Abbreviations

> The Trust Architecture Overview Document \[IDM.AO\] MUST be considered and applied as the core technical concept that includes also the Terminology and Glossary.
>
> All requirements from other documents are referenced by \[IDM.\<document-id\>.XXXXX\] as defined in chapter 1 "Methodology" in the document \[IDM.AO\].

## References

|                           | Description                                             | Status      |
|---------------------------|---------------------------------------------------------|------------|
| **Specflow (n.D.), BDD** | [Specflow BDD](https://specflow.org/bdd/)             | 07-04-2023 |
| **Cloud Events**         | [CloudEvents](https://cloudevents.io/)                | 07-04-2023 |
| **D:EBSI**               | [EBSI DID Method](https://ec.europa.eu/digital-building-blocks/wikis/display/EBSIDOC/EBSI%2BDID%2BMethod) | 07-04-2023 |
| **IDM.AO**               | [Gaia-X WP1 (2021), Architecture Overview](Link)      |            |
| **IDM.TRAIN**            | [Gaia-X Federation Services - Trust Management Infrastructure](Link) |        |
| **JSON-LD**              | [JSON-LD 1.1](https://w3c.github.io/json-ld-syntax/)   | 07-04-2023 |
| **LD Proofs**            | [Linked Data Proofs 1.0](https://w3c-ccg.github.io/ld-proofs/) | 07-04-2023 |
| **PRD**                  | [Gaia-X Policy Rules Document](Link)                   | 08-14-2023 |
| **Rego**                 | [Rego Policy Language](https://www.openpolicyagent.org/docs/latest/policy-language/) | 07-04-2023 |
| **RFC 2119**             | [RFC 2119](https://tools.ietf.org/html/rfc2119)       | 07-04-2023 |
| **RFC 5789**             | [PATCH Method for HTTP](https://datatracker.ietf.org/doc/html/rfc5789) | 07-04-2023 |
| **RFC 7231**             | [HTTP/1.1: Semantics and Content](https://tools.ietf.org/html/rfc7231) | 07-04-2023 |
| **RFC 7807**             | [Problem Details for HTTP APIs](https://datatracker.ietf.org/doc/html/rfc7807) | 07-04-2023 |
| **TAD**                  | [Gaia-X Architecture Document](https://docs.gaia-x.eu/technical-committee/architecture-document/22.10/federation_service/) | 08-14-2023 |
| **TDR**                  | Gaia-X Federation Services Technical Development Requirements |
| **TSA**                  | Gaia-X, European Association for Data and Cloud, AISBL (2021): Gaia-X Trusted Services API Document |
| **TSA.GITLAB**           |  [Gitlab tickets for the GAIA-X Trust Services API](https://gitlab.eclipse.org/groups/eclipse/xfsc/tsa/-/issues) |


> Table 1: References

## Document Overview

> The document describes the product perspective, functions and constraints. It furthermore lists the functional and non-functional requirements and defines the system features in detail. The listed requirements are binding. Requirements as an expression of normative specifications are identified by a unique ID in square brackets (e.g. **\[IDM.ID.Number\]**) and the keywords MUST, MUST NOT, SHOULD, SHOULD NOT, MAY, corresponding to RFC 2119 \[RFC 2119\], are written in capital letters (see also \[IDM.AO\] - Methodology).

# Product Overview

## Product Perspective

>Please refer to \[TDR\] and \[TSA\]*.*

------
>
> ![](./media/image2.png)
>
> The existing code base [1] MUST be reused and further improved. Other microservices MAY have different languages and architectures.

###### [1] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/tsa]</u>](https://gitlab.eclipse.org/eclipse/xfsc/tsa)
------

## Product Functions

> The functions of the Trust Services component are provided
 case-dependent either as runtime or library components. Runtime components MUST expose endpoints as REST services. In addition, policy configuration with GitOps should be used to enable the provisioning and sharing of policies. The component is part of the Gaia-X Trust and identity management toolstack and not centrally hosted. To properly maintain and update, appropriate security measures MUST be in place. This includes role concepts, data storage protection and access control. The overall functionality of the product MUST be auditable (GDPR compliant).
>

> ![](./media/image3.png)
>
> Figure 1: Architecture (semi-transparent boxes are out of scope)

## Product Constraints

> Please refer to \[TSA\] Section 2.3 and \[TDR\]*.*

## User Classes and Characteristics

> Please refer to \[TSA\] 2.4 and \[TDR\]*.*

## Operating Environment

> Please refer to \[TSA\] 2.5 and \[TDR\] for further binding requirements regarding the operating environment.

#####   \[IDM.TSA.E1.00000\] Kubernetes Environment 

> The product MUST be operable on standard Kubernetes based environments without any hardware restrictions. The reference environment for demonstration and development purposes MUST be on the provided SCS cluster (Sovereign Cloud Stack), which will be provided by the Client.
>  

## User Documentation

> Please refer to \[TDR\] for further requirements regarding documentation.

#####   \[IDM.TSA.E1.00001\] Participant Administration Documentation 

> The documentation MUST contain:

-   Installation Manuals

-   Cryptographic Initialization (if applicable)

-   Description of Deployment/Compile Process

-   Description of the Automatic Tests / Verification

-   How to build the products from source code  

#####   \[IDM.TSA.E1.00002\] Participant Documentation 

> The documentation MUST contain:

-   Short Software Description (why and for what, when to use, how use, where to use)

-   Usage guide

-   GDPR design decisions

-   Security concept

-   Operations concept

-   FAQ

-   Keyword Directory  

## Assumptions and Dependencies

> An understanding of the overall Gaia-X architecture and philosophy is necessary. Please refer to \[TAD\] und \[PDR\].
>
> Attendees of the public tender MUST assume responsibility of:

-   All tickets in GitLab ( \[TSA.GITLAB\] ) with label "Specification"

-   The existing code and improvements upon the existing code

-   Extending or contributing to the used frameworks in order to provision a way in which realization of the requirements can be achieved

-   Updating dependencies to the latest stable version

## Apportioning of Requirements

  | **Feature**                   | **Priority** |
| ----------------------------- | ----------- |
| Policy Management             | 1           |
| Policy Evaluation             | 1           |
| Task Coordination             | 1           |

| **Feature**                   | **Priority** |
| ----------------------------- | ----------- |
| JSON-LD Verification          | 1           |
| JSON-LD Signing               | 1           |
| Trusted Caching               | 1           |
| eIDAS compliant Signatures    | 2           |


> Table 2: Apportioning of Requirements

# Requirements

> Further binding requirements can be found in \[TDR\].

## External Interfaces

### User Interfaces

> Please refer to \[TSA\] 3.1.1.

### Hardware Interfaces

> Please refer to \[TSA\] 3.1.2.

### Software Interfaces

> Please refer to \[TSA\] 3.1.3.

### Communications Interfaces

> Please refer to \[TSA\] 3.1.4.

#####   \[IDM.TSA.E1.00003\] Eventing 

> If it is required to use events within the software architecture, it is mandatory to use software abstraction according to cloud event specification \[CloudEvents\] for publishing and subscription. The minimal supported protocol binding MUST be HTTP Protocol Binding [2].

###### [2] [<u>[https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/bindings/http-protocol-binding.md]</u>](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/bindings/http-protocol-binding.md)

#####   \[IDM.TSA.E1.00004\] Eventing Infrastructure 

> The event broker for the eventing MUST abstract the storage and delivery infrastructure. In Kubernetes environments, the broker MUST be uniform across all Lots. (e.g., kNative)  
>

## Functional

### Policy Management Module

#####   \[IDM.TSA.E1.00005\] Policy Bundles 

> Policy bundles MUST contain further information, e.g., data input JSON files. They MUST contain meta-data and references like resolvable DIDs to be verifiable and trustworthy. The bundle MUST be signed in a productive state or before the export. It MAY be chosen, how the signing and verification is standardized. For instance, the metadata can be signed for the included files of the bundle, or the bundle itself can be signed as a compressed package e.g., Zip packed in a CMS to exchange later on policy bundles.

#####   \[IDM.TSA.E1.00006\] Policy Import and Export 

> The policy administrator MUST be able to configure policy import endpoints where the system automatically downloads new policy bundles. The policy export endpoint itself MUST be configurable in that way, so that the policy administrator can decide which bundles from the productive repository can be exported. Each import and export MUST be signed with a key registered in the DID document and verifiable against the public keys from the DID document defined in the bundle. For this purpose, the DID resolver MUST be used. Import and export MUST be observable for the configured repositories.

#####   \[IDM.TSA.E1.00007\] Policy Changes Notification 

> The system MUST be able to notify other components when policy source code or data has changed. Notifications may be passed to message queue, smart contract or use other notification mechanisms which are suitable in the context of the technology stack. Notifications might be granular and explicitly contain information about what has changed.

#####   \[IDM.TSA.E1.00008\] Webhooks for policy changes 

> The product MUST allow other components to subscribe for policy changes via webhooks. Clients MUST be able to give a URL and the product MUST send the relevant payload once there are policy changes.

#####   \[IDM.TSA.E1.00009\] JSON Schema Validation for Policy Output 

> Optional policy configuration files may specify mandatory JSON schemas which must be part of the JSON output from a policy evaluation. The validation must check whether the schemas are present and must validate the JSON document with Strict validation. To execute the validation procedure, a new HTTP URL can be automatically generated.
>
> Example:
>
> Evaluation URL pattern: /{repo}/policies/{group}/{policyname}/{version}/evaluation Validation
> URL pattern: /{repo}/policies/{group}/{policyname}/{version}/validation
>
> If the validation fails, the policy service might LOCK the policy for execution and log an error/warning in the logs.

#####   \[IDM.TSA.E1.00010\] Fine granular policy management 

> The system SHOULD allow managing policies in separate GIT repositories. This will allow separate GIT Workflows for different system contexts. Synchronization mechanisms SHOULD be separate for different GIT repositories. A new URL path parameter SHOULD be introduced in order to achieve context separation upon policy evaluation.
>
> Example:
>
> Current evaluation URL:
>
>>> ../policy/**{group}**/**{name}**/**{version}**/evaluation Evaluation
> URL with GIT Repository separation:
>
>>> ../policy/**{repository}**/**{group}**/**{name}**/**{version}**/evaluation

#####   \[IDM.TSA.E1.00011\] Interface for Export Configuration 

> The policy administration module MUST be able to define new export configurations for each policy. The system MUST have an automated export configuration update flow, that will always take the main branch of the configurations and publish them, making them available for execution.
>
> *Interface*
>
> GitOps
>
> *Input*
>
> Export configurations
>
> *Output*
>
> Updated Export Configurations are available for execution

#####   \[IDM.TSA.E1.00012\] Policy Admin API 

> The policy service may provide an HTTP API to inspect the current policy service state. For example, get a list of all unlocked/locked policies, return a specific policy source code or some policy meta information like last update timestamp. This could be useful while debugging the service or for building a UI dashboard for administrators. For example, the sync from Git to Policy Database could fail unexpectedly or even complete without errors, but there could be a bug where policy source code in the database is different from policy source code in the Gilt repo. Debugging such issues would be extremely difficult without having the ability to look at the current Policy service state/data, because just looking at the external Git policy repo will not be helpful to discover some discrepancies.
>
> The API could start with the following functionalities but could be further expanded as necessary.

-   Retrieve all/some policies from the Policy DB. Optionally specify which fields should be returned - e.g., source code, static data, meta fields, etc.

-   Retrieve policy lock/unlock state

-   Retrieve static data/configurations for a given policy

### Policy Decision Engine

#####   \[IDM.TSA.E1.00013\] Call of external URLs 

> The decision engine MUST have the capability to call HTTP URLs with free chosen query parameters, headers, and request bodies for any HTTP verb within the policy execution. This MUST be possible out of the defined policy to load external data dynamically into the execution context. It MAY be created also helper components e.g., built in functions, to support this feature outside of the policy policy execution context.
>
> *Constraints* Policy Language Policy Execution
>
> *Input*
>
> HTTP URL with Parameters, Header and Request Body.
>
> *Output*
>
> JSON HTTP Response.

#####   \[IDM.TSA.E1.00014\] Storage Extension Functions 

> The decision engine MUST have the capability to work with database storage, that a policy can persist and pick up data during execution. This MUST be achieved with REGO extension functions. The functions MUST have the ability to create, update and delete data from a predefined database table/collection during policy evaluations.
>
> *Constraints*
>
> Rego Policy Language \[Rego\]

#####   \[IDM.TSA.E1.00015\] Storage Implementation 

> The storage layer for policy storage MUST be implemented in a way that no specific database technology is strictly required for the purpose of policy execution. The implementation MUST support the following levels:

1.  Policy Service uses internal storage for cloning the policy repositories. This level supports not just in time sync, but a very quick usage of simple, not often changed policies. Policy change requires container restart. This can be realized by a script during container startup (if configured)

2.  The policy service uses an external storage to pick up the policies. E.g., from a postgres db, a mongodb or similar. The external storage provides events when a policy has changed, or a sync happens

> Both levels MUST be configurable and adaptable by an internal interface e.g., IPolicyStorage to allow additional implementations in the future for internal and external storage implementations.

#####   \[IDM.TSA.E1.00016\] TRAIN validation & verification 

> The TRAIN validation service (\[IDM.TRAIN.00017\], \[IDM.TRAIN\] p. 12) needs to be included in the process of verifying a verifiable presentation. If a requestor is showing a verifiable presentation during a task which needs to be fulfilled the notarization service needs to validate the terms Of Use by calling the TRAIN validation module. This will verify if the shown verifiable presentation and its respective owner is on a trustlist.
>
> *Constraints*
>
> DID of the organization. Database system.
>
> *Interfaces*
>
> TRAIN validation module
>
> *Input*
>
> A verification with an incoming verifiable presentation
>
> *Output*
>
> Verification output of the TRAIN validation module

### Task Controller

#####   \[IDM.TSA.E1.00017\] Cache Event Subscription 

> If a data update event occurs from the distributable cache, the task controller MUST execute a policy which evaluates whether any further tasks must be created. If any task is configured, the tasks MUST be created for execution. The task has the same metadata as the event (key, namespace and scope)
>
> For instance: A proof data object is inserted from the OCM into the cache. This object contains a DID from the issuer. The policy evaluates the schema of the data object and returns Task "IssuerProof". The task controller inserts this task to the tasklist by adding the http URL of the OCM proof manager with the DID of the issuer as parameter. Some seconds later, the proof from the issuer arrives and the policy returns null (nothing to do).
>
> *Constraints*
>
> Distributable Cache Event Policy Evaluation
>
> *Input*
>
> An Insert/Update Event
>
> *Output*
>
> A task result or null.

#####   \[IDM.TSA.E1.00018\] Task Queue and Storage Abstraction Layer 

> An abstraction layer MUST be implemented for the Queue and the Storage interfaces in the task controller. The Abstraction layer MUST be agnostic of the underlying implementation.

### JSON-LD signatures and validations

#####   \[IDM.TSA.E1.00019\] Proof Chains in JSON-LD 

> JSON-LD proof chains \[LD.Proofs\] SHOULD be supported to link multiple entities to the same data, when proof sequences are required. This can be useful for notary counter-signing a proof that had been created on a document. It MUST support signing and verifying the VCs.

Example:

                {

                > \"@context\": \[
                > \"https://[www.w3.org/2018/credentials/v1\"](http://www.w3.org/2018/credentials/v1),
                > \"https://[www.w3.org/2018/credentials/examples/v1\"](http://www.w3.org/2018/credentials/examples/v1)
                >
                > \],
                >
                > \"title\": \"Hello World!\",
                >
                > \"proofChain\": \[{
                >
                > \"type\": \"Ed25519Signature2018\", \"proofPurpose\":
                > \"assertionMethod\", \"created\": \"2019-08-23T20:21:34Z\",
                >
                > \"verificationMethod\": \"did:example:123456#key1\", \"domain\":
                > \"example.org\",
                >
                > \"jws\": \"eyJ0eXAiOiJK\...gFWFOEjXk\"
                >
                > },
                >
                > {
                >
                > \"type\": \"RsaSignature2018\", \"proofPurpose\": \"assertionMethod\",
                > \"created\": \"2017-09-23T20:21:34Z\",
                >
                > \"verificationMethod\": \"https://example.com/i/pat/keys/5\",
                > \"domain\": \"example.org\",
                >
                > \"jws\": \"eyJ0eXAiOiJK\...gFWFOEjXk\"
                >
                > }\]
                >
                > }

### Distributable Cache

#####   \[IDM.TSA.E1.00020\] Content Access 

> The cached content MUST be accessible over a key (e.g., a DID), a namespace and an array of scopes, which results in an array of JSON documents. For instance, the access to the cache can be the following:
>
> Key: DID:sov:2358585
>
> Namespace: Login
>
> Scopes: administration, read, visitor
>
> Result: {"name":"userX","iss":did:sov:33333},
>
> {"membership":"company","iss":did:sov:1111}
>
> To optimize the access, it MAY be optimized by flatten the access pattern like: Key: DID:sov:2358585
>
> Namespace: Login:administration
>
> Independent from the format, the result for the accessor MUST be a flatten JSON structure. In the flattening step, it SHOULD namespace duplicated claims if they are semantically different (e.g., using JSON-LD context \[JSON.LD\]). If two JSON structures bring a duplicated claim which is semantically the same claim (say two JSON structures bring Name and Surname, but the values are different) then a policy shall decide whether to: take one of them or discard all of them.
>
> *Constraints*
>
> Supported data format of the cache technology Policy Decision Engine

### eIDAS

#####   \[IDM.TSA.E1.00021\] eIDAS compliant Signature Creation / Validation 

> Signatures must be generated/verified in compliance with eIDAS so that legally secure trust can be achieved. This should include the eIDAS signature types basic, advanced, and qualified. The implementation variant must be selected individually in coordination with the used technology.

#####   \[IDM.TSA.E1.00022\] Support for DID:EBSI encoding for Natural Persons 

> Support public key encoding in DID document for Natural Persons according to the EBSI DID Method specification \[DID:EBSI\].
>
> *Constraints*
>
> EBSI DID Method \[DID:EBSI\].

### General

#####   \[IDM.TSA.E1.00023\] Architecture Restructuring 

> The architecture of the existing TSA MUST be changed in this way, so that the software can be deployed feature by feature without the need to deploy for each feature every subcomponent like databases etc. In summary, all dependencies MUST be organized like this, that the deployment is more independent and operational cost friendly. The following changes MUST be provided:

-   The plain policy execution MUST be able to work without the mongoDB (e.g., by using git clone on container startup) Usage of MongoDB MUST be just optional by configuration

-   If the user wants to dynamically configure the policies, the policy execution MUST require mongoDB

-   The task controller feature MUST be shipped with a generic message queue interface to support usage of different queues (currently mongodb is the queue, other queues must not be provided)

-   The signing service MUST be more generic to support different signing engines

-   The policy execution MUST be aware of existing features and MUST reply during the policy execution the non-existence of the feature e.g., "Signing Service not available or this function requires the usage of MongoDB"

> There may be other required changes during the architecture change, which MUST be highlighted to the technical lead and planned in the cost calculation during the analysis.
>
> Overall goal of this requirement is to allow the users to reduce the costs of their operational environment. Means if a user decides to use just the policy execution, an operational setup for instance of mongoDB and redis MUST be not required to operate it 24/7.
>
>  

## Other Nonfunctional Requirements

#####   \[IDM.TSA.E1.00024\] Architecture Changes 

> All Architecture Changes MUST be aligned with the Principal before implementation.  

### HTTP Requirements

#####   \[IDM.TSA.E1.00025\] HTTPS 

> All HTTP Endpoints MUST be protected by TLS 1.2 (all protocol version numbers SHOULD be superseded by upcoming standards) Each endpoint of the product MUST support TLS certificates which are configurable by the administrator of the system.  

#####   \[IDM.TSA.E1.00026\] HTTP Protocol Definitions 

> All HTTP Endpoints MUST follow
> [\[RFC7231\]](https://tools.ietf.org/html/rfc7231) and
> [\[RFC5789\],](https://tools.ietf.org/html/rfc5789) but it MAY be chosen what of the protocols is necessary to realize the functionality. For problem reports the [\[RFC7807\]](https://tools.ietf.org/html/rfc7807) MUST be used in combination with Standard HTTP Error Codes. 

### Logging Requirements

#####   \[IDM.TSA.E1.00027\] Data Minimization 

> The data minimization principle is expressed in Article 5(1)(c) of the GDPR and Article 4(1)(c) of Regulation (EU) 2018/1725, which provide that personal data must be \"adequate, relevant and limited to what is necessary in relation to the purposes for which they are processed\". The data shall be stored for a period of time in accordance with national requirements and, as a minimum, shall consist of the following elements:

>>(a) node\'s identification

>>(b) message identification

>>(c) message data and time

> All logged data/information MUST be documented in the GDPR design decisions for a GDPR review.  

#####   \[IDM.TSA.E1.00028\] Logging Frameworks 

> The product MUST support logging frameworks e.g., graylog, fluentD or logstash to support logging and analysis by enterprise infrastructures. The supported framework MAY be chosen for the first version, but it MUST support potentially the most common open-source logging solutions. The final solution MUST be aligned with the other subcomponents. It MUST be sketched in the operations concept how the support of multiple solutions is given in the future.
>
>  

### Performance Requirements

#####   \[IDM.TSA.E1.00029\] Up/Down Scale 

> All components MUST be able to scale up/down their functionality for undefined amount instances. This requires a parallel execution possibility which will be tested later on by performance tests which are defined by the test team.  

### Safety Requirements

#####   \[IDM.TSA.E1.00030\] Major Releases 

> All used software components MUST use the major releases with Long Term Support. If no LTS is available, all components MUST use the latest major releases with security hardening.  

### Security Requirements

#####   \[IDM.TSA.E1.00031\] CVE Patches 

> All software components MUST have applied CVE patches, which are available for major releases.  

### Software Quality Attributes

#####   \[IDM.TSA.E1.00032\] Software Quality Requirements 

> All software components MUST be compliant to the requirements within the quality assurance repository [3]. This includes testing on different layers (unit, component, integration), branch model that support stages, patch management, and code quality verification with adequate reporting. In addition, all requirements and quality attributes MUST demonstrated by automated behavior driven testing \[BDD\] methodology. 

###### [3] [<u>[https://gitlab.com/gaia-x/data-infrastructure-federation-services/quality-assurance/-/issues]</u>](https://gitlab.com/gaia-x/data-infrastructure-federation-services/quality-assurance/-/issues)

### Business Rules

#####   \[IDM.TSA.E1.00033\] Software Consistency 

> The used technologies MUST have consistency. Standard technologies e.g., Databases MUST be abstracted over JDBC, authentication over OIDC etc.  

#####   \[IDM.TSA.E1.00034\] Cherry Picking 

> All components and the entire software architecture MUST be checked for the necessity for deployment of each single feature, to allow an enterprise deployment customization.  

## Compliance

#####   \[IDM.TSA.E1.00035\] GDPR Audit Logging 

> All GDPR relevant access to personal relevant data MUST be logged for a later audit.  

#####   \[IDM.TSA.E1.00036\] GDPR Data Processing 

> Is it necessary to process person-relevant data, it MUST be earmarked to a clearly defined business process, which has to be described in the GDPR design decisions. All relevant data MUST be deleted after the processing, if applicable.  

## Design and Implementation

### Installation

#####   \[IDM.TSA.E1.00037\] Helm/Argo CD Deployment 


> All installations MUST be scripted/templated to ensure automated deployment. This MUST be ensured over HELM templates which MUST follow uniform rules across all lots. The charts MUST be integrable in a ARGO CD Pipeline defined in the gxfs-integration repository [4].  

###### [4] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/integration]</u>](https://gitlab.eclipse.org/eclipse/xfsc/integration)

### Distribution

#####   \[IDM.TSA.E1.00038\] Helm Repositories 

> All component helm charts MUST be available under a helm repository hosted in the GitLab, with different channels for distribution [5].

###### [5] [<u>[https://gitlab.com/api/v4/projects/41175300/packages/helm/Integration/index.yaml]</u>](https://gitlab.com/api/v4/projects/41175300/packages/helm/Integration/index.yaml)

#####   \[IDM.TSA.E1.00039\] Istio Resources 

> Additionally, the Charts MUST provide Istio Resource (e.g., Authorization Rules, Virtual Services etc. ) following the integration pattern specified in the gxfs-integration repo[6].  

###### [6] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/integration]</u>](https://gitlab.eclipse.org/eclipse/xfsc/integration)

### Service Meshing

#####   \[IDM.TSA.E1.00040\] Istio Support 

> All HELM charts MUST be provided with Istio support aligned together with the project team. This consists of Authorization Rules, Virtual Service Definitions and other relevant Istio Definitions which are required for integration in a Istio Environment.  

### Standard Technology

#####   \[IDM.TSA.E1.00041\] Default Toolstack 

> Each development MUST consider the following standard technologies, if nothing else is explicitly requested:

| **Area**                     | **Technology**                                 |
| ----------------------------- | ---------------------------------------------- |
| Service Meshing              | Istio                                          |
| Databases                    | Redis, Mongo, Postgres                         |
| Messaging                    | CloudEvents                                    |
| Continuous Integration       | Argo CD, Gitlab                                |
| Installation Templates       | HELM                                           |
| Container                    | Docker Images (ARM64/AMD64)                   |
| Secret Storage               | Hashicorp Vault, k8s Secret                    |
| UI Technology                | React [7]                                      |
| Ingress Controller           | Nginx/Istio                                    |
| API Testing                  | Postman (manual)                               |
| API Design                   | OpenAPI                                        |
| Kubernetes                   | v1.26+                                         |
> Table 3: Technology Stack

###### [7] [<u>[https://react-bootstrap.github.io/]</u>](https://react-bootstrap.github.io/)
------

>![](./media/image2.png) 

>The technology stack is mandatory to avoid integration impact. 


-------


### Metrics

#####   \[IDM.TSA.E1.00042\] Opentelemtry Support 

> All helm charts/services MUST provide metrics endpoints in opentelemetry [8]format.

###### [8] [<u>[https://opentelemetry.io/docs/]</u>](https://opentelemetry.io/docs/)

### Configurability

#####   \[IDM.TSA.E1.00043\] Configuration 

> All components MUST support one of the major configuration formats (yaml, json, ini, environment variables) wherever configuration is required. If environment variables are overwriting an actively set configuration, a warning SHOULD be logged.  

#####   \[IDM.TSA.E1.00044\] Configuration Profiles 

> Environment specific parameters MUST be configurable over the helm templates by using profiles. Each component MUST be delivered minimum for profile:

-   DEV, a local environment for round trip development and testing

-   Acceptance, a restricted resource environment (with minimal system requirements) which can be deployed in cluster (remote or locally)

-   Prod, a scalable environment with fault tolerance, HA settings and security hardening.

>  

#####   \[IDM.TSA.E1.00045\] Secret References in Helm Charts 

> The configuration secrets within Helm Charts MUST use secretRefs to support external Secretmanagement. Clear text secrets within the Helm Charts are not allowed.  


### Maintainability

#####   \[IDM.TSA.E1.00046\] Micro Service Architecture 

> For a better scale out, maintainability and decentralization, the product architecture MUST have a micro service architecture. Each microservice MUST NOT be limited on the lines of code or number of days to implement it. The service "size" SHOULD be oriented on the fine granular business capabilities. (e.g., Order, ListMenu, Payment).
>  

#####   \[IDM.TSA.E1.00047\] Domain Driven Design 

> To support the micro service architecture within the maintainability, it MUST be declared a domain model before realization. The software description MUST explain which domain model was chosen, which services contain it and how it scales. This MUST be documented in the public code repository to support future enhancements for new developers.  

### Reusability

#####   \[IDM.TSA.E1.00048\] Enterprise Environments 

> All components MUST be reusable in different enterprise environments by customization and whitelabeling. Means all components MUST be able to customize and white label the components by configuration settings (e.g., UIs, text labels, endpoints etc.)  

### Runtime Stability

#####   \[IDM.TSA.E1.00049\] Readiness Check Ups 

> All components MUST reflect after bootstrap and during runtime the correctness of the service functionality by reflecting it over health endpoints. The health endpoint MUST return failure (red), if any internal behavior failure or misconfiguration occurs (not just the software running state). This means for instance to check continuously during the runtime:

-   A unreachable configured Services results in failed state

-   Configured Service Endpoints needs to be checked for readiness during runtime, if not reachable, it results in failure state

-   Check depending components (Database, Microservice etc.) behind it, if not reachable, it results in failed state  

### High Availability Concepts

#####   \[IDM.TSA.E1.00050\] Redundant Deployment 

> Each deployment MUST be configured for a minimum fault tolerance of 2 instances.  

# System Features

## Policy Management

### Description - Policy Management

> The policy management provides functionalities around the signing, validation, import, export, and merge of policies from internal and external policy repos. This is necessary to ensure that only trusted policies are imported from trusted resources. The feature must help and support the policy administrator in decisions to trust a policy repository from outside, trust imported policies, sign policies for export, export specific policies and merge changes into the productive repository. This feature can be automated by a continuous integration system (e.g., Jenkins), but it SHOULD include configurable manual reviewing steps to ensure that the signing of policies MUST be done by an authorized person.

### Functional Requirements - Policy Management


| Endpoints                                  |
|-------------------------------------------|
| Webhooks for policy changes                |
| JSON Schema Validation for Policy Output   |
| Fine granular policy management             |
| Policy Admin API                           |

| Functions                               |
|----------------------------------------|
| Policy Bundles                           |
| Policy Import and Export                 |
| Policy Changes Notification              |
| Interface for Export Configuration       |



>Table 4: Functional Requirements Policy Management

## Policy Evaluation

### Description - Policy Evaluation

> The policy evaluation provides functionality around the execution of policies. This includes the provisioning of versioned HTTP routes to execute the policy, synchronous and asynchronous policy evaluation, usage of external HTTP resources within the execution and a policy decision engine to create JSON response for a given JSON request and helper functionality around it. For instance, the caching of results or the inclusion of static JSON documents into the policy decisions, to evaluate more complex policies. All policies and static documents for the execution must be loaded from the encrypted hard disk into memory to guarantee the maximum execution speed. Temporary JSON documents can be stored into an open-source database for caching and SHOULD be deleted when no longer required. Any process or user behaves as an actor if the policy route was called.

### Functional Requirements - Policy Evaluation

| Functions                                       |
|-------------------------------------------------|
| Call of external URLs                           |
| Storage Extension Functions                      |
| Storage Implementation                            |
| TRAIN validation & verification                  |
| CLI tools (command-line) for common operations   |



> Table 5: Functional Requirements Policy Evaluation

## Task Controller - System Features

### Description - Task Controller

> The task controller feature provides an API which is able to handle asynchronous task lists. Each task represents one single action which executes an HTTP URL. Each task has a unique id and stores its result in the distributable cache for a later processing. Task lists can be preconfigured in the repository by a name, to create a new task subset more easily from a policy or any other component (e.g., a 1 to many task mapping).
>
> The task execution is asynchronous, and the result can be queried over the task(list) id, to query the state of the processing.

### Functional Requirements - Task Controller

| Functions                                |
|------------------------------------------|
| Cache Event Subscription                  |
| Task Queue and Storage Abstraction Layer  |



> Table 6: Functional Requirements Task Controller

## JSON-LD Signing and verification

### Description - JSON-LD Signing and verification

> The feature provides verification and signature functionality of LD-Proofs embedded in JSON-LD files. The functionality is an internal HTTP API, but the core crypto functionality has to be provided as a separate library and SHOULD run within a secure environment.

### Functional Requirements - JSON-LD Signing and verification

| Functions                  |
|----------------------------|
| Proof Chains in JSON-LD    |



> Table 7: Functional Requirements JSON-LD Signing and Verification

## Trusted Caching

### Description - Trusted Caching

> The trusted caching provides the functionality to store securely in memory data for identities and related information for trust evaluation.

### Functional Requirements - Trusted Caching

| Functions         |
|-------------------|
| Content Access    |



> Table 8: Functional Requirements Trusted Caching

## eIDAS Compliant Signatures

### Description - eIDAS Compliant Signatures

> To provide eIDAS compliant signatures the feature should be able to generate and validate eIDAS compliant signatures. In consideration of the different eIDAS types, legal signatures should be considered and a bridge functionality to sign the data should be implemented. A secure environment MUST be provided to store and execute the necessary functions (signature, validation) and SHOULD require at least two factor authentication.

### Functional Requirements - eIDAS Compliant Signatures

| Functions                                       |
|-------------------------------------------------|
| eIDAS compliant Signature Creation / Validation  |
 Support for DID:EBSI encoding for Natural Persons|




> Table 9: Functional Requirements eIDAS Compliant Signatures

# Verification

## Core Verification Requirements

> All listed verification items/criterias, must be fulfilled by a demonstration of the implementation within the provided Kubernetes environment.

#####   \[IDM.TSA.E1.00051\] Kubernetes Deployment 

>If the verification is related to software components, it must be deployed in a Kubernetes test cluster and the components must be deployable in a Kubernetes cluster with automated package manager deployment (e.g., Helm).
>
-------
> ![](./media/image2.png)
>
> Docker Compose and other local systems can be used for local development and testing, but it's NOT allowed for a final acceptance demonstration.
--------  

#####   \[IDM.TSA.E1.00052\] Behavior Driven Design 

> Verification of fulfillment of the requirements and characteristics MUST be done using automated tests which are part of the deliverables. They SHOULD be done by patterns of the Behavior Driven Development \[BDD\] using the "Gherkin Syntax".  

#####   \[IDM.TSA.E1.00053\] Test Environment 

> All functionalities MUST be demonstrated in a test environment within a sandbox, with the following infrastructure components:
>
> Load Balancer, e.g., HAProxy API Gateway, e.g., Kong
>
> Service Mesh, e.g., Linkerd/Istio DNS
>
> Multiple Servers Firewalls
>
> All tests MUST be passed in this test environment.  

#####   \[IDM.TSA.E1.00054\] Load Tests 

> Scalability and Performance around the high workload scenarios MUST be demonstrated, by using any kind of Load Test Framework for HTTP APIs.
>  

#####   \[IDM.TSA.E1.00055\] Automated Integration Tests 

> Automation Integration tests must be created, and they must be runnable by a CI job.  

## Acceptance Criteria

### Policy Management Module - Verification

#####   \[IDM.TSA.E1.00056\] Policy Bundles 
> Policy Bundles are signed when they become in a productive state or before export. The metadata can be signed for the included files of the bundle, or the bundle itself can be signed as a compressed package. 

#####   \[IDM.TSA.E1.00057\] Policy Import and Export 

> The export of a policy bundle MUST be signed with a keypair which is evaluable against the public keys registered in the DID document. Import and Exports are observable. 

#####   \[IDM.TSA.E1.00058\] Policy Changes Notification 

> A notification is triggered upon every change in a policy source code or static data file. 

#####   \[IDM.TSA.E1.00059\] Webhooks for policy changes 

> There is an available endpoint for client webhook subscription which takes a URL. Data payload is sent to all subscribers with relevant policy changes using the webhook URLs. 

#####   \[IDM.TSA.E1.00060\] JSON Schema Validation for Policy Output 

> A simple JSON schema is validated on the validation endpoint. An appropriate HTTP status code is returned. 

#####   \[IDM.TSA.E1.00061\] Fine granular policy management 

> The system allows policy management through separate GIT repositories. Separate synchronization mechanisms are in place for each GIT repository. 

#####   \[IDM.TSA.E1.00062\] Interface for Export Configuration 

> Export configurations are able to be defined in the policy management module. There is a synchronization flow in place for export configurations to make them available for execution. 

#####   \[IDM.TSA.E1.00063\] Policy Admin API 

An administration API for policies is available. 

### Policy Decision Engine - Verification

#####   \[IDM.TSA.E1.00064\] Call of external URLs 

> The decision engine is capable of making HTTP requests with query parameters, headers and request body for any HTTP method within the policy execution runtime. 

#####   \[IDM.TSA.E1.00065\] Storage Extension Functions 

> REGO extension functions are available for creating, updating and deleting data from a predefined database table/collection during policy evaluation. 

#####   \[IDM.TSA.E1.00066\] Storage Implementation 

> A storage layer can be replaced during the configuration in the deployment without any need to do code modifications. If internal storage is configured, the policy must be executable without any database deployment.  

#####   \[IDM.TSA.E1.00067\] TRAIN validation & verification 

> The service is able to use the components provided by the TRAIN lot to cross check the DID trust during the verification of credentials. 

#####   \[IDM.TSA.E1.00068\] CLI tools (command-line) for common operations 

> CLI tools for the common operations, performed by the TSA HTTP API are created. 

### Task Controller - Verification

#####   \[IDM.TSA.E1.00069\] Cache Event Subscription 

> After an update event in the distributable cache, a task must be created as pre-configured (or dynamically by policy). 

#####   \[IDM.TSA.E1.00070\] Task Queue and Storage Abstraction Layer 

> An abstraction layer is implemented for the Queue and Storage interfaces in the Task Controller. 

### JSON-LD signatures and validations - Verification

#####   \[IDM.TSA.E1.00071\] Proof Chains in JSON-LD 

> JSON-LD proof chains are supported to link multiple entities to the same data, when proof sequences are required.  

### Distributable Cache - Verification

#####   \[IDM.TSA.E1.00072\] Content Access 

> When accessing a content with given DID, namespace and scope, the result is a flat JSON file. Duplicate entries are handled during the flattening of multiple documents. 

### eIDAS - Verification

#####   \[IDM.TSA.E1.00073\] eIDAS compliant Signature Creation / Validation 

> Signatures are generated/verified in compliance with eIDAS. Basic, advanced and qualified signature types are supported. 

#####   \[IDM.TSA.E1.00074\] Support for DID:EBSI encoding for Natural Persons 

> Public key encoding in DID document for Natural Persons according to the EBSI DID Method is supported.  

## Support for Kubernetes

#####   \[IDM.TSA.E1.00075\] Eventing 

> All eventings must be demonstrated on basis of cloud events specifications together with the kNative [9] broker in a Kubernetes environment.   

###### [9] [<u>[https://knative.dev/docs/eventing/]</u>](https://knative.dev/docs/eventing/)

#####   \[IDM.TSA.E1.00076\] Config Map Support 

>Each service must be demonstrated up and running in Kubernetes, configured by config maps.  

#####   \[IDM.TSA.E1.00077\] Helm Installation 

>The service installation MUST be demonstrated during HELM install.   


#####   \[IDM.TSA.E1.00078\] ArgoCD Integration 

>The helm chart MUST be able to install inside of ArgoCD. This includes the usage of the postgres hooks [10] and the providing of usable values.yaml(s) for all developed services. 

###### [10] [<u>[https://gitlab.com/gaia-x/data-infrastructure-federation-services/gxfs-integration/-/tree/main/helm/charts/postgresql-hook]</u>](https://gitlab.com/gaia-x/data-infrastructure-federation-services/gxfs-integration/-/tree/main/helm/charts/postgresql-hook)

>  

#####   \[IDM.TSA.E1.00079\] SCS Environment 

>All HELM installations MUST run on SCS (Sovereign Cloud Stack). The final acceptance demonstration cannot be realized on azure, google cloud etc.   


# Appendix A: Glossary 

> For the glossary refer to IDM.AO Glossary/Terminology \[IDM.AO\]

# Appendix B: Architecture 

![](./media/image4.png)
