# Architecture document for the GXFS Catalogue
## Documents
The content of the document is available here
* [PDF](
https://gitlab.com/gaia-x/data-infrastructure-federation-services/cat/architecture-document/-/jobs/artifacts/main/raw/build/pdf/architecture/catalogue-architecture.pdf?job=generate_pdf)
* [Website](https://gaia-x.gitlab.io/data-infrastructure-federation-services/cat/architecture-document/architecture/catalogue-architecture.html)

## CAT Enhancements - FACIS XFSC
The XFSC Federated Catalogue (CAT) manages metadata objects (typically credentials or other RDF descriptions, e.g., of Providers, their Service Offerings and Resources) throughout their life cycle and exposes them to Consumers. It enables verification of these objects against given schemas and/or trust anchors. 

This enhancement of the CAT modularizes its verification of credentials against trust anchors and generalizes its management of metadata objects beyond the former focus on credentials; thus, it will also be able to function as a Template Repository for the FACIS Digital Contract Service (DCS).

The enhanced specification can be found here : [PDF](https://github.com/Jessia2597/docs/blob/main/federated-catalogue/src/docs/CAT%20Enhancement/CAT_Enhancement_Specifications%20v1.0.pdf)
