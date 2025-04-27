# TRAIN Documentation

[[_TOC_]]

## Description
This repository aims to hold TRAIN overarching documentation, that either applies to all components, or is relevant to understand TRAIN as a whole. It also holds project delivery artifacts and instructions on how to setup and run a demonstration environment.

## Further Reading:

### [Architecture Documentation (Domain Model)](./architecture/Readme.md)
### [GDPR Documentation](./concepts/gdpr/Readme.md)
### [Security Documentation](./concepts/security/Readme.md)
### [Test Concept](./concepts/test-concept/Readme.md)
### [Local Setup Instructions](./demonstration/local/Readme.md)
### [Production Grade Setup Instructions](./demonstration/Readme.md)
### [Initial Project Delivery Artifacts](./delivery/Readme.md)

## Frequently asked questions

**Q: Do I need my own DIDs to configure a Trust Framework?**

**A:** Yes, having your own DIDs is necessary to configure a Trust Framework effectively. Please note that a service endpoint must be included in the DID document. See the Train Trust Framework Manager [installation documentation](https://gitlab.eclipse.org/eclipse/xfsc/train/tspa/-/tree/master/doc/install?ref_type=heads). External resources on DID creation can be found in [this project](https://github.com/eclipse-tractusx/SSI-agent-lib).

**Q: Is a fully qualified domain required to configure a Zone Manager?**

**A:** Yes, a fully qualified domain is required. The Zone Manager relies on the DNS system to establish trust. Without a fully qualified domain, DIDs and trust lists published through the Train Trust Framework Manager cannot be resolved via DNS.

**Q: Is DNSSEC really needed for Zone Manager Deployment?**

**A:** While the Zone Manager is designed to utilize the DNSSEC extension for enhanced trust verification, it is technically possible to operate without DNSSEC. However, this is not recommended due to potential security risks.

**Q: Does Train Trust Framework Manager support different trust lists formats?**

**A:** Yes, it currently supports XML and JSON formats. You can access schemas and templates for both formats in the [provided documentation](https://gitlab.eclipse.org/eclipse/xfsc/train/tspa/-/tree/master/doc/TrustList_DataModel_Design?ref_type=heads).

**Q: How does VC Signing work?**

**A:** The signature of verifiable credentials can be realized via the [TSA Signer](https://gitlab.eclipse.org/eclipse/xfsc/tsa/signer). Additionally, an internal signing mechanism has been implemented to offer more flexibility. Please refer to the [setup documentation](https://gitlab.eclipse.org/eclipse/xfsc/train/tspa/-/tree/master/doc/install?ref_type=heads).

**Q: Can TRAIN be only used in a federation context?**

**A:** No. TRAIN provides an additional layer of security for various ecosystems at different levels. For example, an organization can operate its own trust framework covering different subsidiaries, vendors, partners, or departments where this additional layer of trust is required or bring value.

**Q: Can the Train Trust Validator client libraries be integrated into software for trust validation purposes?**

**A:** Yes, the TTV offers client libraries in various programming languages to facilitate integration. For detailed information on languages and integration, please refer to the [TTV documentation](https://gitlab.eclipse.org/eclipse/xfsc/train/trusted-content-resolver/-/tree/main/docs/client_api?ref_type=heads).

## Getting started
To get started with a basic federation setup you can refer to the [demonstration documentation](./demonstration/Readme.md)

## Authors and acknowledgment
The TRAIN Project is implemented with help by:
- [Andrei Danciuc](https://gitlab.eclipse.org/andreidanciuc)
- [Denis Sukhoroslov](https://gitlab.eclipse.org/dsukhoroslov)
- [Frank Kassigkeit](https://gitlab.eclipse.org/fkassigk)
- [Julius Helm](https://gitlab.eclipse.org/jhtsi)
- [Martin Siegloch](https://gitlab.eclipse.org/pmsmartin)
- [Michael Zigldrum](https://gitlab.eclipse.org/mzigldrum)
- [Isaac Henderson Johnson Jeyakumar](https://gitlab.eclipse.org/isaachenderson)
- [Juan Vargas](https://gitlab.eclipse.org/juanvargas)
- [Sirish Kalubhai Savaliya](https://gitlab.eclipse.org/sirish1911)
- [Michael Kubach](https://gitlab.eclipse.org/mkubach)

## License
TRAIN and its documentation is Open Source software released under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0.html).

## Glossary

You can view a Glossary for TRAIN [here](https://gitlab.eclipse.org/eclipse/xfsc/xfsc-spec-2/-/blob/main/docs/train/train.md?ref_type=heads#definitions-acronyms-and-abbreviations)
