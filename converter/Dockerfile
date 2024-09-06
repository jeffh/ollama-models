FROM python:3.12 AS builder

WORKDIR /workspace

RUN apt update && apt install git
RUN git clone --depth 1 https://github.com/ggerganov/llama.cpp.git llama.cpp
RUN pip install -r llama.cpp/requirements.txt

RUN pip install huggingface_hub
COPY download.sh download.sh
RUN mkdir /models

ENTRYPOINT ["./download.sh"]
