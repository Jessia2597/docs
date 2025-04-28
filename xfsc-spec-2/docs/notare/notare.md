## Software Requirements Specification  for  Gaia-X Federation Services Notarization API Extension 1CP.  NOTARE1                                                   

Published by

eco -- Association of the Internet Industry (eco -- Verband der Internetwirtschaft e.V.) Lichtstrasse 43h 50825 Cologne, Germany

Copyright 

© 2023 eco -- Association of the Internet Industry
This work is licensed under the Creative Commons attribution 4.0nInternational License. To view a copy of this license, visit <http://creativecommons.org/licenses/by/4.0/> or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA

![](./media/image1.png)


#### 1  [Introduction ](#introduction)

>##### 1.1  [Document Purpose ](#document-purpose)

>#####   1.2  [Product Scope ](#product-scope)
>#####   1.3  [Definitions, Acronyms and Abbreviations](#definitions-acronyms-and-abbreviations)

>#####   1.4  [References ](#references)

>#####   1.5  [Document Overview ](#document-overview)

#### 2  [Product Overview ](#product-overview)

>##### 2.1  [Product Perspective ](#product-perspective)

>##### 2.2  [Product Functions ](#product-functions)

>##### 3.3  [Product Constraints ](#product-constraints)

>##### 2.4  [User Classes and Characteristics](#user-classes-and-characteristics)

>##### 2.5  [Operating Environment ](#operating-environment)

>##### 2.6  [User Documentation ](#user-documentation)

>##### 2.7  [Assumptions and Dependencies ](#assumptions-and-dependencies)

>##### 2.8  [Prioritization of System Features](#prioritization-of-system-features)

#### 3  [Requirements ](#requirements)

>##### 3.1  [External Interfaces ](#external-interfaces)

>>###### 3.1.1  [User Interfaces ](#user-interfaces)

>>###### 3.1.2  [Hardware Interfaces ](#hardware-interfaces)

>>###### 3.1.3  [Software Interfaces ](#software-interfaces)

>>###### 3.1.4  [Communications Interfaces ](#communications-interfaces)

>##### 3.2  [Functional ](#functional)

>##### 3.3  [Nonfunctional Requirements ](#nonfunctional-requirements)

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

>>###### 3.5.2  [Configuration ](#configuration)

>>###### 3.5.3  [Distribution ](#distribution)

>>###### 3.5.4  [Service Meshing ](#service-meshing)

>>###### 3.5.5  [Standard Technology ](#standard-technology)

>>###### 3.5.6  [Metrics ](#metrics)

>>###### 3.5.7  [Configurability ](#configurability)

>>###### 3.5.8  [Maintainability ](#maintainability)

>>###### 3.5.9  [Reusability ](#reusability)

>>###### 3.5.10 [Runtime Stability ](#runtime-stability)

>>###### 3.5.11 [High Availability Concepts ](#high-availability-concepts)

>>###### 3.5.12 [Proof of Concept ](#proof-of-concept)

#### 4  [Verification ](#verification)

>##### 4.1  [Core Verification Requirements](#core-verification-requirements)

>##### 4.2  [Support for Kubernetes ](#support-for-kubernetes)

>##### 4.3  [Functionality Acceptance Criteria](#functionality-acceptance-criteria)

