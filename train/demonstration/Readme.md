[[_TOC_]]

# Fully working Demo/Getting Started Setup
This Guide aims to provide all necessary steps to setup a fully working Train instance on a production grade kubernetes cluster! Steps to setup a specific local version without the GUI components can be found here: [Local Setup](./local/Readme.md)

# Prerequisites
Before you begin with setting up the components and discovering the functionality, you must have the following items ready for use:

## Kubernetes Cluster
A fully functional deployment only on localhost with docker-compose for example is not possible, as keycloak will create tokens, that can not be validated as the UI will always see keycloak as localhost, whereas other components see it with a hostname. This mismatch prevents the full setup.

We will therefore demonstrate TRAIN on a kubernetes cluster only, which comes with some prerequisites:

1. A fully working Kubernetes cluster with deploy rights on at least one namespace.
2. A Letsencrypt issuer that can generate valid SSL certs on the fly, OR a working wildcard certificate you can use in the nginx ingress.

## Domains

To make the components reachable properly via the public internet, you must provide public domains for each major component. Generally these are freely choosable, we will use the following domains for later reference in this manual:
1. tcr.train1.xfsc.dev -> TRAIN Trust Validator Component
2. tspa.train1.xfsc.dev -> Trust Framework Manager Component
3. tspa-ui.train1.xfsc.dev -> Trust Framework Manager UI Component
4. zonemanager.train1.xfsc.dev -> TRAIN Domain Zone Manager Component
5. ns1.trust.train1.xfsc.dev -> Nameserver domain where PTR and URI Records will be published.
6. DNS Entries as required pointing to the loadbalancer IP of your Kubernetes Cluster. Each Deployed component requires an A record. Additionally an NS record pointing to ns1.trust.train1.xfsc.dev must be created.

