#!/bin/bash

set -xe

./convert.sh intfloat/multilingual-e5-large:f32 intfloat/multilingual-e5-large:f16 intfloat/multilingual-e5-large:q8_0 \
    intfloat/multilingual-e5-large-instruct:f32 intfloat/multilingual-e5-large-instruct:f16 intfloat/multilingual-e5-large-instruct:q8_0

./generate-ollamas.sh intfloat/multilingual-e5-large:f32,f16,q8_0 \
    intfloat/multilingual-e5-large-instruct:f32,f16,q8_0

./push-ollamas.sh intfloat/multilingual-e5-large:f32,f16,q8_0 \
    intfloat/multilingual-e5-large-instruct:f32,f16,q8_0
