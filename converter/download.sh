#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "invalided number of args: $#"
    echo "usage: $0 HF_MODEL"
    exit 1
fi

function error() {
    echo "error: $@"
    exit 1
}

huggingface-cli login --token "${HF_TOKEN}" || error "failed to login to hugging face"

for ARG in "$@"
do
    HF_MODEL=`echo "$ARG" | awk -F ':' '{print $1}'`
    MODEL_NAME=`echo "$HF_MODEL" | awk -F '/' '{print $2}'`
    echo "Downloading ${HF_MODEL} as ${MODEL_NAME}..."

    # format can be one of: f32,f16,bf16,q8_0,tq1_0,tq2_0,auto
    # but auto may produce bf16, which is not common among all hardware
    FORMAT=`echo "$ARG" | awk -F ':' '{print $2}'`
    if [[ -z "${FORMAT}" ]]; then
        FORMAT=f32
    fi

    DL_DIR="hf-models/`echo "${HF_MODEL}" | sed 's/\//--/g'`"
    if [[ ! -e "${DL_DIR}" ]]; then
        huggingface-cli download "${HF_MODEL}" --local-dir "${DL_DIR}" || error "failed to download model: $HF_MODEL"
    fi
    python llama.cpp/convert_hf_to_gguf.py --outtype "${FORMAT}" --model-name "${MODEL_NAME}" --outfile /models "${DL_DIR}" || error "failed to convert model ${HF_MODEL}"
done