## OIDC Authentication
A working OIDC Authentication Provider e.g. Keycloak is required. It can be deployed on the same Cluster as the other components, but its Setup is out of scope of this document. Refer to keycloak helm charts from [bitnami](https://bitnami.com/stack/keycloak/helm). An Example Realm is attached in the `resources` folder. Generally speaking there must be two Oauth2 Clients defined, one for TFM and one for TDZM. Each should put the client-id in the audience claim of the id and access token. The TDZM Token must support client-credentials as well as authorization_code grants. You can use **any** oauth2 compatible product.

## Did
You must be in control of a did, which means you must be able to modify the did-document. **IF** you choose a did:web you **MUST** make sure it is configured to be a well-known web did, as this is enforced for did:web

# Setup
We will not go into a lot of details in this section. Mainly refer to the installation manuals for each component. We will however mark the most common pitfalls, and possible troubleshooting tips.

## TRAIN Trust Validator (TTV) Setup
Follow the [Installation Manual](https://gitlab.eclipse.org/eclipse/xfsc/train/trusted-content-resolver/-/tree/main/docs/install?ref_type=heads)

The TTV is comes with its own Universal Resolver instance, but you will need to setup drivers for any did methods you want to resolve. For demonstration purposes, we recommend using the uport driver only to resolve did:web methods. 

## Trust Framework Manager (TFM) Setup
Follow the [Installation Manual](https://gitlab.eclipse.org/eclipse/xfsc/train/trusted-content-resolver/-/tree/main/docs/install?ref_type=heads)

### Backend
For demonstration purposes, we choose to use the INTERNAL storage type of the TFM so we dont have to include an IPFS instance. You must have a web-did that you control to setup the tfm correctly!
We are using a fraunhofer web-did for our demonstration purposes.

### UI
Nothing really special needs to be noted for Frontend installation, besides the fact it HAS to run as a separate domain. The Frontend does NOT support running behind a URL prefix!

## TRAIN Domain Zone Manager (TDZM) Setup
Follow the [Installation Manual](https://gitlab.eclipse.org/eclipse/xfsc/train/dns-zone-manager/-/tree/master/docs/install?ref_type=heads)

The TDZM Component is deployed in two separate images, one for the backend, one for the frontend/ui. The installation manual covers both with their configuration options. Following will be tips for each part separately:

### Backend
The `zoneConfigFileContent` must be set with at least the correct TF_DOMAIN, TF_DOMAIN_IP, and PRIMARY_SERVER_NSD and PRIMARY_SERVER_IP. Secondary NSD Slaves are possible to configure, but those will **only** be pure NSD deployments. How to deploy pure NSD servers is out of scope of this demo.

Only the Primary will be the special TDZM container, which contains the options of programmatically setting the right Resource Records.

### UI
The UI is currently built to run on a pathPrefix `/ui`. you **must** leave the app_base_url_path as the default value! The `ui_host` should be the reachable domain name, such as `zonemgr.train1.xfsc.dev` and must not include the path prefix.

It is generally possible to run the UI on a different prefix, but this must be set during the build-step, which means the pre-built image only supports `/ui`.

# Functions

To use all the functionality provided by TRAIN we ask you to download and import the [Postman collection](./resources/TRAIN_collection.json) and corresponding [Environment for Alice](./resources/Demonstration%20Alice.json) and [Environment for Bob](./resources/Demonstration%20Bob.json)

You **MUST** Override the initial environment values where stated with your own values! Things like secrets, client ids etc change between your and our env, so you must put the correct values.

when you are ready **make sure to select the Demonstration environment in postman**. If it is not selected requests **WILL** fail. This is often an issue, so please ensure you selected the environment!

The environments are pretty much the same, except they have different federation names, so we can manage one set of TSP and DNS records for "Alice", and one different set for "Bob". The environments make it easier to switch between the two.

## Managing Trust Information via TFM
Follow the folders `01. Create Trust Lists` to `07. View Updated TSPs` to run through all functionalities offered by the TFM.

### Short excursion: TFM UI
We are focusing on using the REST API to manage aspects of the TRAIN trust frameworks, but you can of course also use the UI to publish information. To use it simply navigate with your browser to the domain you are using to host the TFM UI. For our demonstration we typically use `https://tspa-ui.train1.xfsc.dev`

## Publishing Zones via TFM
To publish zones via the TFM component and see the integration between both components, follow the requests in the folder: `08.Publish to DNS`

In addition to simply publishing the did and trust-framework name you **must** make some changes to the did document of the did you are publishing. The did-document MUST contain an serviceEnpoint, which points to the enveloping VC that was created by the TFM in Step 'Managing Trust Information via TFM'.

For each Trust Framework your did should support, you MUST add a corresponding entry in the `service` section of the document. Example from our demo:

```json
...
  "service": [
    {
      "id": "did:web:essif.iao.fraunhofer.de#gx-trust-list-issuer-public",
      "type": "gx-trust-list-issuer-public",
      "serviceEndpoint": "https://tspa.train1.xfsc.dev/tspa-service/tspa/v1/alice.trust.train1.xfsc.dev/vc/trust-list"
    },
    {
      "id": "did:web:essif.iao.fraunhofer.de#gx-trust-list-issuer-public",
      "type": "gx-trust-list-issuer-public",
      "serviceEndpoint": "https://tspa.train1.xfsc.dev/tspa-service/tspa/v1/bob.trust.train1.xfsc.dev/vc/trust-list"
    },
  ],
...
```

## Publishing Zones manually
If you wish to manually publish zones, you can checkout the folder `TDZM - API` where we have all requests required to manually publish a zone. You will need to adapt the request bodies before sending though!

## Viewing Published Zone Content:

you can either use the `GET Zone Data` request from the `TDMZ - API` requests folder, or use the ui by navigating to `https://<tdzm_host>/ui`. You will be redirected to the login page, and after a successful login you will be presented with the current content of the tdzm zonefiles. 

## Resolving Trust Pointers:

To resolve the pointers we just set with our example requests, we use the folder `09. Use TTV`. The requests there will make use of the TFM hosted VC and trust lists, as well as the DNS entries for the URI and PTR records.

## Health Checks:
Each component (TDZM, TFM and TTV) provide a health check route that can be used by monitoring systems or manually to determine the health status.
You can find those in the requests folder `Misc - Dont run for exercise`
