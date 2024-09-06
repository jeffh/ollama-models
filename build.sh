#!/bin/bash

set -xe

./convert.sh intfloat/multilingual-e5-large:f32 intfloat/multilingual-e5-large:f16 intfloat/multilingual-e5-large:q8_0

ollama create jeffh/intfloat-multilingual-e5-large:latest -f modelfiles/intfloat-multilingual-e5-large-f32.Modelfile
ollama create jeffh/intfloat-multilingual-e5-large:f32    -f modelfiles/intfloat-multilingual-e5-large-f32.Modelfile
ollama create jeffh/intfloat-multilingual-e5-large:f16    -f modelfiles/intfloat-multilingual-e5-large-f16.Modelfile
ollama create jeffh/intfloat-multilingual-e5-large:q8_0   -f modelfiles/intfloat-multilingual-e5-large-q8_0.Modelfile

ollama push jeffh/intfloat-multilingual-e5-large:latest
ollama push jeffh/intfloat-multilingual-e5-large:f32
ollama push jeffh/intfloat-multilingual-e5-large:f16
ollama push jeffh/intfloat-multilingual-e5-large:q8_0
