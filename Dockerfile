# syntax = docker/dockerfile:1.2

FROM python:3.9 as base

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
        less \
        vim \
        gcc \
        build-essential \
        zlib1g-dev \
        wget \
        unzip \
        cmake \
        gfortran \
        libblas-dev \
        liblapack-dev \
        libatlas-base-dev \
        libasound-dev \
        libportaudio2 \
        libportaudiocpp0 \
        portaudio19-dev \
        ffmpeg \
        libsm6 \
        libxext6 \
        default-jre \
    && apt-get clean

# Get Rust; NOTE: using sh for better compatibility with other base images
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"


FROM base as build

SHELL ["/bin/bash", "-c"]

WORKDIR /leolani
COPY . ./

RUN make clean
RUN make build
RUN make build

#RUN make clean & make build & make build


# To build a specfic stage only use the --target option, e.g.:
# docker build --target build --tag build:0.0.1 .
FROM base as leolani

COPY --from=build /leolani/cltl-leolani-app /leolani/cltl-leolani-app/
COPY --from=build /root/nltk_data /root/nltk_data

WORKDIR /leolani/cltl-leolani-app

RUN rm spacy.lock; make spacy.lock project_dependencies=""

WORKDIR /leolani/cltl-leolani-app/py-app
CMD source /leolani/cltl-leolani-app/venv/bin/activate && python app.py
