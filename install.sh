#!/usr/bin/env bash

if [[ ! -d "${PREFIX}/opt" ]]; then
    command mkdir -p "${PREFIX}/opt"
fi

if [[ -d "${PREFIX}/opt/nuclei" ]]; then
    command rm -rf "${PREFIX}/opt/nuclei"
fi

if [[ -x "${PREFIX}/bin/nuclei" ]]; then
    command rm -f "${PREFIX}/bin/nuclei"
fi

command git clone --depth 1 \
    'https://github.com/projectdiscovery/nuclei' \
    "${PREFIX}/opt/nuclei"

cd "${PREFIX}/opt/nuclei"
command go mod tidy
command go build -v -o \
    "${PREFIX}/bin/nuclei" \
    "cmd/nuclei/main.go"
cd