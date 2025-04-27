[[_TOC_]]

# Local Setup of Train
If you dont have all prerequisites for the production grade setup, or you just want to play around with TRAIN and its underlying concepts this is the correct setup guide for you.
Some aspects of Train, such as the GUI Components will not be usable on this local instance, **unless** you have a publicly accessible keycloak instance.

# Prerequisites
On your local machine you need to have installed:
- Docker (latest)
- Docker Compose (ususally shipped with docker) latest
- Postman
- Git

Admin access is not required, as long as above prerequisites are usable.

## Did
It is recommended to be in control of your own did, so you can configure the did-document freely. If you choose to use a web-did it **must** be .well-known configured.

If you do not control your own did you can use the supplied fraunhofer did later in the steps. There you will only be able to verify the pre-built use cases by us.

# Setup
Setup for this local demo environment is very simple. Follow these steps:

1. Clone this git repo to a folder on your machine
2. Checkout the master branch with its latest commit
3. Open a Terminal and navigate to the folder containing this Readme
4. Change to the compose folder: `cd compose`
5. Run Docker compose to start the main TRAIN components: `docker compose up -d`
6. Start the did resolver components: `docker compose --env-file uni-resolver/unires.env -f uni-resolver/uni-resolver-web.yaml` - *Note this starts only the web did resolver components. To start the full universal resolver use "uni-resolver/uni-resolver-all-yaml"*

Thats it. You are now ready to use TRAIN on your local instance through REST requests!

# Functions

To use all the functionality provided by TRAIN we ask you to download and import the special local [Postman collection](./postman/TRAIN_Local_Demo.postman_collection.json) and corresponding [Environment](./postman/Federation_1.postman_environment.json)

We only provide a single federation for local demonstration to simplify the available requests. For a multi-federation local setup you can check out the [GaiaX workshop on Train](https://gitlab.eclipse.org/eclipse/xfsc/workshop/gxfs-tech-workshop-6-train/exercises)

when you are ready **make sure to select the Demonstration environment in postman**. If it is not selected requests **WILL** fail. This is often an issue, so please ensure you selected the environment!

## Managing Trust Information via TFM
Follow the folders `01. Create Trust Lists` to `07. View Updated TSPs` to run through all functionalities offered by the TFM.

## Publishing Zones via TFM
To publish zones via the TFM component and see the integration between both components, follow the requests in the folder: `08.Publish to DNS`

**Below section is only relevant if you want to use your own did and did-document!**
In addition to simply publishing the did and trust-framework name you **must** make some changes to the did document of the did you are publishing. The did-document MUST contain an serviceEndpoint, which points to the enveloping VC that was created by the TFM in Step 'Managing Trust Information via TFM'.

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
If you wish to manually publish zones, you can checkout the folder `TDZM - Requests` where we have all requests required to manually publish a zone. You will need to adapt the request bodies before sending though!

## Viewing Published Zone Content:

You can use the `GET Zone Data` request from the `TDMZ - API` requests folder.

## Resolving Trust Pointers:

To resolve the pointers we just set with our example requests, we use the folder `09. Use TTV`. The request there will make use of the TFM hosted VC and trust lists, as well as the DNS entries for the URI and PTR records.

## Health Checks:
Each component (TDZM, TFM and TTV) provide a health check route that can be used by monitoring systems or manually to determine the health status.
You can find those in the requests folder `Misc - Dont run for exercise`
