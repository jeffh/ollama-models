#!/bin/bash

set -xe

for ARG in "$@"
do
    MODEL_NAME=`echo "$ARG" | awk -F ':' '{print $1}' | sed 's/\//-/g'`
    TAGS=`echo "$ARG" | awk -F ':' '{print $2}'`
    IFS="," read -ra TAG <<< "$TAGS"
    for tag in "${TAG[@]}"; do
        ollama create "jeffh/${MODEL_NAME}:${tag}" -f "modelfiles/${MODEL_NAME}-${tag}.Modelfile"
    done
done
