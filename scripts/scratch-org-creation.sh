#!/bin/bash
set -e

sf org create scratch \
    --definition-file config/project-scratch-def.json \
    --set-default \
    --duration-days 3 \
    --wait 30 \
    --alias NN-scratch

sf project deploy start  \
    --source-dir force-app/main/default/classes \
    --target-org NN-scratch

sf apex run test \
    --test-level RunLocalTests \
    --result-format human \
    --code-coverage \
    --wait 30

sf org open \
    --target-org NN-scratch