[Appendix A: Glossary ](#appendix-a-glossary)

[Appendix B: Architecture ](#appendix-b-architecture)

# List of Figures

> Figure 1: References 
>
> Figure 2: Cooperation View 

# List of Tables 

> Table 1: User Classes 
>
> Table 2: Priorities 
>
> Table 3: Technology Stack 

# Introduction

> To get general information regarding Gaia-X and the Gaia-X Federation Services please refer to \[TAD\] and \[PRD\].

## Document Purpose

> The purpose of the document is to specify the requirements of the Compliance subcomponent "Notarization API Extension 1" with the intention of an European wide public tender for implementing this software extension. Main audience for this document are attendees of the public tender, which are able to supply an open-source software solution for the area of identity and document verification with the purpose to provide digital support for existing certification bodies within Gaia-X.

## Product Scope

> The product scope is to extend the existing component "Notarization API", with the following new features:

-   Protocol agnostic issuances depending on the incoming DID and format
    definitions

-   New issuance and verification protocols

-   Business validation flow for the notary

-   Documentation for using NOT as the compliance service for
    memberships

-   Dynamic schema configuration

-   Enrollment of organization to certain trustlists

-   Trust verification before the issuance process with the TRAIN module

-   Automatic Notarization Verification

--------
> ![](./media/image2.png)

>The product extension must include interfaces (API's) to integrate the notarization component smoothly in external software for Non-IT operator usage (e.g., lawyers, notaries, governments, certifiers \...).
> If it's required to do code restructurings, modifying the current solution by adding new microservices etc. then this is explicitly allowed.
> Please note, that it is explicitly required to deliver the software up and running. Responsibility for existing code cannot be shifted to previous development teams.

------
## Definitions, Acronyms and Abbreviations

> Please refer to \[IDM.AO\] for Terminology/Glossary.

### References

| Reference          | Title                                                         | Link                                                                                                 | Status      |
|--------------------|---------------------------------------------------------------|------------------------------------------------------------------------------------------------------|-------------|
| [BDD]              | Getting Started with Behavior Driven Development             | [Specflow](https://specflow.org/bdd/)                                                                | 03-18-2023  |
| [CloudEvents]      | CloudEvents Specification                                     | [cloudevents.io](https://cloudevents.io/)                                                           | 03-17-2023  |
| [IDM.AO]           | Architecture Overview                                          | Please refer to "annex_IDM.AO"                                                                      |             |
| [IDM.TRAIN]        | GXFS Trust Management Infrastructure                          | Please refer to "annex_IDM.TRAIN"                                                                   |             |
| [OpenID VCI]       | OpenID for Verifiable Credential Issuance                      | [OpenID VCI Spec](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html)        | 03-18-2023  |
| [OpenID VP]        | OpenID for Verifiable Presentations                            | [OpenID VP Spec](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)              | 03-18-2023  |
| [PRD]              | Gaia-X Policy Rules Document                                  | [Gaia-X PRD](https://docs.gaia-x.eu/policy-rules-committee/policy-rules-labelling/22.11/)         | 08-01-2023  |
| [RFC2119]          | Key words for use in RFCs to Indicate Requirement Levels      | [RFC 2119](https://tools.ietf.org/html/rfc2119)                                                    | 07-04-2023  |
| [TAD]              | Gaia-X Architecture Document                                  | [Gaia-X TAD](https://docs.gaia-x.eu/technical-committee/architecture-document/22.10/)             |             |


> ###### Figure 1: References

## Document Overview

> The document describes the product perspective, functions, and constraints. It furthermore lists the functional and non-functional requirements and defines the system features in detail. The listed requirements are binding. Requirements as an expression of normative specifications are identified by a unique ID in square brackets (e.g. **\[CP.NOTAR.Number\]**) and the keywords MUST, MUST NOT, SHOULD, SHOULD NOT, MAY, corresponding to RFC 2119 \[[RFC 2119](https://tools.ietf.org/html/rfc2119)\], are written in capital letters (see also \[IDM.AO\]-   Methodology).

# Product Overview

## Product Perspective

> The purpose of this product extension is to support the trust establishment with new enrollment processes. To reach this goal the software component extension should follow standard formats of credential exchange and enrollment. Therefore, this extension introduces new components. The following problems are being addressed with this extension:

-   Interoperability with other ecosystems & future technology

-   Trust anchor enrollment

-   Trust verification



>This allows each federation to create and host their own trust anchors and policies. Next to that they can choose between multiple ecosystems. The trust verification module with TRAIN allows the relying parties to verify trust chains more easily before issuing respective certificates.


-------
> ![](./media/image2.png)

> The existing code base [1] MUST be reused and further improved. Other microservices MAY have different languages and architectures.

###### [1] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/not]</u>](https://gitlab.eclipse.org/eclipse/xfsc/not)
-------
## Product Functions

> The product extension itself follows the microservice component design principles. The functionality is exposed per REST Service and accessible over the Network per HTTPS protocol. The component has to be installed in multi locations and SHOULD NOT be planned as a central hosted system. Therefore, it must be possible to install it within the issuer's organization domain with multiuser access capabilities. The access to the offered functionality of the component extension MUST be protected for the usage in such an environment. This includes role concepts, data storage protection and access control. The overall functionality of the product MUST be auditable (GDPR conform), which means each action MUST be documented with all context-specific information within the system.

> The main functionality scope of this product extension is to provide a way to enroll new issuers considering the defined policies of the Trust Framework [2] and the federation itself. It also allows Business owners to use different did-methods and be part of other ecosystems. That means each federation can create their own rulebook and allow their own ecosystems.
>
> The core functions of the product extension are:

-   Enrollment of new issuers and authorities

-   TRAIN validation & verification [3] \[IDM.TRAIN\]

-   DID method abstraction

-   Credential issuance & verification

-   Automated external business validations

![](./media/image3.png)

> ##### Figure 2: Cooperation View
>--------
###### [2] [<u>[https://docs.gaia-x.eu/policy-rules-committee/trust-framework/22.10/participant/]</u>](https://docs.gaia-x.eu/policy-rules-committee/trust-framework/22.10/participant/)
###### [3][<u>[https://gitlab.grnet.gr/essif-lab/infrastructure/fraunhofer]</u>](https://gitlab.grnet.gr/essif-lab/infrastructure/fraunhofer)

## Product Constraints

##### \[CP.NOTAR.E1.00000\] The document IDM.AO and Core Credential Document 

> The architecture document \[IDM.AO\] is an essential part of this
> specification and a prerequisite for understanding the context. The
> specifications and requirements from the Architecture Document MUST be
> taken into account during implementation.

#####  \[CP.NOTAR.E1.00001\] The product extension architecture pattern 

> The product extension MUST follow the existing architecture pattern of
> the first version (see Appendix B). It MUST enhance the existing
> component with additional and missing features.

## User Classes and Characteristics

 | User Class                | Description                                     | Frequency | Expertise | Privilege Level | Product Usage        |
|---------------------------|-----------------------------------------------|-----------|-----------|-----------------|----------------------|
| Notarization Operator     | Notarizes given data and confirms the issuing of electronic credentials to a given DID. An operator is an employee of the notarization office. | High      | Low       | High            | Managing Frontend    |
| Administrator             | Sets up the system and maintains operator identities. | Low       | High      | Low             | Backend Maintenance  |
| Organization Business Owner / Authorization Officer | Represents a participant. | Low       | Low       | Low             | Request Frontends    |


> ###### Table 1: User Classes

## Operating Environment

##### \[CP.NOTAR.E1.00002\] Kubernetes Environment 

> The product MUST be operable on standard Kubernetes based environments
> without any hardware restrictions. The reference environment for
> demonstration and development purposes MUST be on a SCS cluster
> (Sovereign Cloud Stack), that will be provided by the Principal. 

##### \[CP.NOTAR.E1.00003\] TLS Protected Endpoints 

> To protect the product endpoint(s), it's necessary to support a
> network infrastructure e.g., load balancers/proxies which MUST support
> TLS encryption. The encryption MUST meet the requirements listed in
> the chapter for security requirements. 

## User Documentation

##### \[CP.NOTAR.E1.00004\] Participant Administration Documentation 
> The documentation MUST contain:

-   Installation Manuals

-   Cryptographic Initialization (if applicable)

-   Description of Deployment/Compile Process

-   Description of the Automatic Tests / Verification

-   How to build the products from source code 

##### \[CP.NOTAR.E1.00006\] Participant Documentation 

> The documentation MUST contain:

-   Short Software Description (why and for what, when to use, how to
    use, where to use)

-   Usage guide

-   GDPR design decisions

-   Security concept

-   Operations concept

-   FAQ

-   Keyword Directory 

## Assumptions and Dependencies

##### \[CP.NOTAR.E1.00007\] TRAIN Dependencies 

> The product extension has multiple dependencies to the TRAIN module
> \[IDM.TRAIN\]. The following parts of the product extension have a
> close relationship with the TRAIN module:

-   Enrollment of new issuers

-   Verification of verifiable presentations



## Prioritization of System Features

  | Feature                                     | Priority |
|---------------------------------------------|----------|
| Enrollment of new issuers and authorities   | 1        |
| TRAIN validation & verification             | 1        |
| DID method abstraction                      | 2        |
| Credential issuance & verification flow     | 1        |
| Automated external business validations     | 2        |



###### Table 2: Priorities
------
![](./media/image2.png)
> Please be aware that extending or contributing to the used frameworks means explicitly to actively make changes if necessary.
------
# Requirements

## External Interfaces

### User Interfaces

> The User Interface functionality MUST be provided to the Command Line Interface (CLI) implementers.

### Hardware Interfaces

> Not applicable.

### Software Interfaces

##### \[CP.NOTAR.E1.00008\] OAuth2 

> The product internal IAM MUST support OAuth2 to grant access to the API. The product MUST be able to support the Identity Provider withinthe integration cluster.

------
 ![](./media/image2.png)

>The roles used for the profile
> entitlement MUST be decoupled from the profile name.
-------

##### \[CP.NOTAR.E1.00009\] Database Connection 

> The connection of the product to its database MUST be TLS encrypted or a similar encryption of the transport level. 

### Communications Interfaces

##### \[CP.NOTAR.E1.00010\] Eventing 

> If it is required to use events within the software architecture, it is mandatory to use software abstraction according to cloud event specification \[CloudEvents\] for publishing and subscription. The minimal supported protocol binding MUST be HTTPS Protocol Binding [5].

###### [5] [<u>[https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/bindings/http-protocol-binding.md]</u>](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/bindings/http-protocol-binding.md)

##### \[CP.NOTAR.E1.00011\] Eventing Infrastructure 

> The event broker for the eventing MUST abstract the storage and delivery infrastructure. In Kubernetes environments, the event broker MUST be uniform across all Lots by using NATS[6] and/or kNative.

###### [6] [<u>[https://nats.io/]</u>](https://nats.io/)

##### \[CP.NOTAR.E1.00012\] Notarization Request Endpoint 

> The existing request endpoint MUST be enhanced with a new functionality to request a DID enrollment for a trustlist. The functionality of this enhancement is described in chapter 3.2 \[CP.NOTAR.E.1.000014\]

> Supported Actions: GET (view), POST (Notarization Request), PATCH (update existing Request), DELETE (Revoke existing Request) and POST for File Upload.

## Functional

##### \[CP.NOTAR.E1.00014\] Enrollment of new issuers and authorities 

###### <i> Description </i>

> The enrollment process of new issuers is a process to set a DID and the respective configuration on a trustlist of a federation. This process can be started with the request endpoint and MUST be defined with one attribute. The request of the enrollment MUST follow the same flow as any other request.

> After the confirmation of the request from the notary the action / output MUST be a new entry on an existing trustlist. To add an entry on the trustlist the TRAIN enrollment module needs to be called.

###### <i> Constraints </i>

-   Own DID for issuing.

-   DID of the organization.

-   Database system.

###### <i> Interfaces </i>

-   TRAIN enrollment module.

-   Database interface.

###### <i> Input </i>

> A confirmed request record. This needs to include:

-   DID of the organization

-   ID of the trust list

-   ID of the schema

-   Metadata of the entity (to be specified further according to
    business analyst analysis)

    -   Legal Name

    -   Certification details

    -   Assurance Levels

-   Types of DIDs supported

-   Type of other digital credentials supported (example: x509)

-   Different services offered by the organization

###### <i> Output </i>

-   A new entry in an existing trust list.

###### <i> Acceptance Criteria </i>

1.  DID of the request successfully added to the trustlist.

2.  The requestor is able to issue the VC mentioned on the trustlist.



##### \[CP.NOTAR.E1.00015\] TRAIN validation & verification 

###### <i> Description </i>

> The TRAIN validation service needs to be included in the process of verifying a verifiable presentation. If a requestor is showing a verifiable presentation during a task which needs to be fulfilled, the notarization service needs to validate the terms Of Use by calling the TRAIN validation module \[IDM.TRAIN.00017\]. This will verify if the shown verifiable presentation and the respective owner of it is on a trust list.

###### <i> Constraints </i>

-   DID of the organization.

-   Database system.

###### <i> Interfaces </i> 

-   TRAIN validation module.

###### <i> Input </i>

-   A verification with an incoming verifiable presentation.

###### <i> Output </i>

-   Verification output of the TRAIN validation module.

###### <i> Acceptance Criterias </i>

1.  The terms Of Use could successfully be verified and validated.

2.  The presentation could successfully be proved cryptographically and
    semantically.


##### \[CP.NOTAR.E1.00016\] DID method abstraction 

###### <i> Description </i>

> The SSI Issuance controller MUST be able to understand multiple DID methods and MUST also issue the Credential in the respective issuance protocol. The focus MUST lay on the DID methods EBSI, Sovrin (Indy), Web and Key. The notarization service MUST be enhanced with a connection to the EBSI ledger. Depending on the incoming request the SSI Issuance service MUST decide which credential exchange protocol \[CP.NOTAR.00022\] should be used. The selection of which one must be used depends on which service endpoint is available on the DID document of the requestor. The DID:Web method MUST be configurable for issuing credentials.

###### <i> Constraints </i>

-   DID of the organization.

-   Database system.

-   CP.NOTAR.00022 credential issuance extension

###### <i> Interfaces </i>

-   Database interface.

-   Issuance Endpoint

###### <i> Input </i>

-   Request from the request endpoint.

-   DID of the organization.

###### <i> Output </i>

>/

###### <i> Acceptance Criterias </i>

> 1. Successful managed request.


##### \[CP.NOTAR.E1.00017\] Credential Issuing extension 

###### <i> Description </i>

> The existing SSI issuance service needs to be enhanced with a new protocol to issue verifiable credentials. If a DID supports the respective endpoint the issuance service should use the OpenID for Verifiable credential issuance protocol \[OpenID VCI\] and the component can perform a Present Proof request before issuing defined in OpenID for Verifiable Presentations \[OpenID VP\]. The credential issuing is an asynchronous process which checks the database for confirmed request records in the database. All of the found confirmed records will be picked up. Within the record MUST be a linked DID of the participant, which is here used to establish a connection to the Credential Manager (OCM and PCM) of the participant.

###### <i> Constraints </i>

-   Own DID for issuing.

-   DID of the organization.

-   Database system.

-   OpenID for Verifiable credential issuance.

-   OpenID for Verifiable Presentations

###### <i> Interfaces </i>

-   Database interface.

-   Issue Endpoint.

###### <i> Input </i>

-   A confirmed request record.

###### <i> Output </i>

-   An issued credential to the participant DID.

###### <i> Acceptance Criteria </i>

1.  Credential successfully issued to participant DID.

2.  Credential has the exact type of the request context.

3.  Deletion of the request record, after successful issuing.


##### \[CP.NOTAR.E1.00018\] Proof of Credentials extension 

###### <i> Description </i>

> To prove the trustworthiness of this product extension, it MUST support the OpenID for Verifiable Presentations and it MUST be configurable which proofs are fulfilled automatically (e.g., based on a configured schema). If a DID supports the respective endpoint, the SSI service should use the OpenID for Verifiable presentations protocol. In the case of a JSON-LD Presentation an extended validation MUST be supported via TRAIN \[IDM.TRAIN\]. After the cryptographic proofing the semantic validation MUST happen via TRAIN. This SHOULD validate the Trust against the Trust Framework and registries.

###### <i> Constraints </i>

-   Control over the Own DID.

-   OpenID for Verifiable presentations protocol.

-   TRAIN.

###### <i> Interfaces </i>

-   Issue Endpoint

-   TRAIN

###### <i> Input </i>

-   Any presentation request described in OpenID for Verifiable
    Presentations.

###### <i> Output </i>

-   A presentation request according to OpenID for Verifiable
    Presentations.

###### <i> Acceptance Criteria </i>

> 1. The Software is able to prove the credentials of the holder.


##### \[CP.NOTAR.E1.00019\] External business validations 

###### <i> Description </i>

> The notarization administrator MUST have the possibility to add an external business validation. This MUST be an API GET request to an external system to fetch data. Next to that the service needs to validate the fetched data and include them in the issuance process. The verification process should include the Gaia-X compliance service [7] to make additional checks.
###### [7] [<u>[https://gitlab.com/gaia-x/lab/compliance/gx-compliance]</u>](https://gitlab.com/gaia-x/lab/compliance/gx-compliance)

###### <i> Constraints </i>

-   DID of the organization.

-   Database system.

-   OpenID for Verifiable credential issuance.

###### <i> Interfaces </i>

> /

###### <i> Input </i>

-   A confirmed request record.

###### <i> Output </i>

-   Validated data from an external system.

###### <i> Acceptance Criterias </i>

1.  External data successfully fetched

2.  External data successfully verified


##### \[CP.NOTAR.E1.00020\] Cloud Configuration 

> The provider MUST support advanced cloud configuration by using Kubernetes config maps provided by HELM templates. Additionally, the provider MUST accept dynamic configuration changes over the configuration UI.

##### \[CP.NOTAR.E1.00021\] Dynamic schema (profile) configuration 

> The software extension MUST include dynamic schema configuration. For now, the credential schemas (profiles) can only be configured before starting the service. The software extension MUST include a dynamic schema configuration at run time. That means an endpoint needs to be created which can only be used by the admin of the software or the enabled notaries. For the generation of the profile the component IDM.SR should be used. Based on the different Trust anchor and credential format of the profile the schema regeneration should follow a different flow. The following schema generation flows MUST be supported:

-   EBSI schema generation with the Trusted Schemas Registry fromb EBSI[8]

-   IDUnion (Indy) credential schema creation and credential definition

-   JSON-LD schema context generation and storage on IPFS

###### [8] [<u>[https://api-pilot.ebsi.eu/docs/apis/trusted-schemas-registry/latest#/]</u>](https://api-pilot.ebsi.eu/docs/apis/trusted-schemas-registry/latest#/)

###### <i> Constraints </i>

-   Attributes of the schema

-   Database system

###### <i> Interfaces </i> 

>Interface to IDM.SR

###### <i> Input </i>

-   Schema attributes

-   Trustanchor

-   VC Format

-   Issuer DID

###### <i> Output </i>

-   Created profile

-   Registered (stored) schema

###### <i> Acceptance Criterias </i>

 1. Company data successfully validated


##### \[CP.NOTAR.E1.00022\] Credential Issuance 

> When a DID Document provides multiple Communication protocols like OIDC4VC, Indy AIP 1.0 and AIP 2.0, the notarization API MUST issue a credential to all of the protocols, to have a consistent set of credentials in all wallets of the user.

##### \[CP.NOTAR.E1.00023\] Role Management {#cp.notar.e1.00023-role-management .unnumbered}

> The profiles MUST be decoupled from roles to allow and flexible management.

##### \[CP.NOTAR.E1.00024\] Swagger Documentation 

> The swagger documentation MUST be in the provided GitLab repository.

##### \[CP.NOTAR.E1.00025\] Existing Schemas as Template 

> The profile Template collects attributes for issuing a credential, but existing schemas e.g., indy schemas should be accepted as well as template.

##### \[CP.NOTAR.E1.00026\] OAW Integration 

> The API MUST be accessible for external services like OAW to support the automatic notarization and verification.

##### \[CP.NOTAR.E1.00027\] Automatic rule-based Notarization 

> The API MUST support an automatic notarization functionality with usage of TSA Policies [9].

###### [9] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/tsa/policies]</u>](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policies)

##### \[CP.NOTAR.E1.00028\] Revocation Preparation 

> Additionally, the component MUST prepare an hash-based revocation which is calculated over the proof of the credential in the following way:

-   For RSA signature a SHA256 hash is calculated over the entire signature in raw byte format

-   For EC-DSA Signature the SHA256 hash is calculated over the r value of the proof signature

> The revocation endpoint MUST provide this calculated hash of W3C credentials[10] to an internal storage grouped by Holder DID which has an internal interface to read the hashes for later integration (later integration is out of scope for this tender).

###### [10] [<u>[https://www.w3.org/TR/vc-data-model/]</u>](https://www.w3.org/TR/vc-data-model/)

## Nonfunctional Requirements

#### HTTP Requirements

##### \[CP.NOTAR.E1.00029\] HTTPS 

> All HTTP Endpoints MUST be protected by TLS 1.2 (all protocol version numbers SHOULD be superseded by upcoming standards). Each endpoint of the product MUST support TLS certificates which are configurable by the administrator of the system.

##### \[CP.NOTAR.E1.00030\] HTTP Protocol Definitions 

> All HTTP Endpoints MUST follow [\[RFC7231\]](https://datatracker.ietf.org/doc/html/rfc7231) and [\[RFC5789\],](https://datatracker.ietf.org/doc/html/rfc5789) but it MAY be chosen what of the protocols is necessary to realize the functionality. For problem reports the [\[RFC7807\]](https://datatracker.ietf.org/doc/html/rfc7807) MUST be used in combination with Standard HTTP Error Codes.

### Logging Requirements

##### \[CP.NOTAR.E1.00031\] Data Minimization 

> The data minimization principle is expressed in Article 5(1)(c) of the GDPR and Article 4(1)(c) of Regulation (EU) 2018/1725, which provide that personal data must be \"adequate, relevant and limited to what is necessary in relation to the purposes for which they are processed\". The data shall be stored for a period of time in accordance with national requirements and, as a minimum, shall consist of thefollowing elements:

a.  node\'s identification

b.  message identification

c.  message data and time

> All logged data/information MUST be documented in the GDPR design decisions for a GDPR review. 

##### \[CP.NOTAR.E1.00032\] Logging Frameworks 

> The product MUST support logging frameworks e.g., graylog, fluentD or logstash to support logging and analysis by enterprise infrastructures. The supported framework MAY be chosen for the first version, but it MUST support potentially the most common open-source logging solutions. The final solution MUST be aligned with the other subcomponents. It MUST be sketched in the operations concept how the support of multiple solutions is given in the future. 

### Performance Requirements

##### \[CP.NOTAR.E1.00033\] Up/Down Scale

> All components MUST be able to scale up/down their functionality for undefined amount instances. This requires a parallel execution possibility which will be tested later on by performance tests which are defined by the test team.

### Safety Requirements

##### \[CP.NOTAR.E1.00034\] Major Releases

> All used software components MUST use the major releases with Long Term Support. If no LTS is available, all components MUST use the latest major releases with security hardening.

### Security Requirements

##### \[CP.NOTAR.E1.00035\] CVE Patches

> All software components MUST have applied CVE patches, which are available for major releases.

### Software Quality Attributes

##### \[CP.NOTAR.E1.00036\] Software Quality Requirements

> All software components MUST be compliant to the requirements within the quality assurance repository [11]. This includes testing on different layers (unit, component, integration), branch model that support stages, patch management, and code quality verification with adequate reporting. In addition, all requirements and quality attributes MUST demonstrated by automated behavior driven testing \[BDD\] methodology.

###### [11] [<u>[https://gitlab.com/gaia-x/data-infrastructure-federation-services/quality-assurance/-/issues]</u>](https://gitlab.com/gaia-x/data-infrastructure-federation-services/quality-assurance/-/issues)

### Business Rules

##### \[CP.NOTAR.E1.00037\] Software Consistency 

> The used technologies MUST have consistency. Standard technologies e.g., Databases MUST be abstracted over JDBC, authentication over OIDC etc. 

##### \[CP.NOTAR.E1.00038\] Cherry Picking 

> All components and the entire software architecture MUST be checked for the necessity for deployment of each single feature, to allow an enterprise deployment customization. 

## Compliance

#####  \[CP.NOTAR.E1.00039\] GDPR Audit Logging

> All GDPR relevant access to personal relevant data MUST be logged for a later audit.

##### \[CP.NOTAR.E1.00040\] GDPR Data Processing 

> Is it necessary to process person-relevant data, it MUST be earmarked to a clearly defined business process, which has to be described in the GDPR design decisions. All relevant data MUST be deleted after the processing, if applicable. 

## Design and Implementation

### Installation

##### \[CP.NOTAR.E1.00041\] Helm/Argo CD Deployment

> All installations MUST be scripted/templated to ensure automated deployment. This MUST be ensured over HELM templates which MUST follow uniform rules across all lots. The charts MUST be integrable in a ARGO CD Pipeline defined in the integration repository [12].

###### [12] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/integration]</u>](https://gitlab.eclipse.org/eclipse/xfsc/integration)

### Configuration

##### \[CP.NOTAR.E1.00042\] Configuration

> All components MUST support one of the major configuration formats (yaml, Json, ini, environment variables) wherever configuration is required. If environment variables are overwriting an actively set configuration, a warning SHOULD be logged. 

### Distribution

##### \[CP.NOTAR.E1.00043\] Helm Repositories 

> All component helm charts MUST be available under a helm repository hosted in the GitLab, with different channels for distribution [13].

###### [13] [<u>[https://gitlab.com/api/v4/projects/41175300/packages/helm/Integration/index.yaml]</u>]( https://gitlab.com/api/v4/projects/41175300/packages/helm/Integration/index.yaml)

##### \[CP.NOTAR.E1.00044\] Istio Resources 

> Additionally, the Charts MUST provide Istio Resource (eg., Authorization Rules, Virtual Services []{#3.5.4_Service_Meshing .anchor}etc.) following the integration pattern specified in the gxfs-integration repo [14].

###### [14] [<u>[https://gitlab.eclipse.org/eclipse/xfsc/integration]</u>](https://gitlab.eclipse.org/eclipse/xfsc/integration)

### Service Meshing

##### \[CP.NOTAR.E1.00045\] Istio Support 

> All HELM charts MUST be provided with Istio support aligned together with the project team. This consists of Authorization Rules, Virtual Service Definitions and other relevant Istio Definitions which are required for integration in a Istio Environment.

### Standard Technology

##### \[CP.NOTAR.E1.00046\] Default Toolstack 

> Each development MUST consider the following standard technologies if nothing else is explicitly requested:

| Area                    | Technology                         |
|-------------------------|-----------------------------------|
| Service Meshing         | Istio                             |
| Databases               | Redis, Mongo, Postgres            |
| Messaging               | CloudEvents                       |
| Continuous Integration  | Argo CD, Gitlab                   |
| Installation Templates  | HELM                              |
| Container               | Docker Images (ARM64/AMD64)       |
| Secret Storage          | Hashicorp Vault, k8s Secret       |
| UI Technology           | React [15]                           |
| Ingress Controller      | Nginx                             |
| API Testing             | Postman (manual)                  |
| Kubernetes              | 1.26+                             |
| API Design              | OpenAPI                           |
| |

> ###### Table 3: Technology Stack
 
 ###### [15] [<u>[https://react-bootstrap.github.io/]</u>](https://react-bootstrap.github.io/)

---------

> ![](./media/image2.png) 

>The technology stack is mandatory to avoid integration impact.

--------

### Metrics

##### \[CP.NOTAR.E1.00047\] Open Telemetry Support

> All helm charts/services MUST provide metrics endpoints in opentelemetry [16] format.

###### [16] [<u>[https://opentelemetry.io/docs/]</u>](https://opentelemetry.io/docs/)

### Configurability

##### \[CP.NOTAR.E1.00048\] Configuration Profiles

> Environment specific parameters MUST be configurable over the helm templates by using profiles. Each component MUST be delivered minimum for profile:

-   DEV, a local environment for round trip development and testing

-   Acceptance, a restricted resource environment (with minimal system requirements) which can be deployed in cluster (remote or locally)

-   Prod, a scalable environment with fault tolerance, HA settings and security hardening


##### \[CP.NOTAR.E1.00049\] Secret References in Helm Charts 

> The configuration secrets within Helm Charts MUST use secretRefs to support external []{#3.5.8_Maintainability .anchor}Secretmanagement. Clear text secrets within the Helm Charts are not allowed.

### Maintainability

#####  \[CP.NOTAR.E1.00050\] Micro Service Architecture 

> For a better scale out, maintainability and decentralization, the product architecture MUST have a micro service architecture. Each microservice MUST NOT be limited on the lines of code or number of days to implement it. The service "size" SHOULD be oriented on the fine granular business capabilities. (e.g., Order, ListMenu, Payment).

##### \[CP.NOTAR.E1.00051\] Domain Driven Design 

> To support the micro service architecture within the maintainability, it MUST be declared a domain model before realization. The software description MUST explain which domain model was chosen, which services contain it and how it scales. This MUST be documented in the public code repository to support future enhancements for new developers.

### Reusability

##### \[CP.NOTAR.E1.00052\] Enterprise Environments 

> All components MUST be reusable in different enterprise environments by customization and white labeling. Means all components MUST be able to customize and white label the components by configuration settings (e.g., UIs, text labels, endpoints etc.)

### Runtime Stability

##### \[CP.NOTAR.E1.00053\] Readiness Checkups 

> All components MUST reflect after bootstrap and during runtime the correctness of the service functionality by reflecting it over health endpoints. The health endpoint MUST return failure (red), if any internal behavior failure or misconfiguration occurs (not just the software running state). This means for instance to check continuously during the runtime:

-   A unreachable configured Services results in failed state

-   Configured Service Endpoints needs to be checked for readiness during runtime, if not reachable, it results in failure state

-   Check depending components (Database, Microservice etc.) behind it, if not reachable, it results in failed state

### High Availability Concepts

##### \[CP.NOTAR.E1.00054\] Redundant Deployment 

> Each deployment MUST be configured for a minimum fault tolerance of 2 instances.

### Proof of Concept

##### \[CP.NOTAR.E1.00055\] Architecture Changes 

> All Architecture Changes MUST be aligned with the Principal before implementation.

# Verification

## Core Verification Requirements

> All listed verification items/criteria must be fulfilled by a demonstration of the implementation within the provided Kubernetes environment.

##### \[CP.NOTAR.E1.00056\] Kubernetes Deployment 



>If the verification is related to software components, it must be deployed in a Kubernetes test cluster and the components must be deployable in a Kubernetes cluster with automated package manager deployment (e.g., Helm). 

----
> ![](./media/image2.png)

>Docker Compose and other local systems can be used for local development and testing, but it's NOT allowed for a final acceptance demonstration.

-----

## Support for Kubernetes

##### \[CP.NOTAR.E1.00057\] Eventing 

> All eventings must be demonstrated on basis of cloud events specifications \[CloudEvents\] together with the kNative [17] broker in a Kubernetes environment.

###### [17] [<u>[https://knative.dev/docs/eventing/]</u>](https://knative.dev/docs/eventing/)

##### \[CP.NOTAR.E1.00058\] Config Map Support 

> Each service must be demonstrated up and running in Kubernetes, configured by config maps.

##### \[CP.NOTAR.E1.00059\] Helm Installation 

> The service installation MUST be demonstrated during HELM install.

##### \[CP.NOTAR.E1.00060\] ArgoCD Integration 

> The helm chart MUST be able to install inside of ArgoCD. This includes the usage of the postgres hooks [18] and the providing of usable values.yaml(s) for all developed services.

###### [18] [<u>[https://gitlab.com/gaia-x/data-infrastructure-federation-services/gxfs-integration/-/tree/main/helm/charts/postgresql-hook]</u>](https://gitlab.com/gaia-x/data-infrastructure-federation-services/gxfs-integration/-/tree/main/helm/charts/postgresql-hook)

##### \[CP.NOTAR.E1.00061\] SCS Environment 

> All HELM installations MUST run on SCS (Sovereign Cloud Stack). The [final acceptance]{.underline} demonstration cannot be realized on azure, google cloud etc.

## Functionality Acceptance Criteria

> Additionally, to the acceptance requirements in the functional description, the following criteria must be considered.

##### \[CP.NOTAR.E1.00062\] Credential Issuance 

> When a DID Document contains multiple Protocols, all of the used wallets contain the issued credential after an notarization.


##### \[CP.NOTAR.E1.00063\] Trustlist Integration 

> The enrollments MUST be visible over the DNS resolvers and the trustlists MUST be updated with the new notarized items. Additionally, the notarization MUST provide the trust list endpoints and DNS zones per public profile with the notarization DID Document.

##### \[CP.NOTAR.E1.00064\] Decision Engine Integration 

> It MUST demonstrate that the notarization API can automatically make decisions for issuing based on OAW and TSA policy outcomes. Note: OAW and TSA MUST be integrated in the demonstration to show the functionality. The environment for these components will be provided by the principal for testing.

# Appendix A: Glossary 

> For the glossary refer to IDM.AO Glossary/Terminology \[IDM.AO\].

# Appendix B: Architecture 

![](./media/image4.png)
