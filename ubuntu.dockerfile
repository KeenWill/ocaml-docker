FROM ubuntu:20.04

ARG TZ=America/New_York
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git m4 bubblewrap make clang build-essential python3.9 python3-pip bash pkg-config opam \
    && rm -rf /var/lib/apt/lists/*

RUN opam init --disable-sandboxing -a --shell=bash
RUN opam switch create 4.11.1
RUN opam clean
RUN eval $(opam env)
