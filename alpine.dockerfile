FROM alpine:3

ARG TZ=America/New_York

RUN apk update \
    && apk add --no-cache --update m4 opam bubblewrap make clang gcc g++ python3 py3-pip git bash git pkgconfig

RUN opam init --disable-sandboxing -a --shell=bash
RUN opam switch create 4.11.1
RUN opam clean
RUN eval $(opam env)
