#!/usr/bin/env bash

# Add awesomekyle key to registries
jq '.transports.docker += {
    "ghcr.io/awesomekyle": [
        {
            "type": "sigstoreSigned",
            "keyPath": "/usr/etc/pki/containers/awesomekyle.pub",
            "signedIdentity": {
                "type": "matchRepository"
            }
        }
    ]
    }' /usr/etc/containers/policy.json > /tmp/policy.json
mv /tmp/policy.json /usr/etc/containers/policy.json
