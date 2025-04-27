[TOC]

# GDPR Compliance Document
The objective of this document is to detail, the data being stored and proccessed by the TRAIN services.

During development the 7 design principles of the GDPR were continuously evaluated.

# Configuring Trust zones

## What information is stored

### Source User Information (Private)
When interacting with the TSPA as a private or natural user, the claims issued as part of an oidc access token are transmitted and temporarily stored by the TSPA. These claims can include:
1. email
2. name
3. roles

### Non private information
when configuring the trust framework a DID of some sort is created by or input into the TSPA component. This data is stored persistently as part of the TRAIN concept in the DNS records for the specified trust domain.

## How is the information stored and used
### Source User Information
The data is stored as a decoded version of the access token in the programs memory. It will be accessed only for authorization checks to determine whether a specific action is allowed or not.

When the system is running in debug mode, additional log information containing above data is generated and stored.

## Who can access the information
The user information is only accessible to system administrators via a memory dump.

In the case of debug logs, those logs are available to system administrators to pinpoint issues with the system.

## How long will the information stay 
### Source User Information
The source user information is removed after a request session has finished execution.

In the case of the logs, there is no defined retention period. The length of storage depends on rules by the operating entity. It is possible to wipe logs on request of affected Users.

### Extended data processing capabilities 
No further extended data processing is planned or expected at the time of writing this document.

# Resolving trust pointers

## What information is stored

### Non private information
To resolve the Trust zone information of any given VC, the TCR requires the issuer DID as input. Based on this, it will collect, use and return the full DID Document for the given issuer DID.

- DID of issuer
- Contents of the DID Document of the issuer

## How is the information stored and used
### Non private information
The issuer DID is used to resolve the public DID Document which contains pointers to the trust lists. The DID Document is verified and returned by the TCR as context for further usage by the client which called the TCR.
The issuer DID and DID Document are not stored in a persistant way, however they could remain for a while in caches used to improve performance of the system.

When the system is running in debug mode, additional log information containing above data is generated and stored.

## Who can access the information
The information stored can be used by the application itself, and system administrators who have direct cache access. Additionally, the client who provided the issuer DID as input, will receive the DID Document belonging to that DID. DID Documents are publicly accessible, so this does not violate GDPR rules.

In the case of debug logs, those logs are available to system administrators to pinpoint issues with the system.

## How long will the information stay 
### Non private information
The information is cleared when the caches are wiped, or the configured Time to live for the data is reached.

In the case of the logs, there is not defined retention period. The length of storage depends on rules by the operating entity. It is possible to wipe logs on request of affected Users.

### Extended data processing capabilities 

No further extended data processing is planned or expected at the time of writing this document.
