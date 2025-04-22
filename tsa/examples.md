# Examples

This file contains initial examples of how to use TSA

### Pre-requirements

I. Against **local setup**

* Install [Docker](https://docs.docker.com/engine/install/)
* Install [Docker-compose](https://docs.docker.com/compose/install/)
* Install [Golang - latest version](https://go.dev/doc/install) 
* Install [Postman](https://www.postman.com/downloads/)
* Follow the instructions in [workspace repository](https://gitlab.eclipse.org/eclipse/xfsc/tsa/workspace)

II. Against **existing environment**

* Install [Postman](https://www.postman.com/downloads/)
* Import [Postman collection](postman_collection.json)


### Exercises

1. Setup TSA locally via Workspace repository (Steps in https://gitlab.eclipse.org/eclipse/xfsc/tsa/workspace)

2. Create DID, which is resolvable by Universal resolver
    1. Create policy (Example: https://gitlab.eclipse.org/eclipse/xfsc/tsa/policies/-/blob/main/example/returnDID/1.0/policy.rego)
    2. Synchronize newly created policy with "Policy" service
    3. Evaluate Newly created policy (Example: https://vault.vereign.com/tsa/policy/policy/policies/example/returnDID/1.0/evaluation)
    4. It will return DID document

3. Create VC (Signer)
    - Hit signer service for "Create VC" - Example:
   ```curl
   curl --location 'https://vault.vereign.com/tsa/signer/v1/credential' \
    --header 'Content-Type: application/json' \
    --data '{
    "context": [
        "https://w3id.org/security/suites/jws-2020/v1",
        "https://schema.org"
    ],
    "credentialSubject": {
        "foo": "bar"
    },
    "issuer": "did:web:vault.vereign.com:tsa:policy:policy:policies:example:returnDID:1.0:evaluation",
    "key": "key1",
    "namespace": "transit"
    }'   
    ```

4. Sign arbitrary data (Signer)
    - Hit signer service endpoint - Example:
   ```curl
   curl --location 'https://vault.vereign.com/tsa/signer/v1/sign' \
    --header 'Content-Type: application/json' \
    --data '{
        "key": "key1",
        "namespace": "transit",
        "data": "SGVsbG8gd29ybGQ="
    }'
   ```

5. Policy Bundle Export/Import
   - Export
     1. Create export configuration directly in git - Example:
          ```json
           {
               "namespace": "transit",
               "key": "key1"
            }
        ```
     2. Sync policy along with the export configuration with Policy service    
     3. Hit Policy export endpoint - Example:
        ```curl
           curl --location 'https://vault.vereign.com/tsa/policy/policy/policies/example/examplePolicy/1.4/export'
        ```
      4. If all successful bundle will be downloaded as ZIP file


   - Import:
     1. Hit an endpoint to upload the exported ZIP - Example:
         ```curl
            curl --location 'https://vault.vereign.com/tsa/policy/v1/policy/import' \
            -form '=@"/path/to/bundle/zip/file/policies_example_examplePolicy_1.4.zip"'
         ```
         
     2. If successful - the policy from the bundle will be available for evaluation
     
6. Subscribe for Policy Changes
   - Hit end point with webhook information - Example:
    ```curl
   curl --location 'https://vault.vereign.com/tsa/policy/policy/policies/example/returnDID/1.0/notifychange' \
    --header 'x-location: www..yahoo..com' \
    --header 'Content-Type: application/json' \
    --data '{
        "subscriber": "subName",
        "webhook_url":"https://url-to-call-when-policy-changes.com"
    }'
    ```
   - Whenever this policy changes, it will hit the webhook URL

7. JSON Schema Validation for Policy Output
   - Add JSON output configuration for particular policy in git - Example:
    ```json
    {
     "type": "object",
     "properties": {
          "foo": {
                "type": "string"
          }
     },
     "required": [
          "foo"
     ]
    }
    ```
   - Sync configuration together with the policy with Policy service
   - Hit validate endpoint for this policy - Example:
    ```curl
   curl --location 'https://vault.vereign.com/tsa/policy/policy/policies/example/examplePolicy/1.4/validation' \
    --header 'Content-Type: application/json' \
    --data '{
        "foo": "barbaz"
    }'
    ```   
   - It will validate the output of the policy against JSON schema configuration

8. Policy Admin API
   - List policy API - Example:
    ```curl
   curl --location '{{policy_service_address}}/v1/policies'
    ```
   - Filter policies - one can add filters as query parameters - Example with filters:
    ```curl
    curl --location '{{policy_service_address}}/v1/policies?policyName=hello&locked=true&rego=true&data=true&dataConfig=true'
     ```

9. Setup Policy service without MongoDB
    - Policy service can be configured to use in-memory storage instead of MongoDB. Detailed documentation how to do it can be found [here](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy/-/blob/main/doc/memory-storage.md).

10. Policy Sync App
    - Documentation on how to use Policy Sync App can be found [here](https://gitlab.eclipse.org/eclipse/xfsc/tsa/policy/-/blob/main/cmd/sync/README.md).
    - Basic usage example:
    ```shell
    ./sync -repoURL="https://path/to/repo.git" -dbAddr="mongodb://localhost:27017/policy?directConnection=true" -dbUser="user" -dbPass="pass" -branch="feature-branch"
    ```
