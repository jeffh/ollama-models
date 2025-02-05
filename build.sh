#!/bin/bash

set -xe

./convert.sh intfloat/multilingual-e5-large:f32,f16,q8_0 \
    intfloat/multilingual-e5-large-instruct:f32,f16,q8_0 \
    sentence-transformers/all-MiniLM-L6-v2:f32,f16,q8_0

./generate-ollamas.sh intfloat/multilingual-e5-large:f32,f16,q8_0 \
    intfloat/multilingual-e5-large-instruct:f32,f16,q8_0 \
    sentence-transformers/all-MiniLM-L6-v2:f32,f16,q8_0

./push-ollamas.sh intfloat/multilingual-e5-large:f32,f16,q8_0 \
    intfloat/multilingual-e5-large-instruct:f32,f16,q8_0 \
    sentence-transformers/all-MiniLM-L6-v2:f32,f16,q8_0
