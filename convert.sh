#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "usage: $0 HUGGINGFACE_MODELS..."
    echo
    echo "downloads a bunch of huggingface models to convert to gguf."
    echo "assumes HF_TOKEN env var is set"
    exit 1
fi

function exitError() {
    echo "error: $1"
    exit 2
}

IMAGE_NAME=hf-to-gguf
CONTAINER_NAME=hf-to-gguf-container

pushd converter
docker build -t ${IMAGE_NAME} . || exitError "failed to build converter"
popd

docker rm "${CONTAINER_NAME}" 2>/dev/null >/dev/null
docker run -e HF_TOKEN -i --name "${CONTAINER_NAME}" "${IMAGE_NAME}" $@
if [[ $? -ne 0 ]]; then
    exitError "failed to convert hf models: $@"
fi

docker cp "${CONTAINER_NAME}:/models/." "./modelfiles/models" || exitError "failed to copy over converted models"
