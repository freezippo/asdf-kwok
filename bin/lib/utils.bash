#!/usr/bin/env bash
# Shared helper functions for asdf-kwok plugin scripts

get_platform() {
    uname | tr '[:upper:]' '[:lower:]'
}

get_arch() {
    local arch
    arch="$(uname -m)"
    case "${arch}" in
        x86_64 | amd64)
            echo "amd64"
            ;;
        aarch64 | arm64)
            echo "arm64"
            ;;
        *)
            echo "Unsupported architecture: ${arch}" >&2
            exit 1
            ;;
    esac
}

download_binary() {
    local component="$1"
    local version="$2"
    local dest_dir="$3"
    local platform
    platform="$(get_platform)"
    local arch
    arch="$(get_arch)"
    local filename="${component}-${platform}-${arch}"
    local github_base_url="https://github.com/kubernetes-sigs/kwok/releases/download"
    local download_url="${github_base_url}/v${version}/${filename}"
    local dest_path="${dest_dir}/${filename}"
    local tmp_path

    echo "Downloading ${component} from ${download_url}"
    mkdir -p "${dest_dir}"

    tmp_path="$(mktemp)"
    trap 'rm -f "${tmp_path}"' EXIT

    if ! curl -fsSL "${download_url}" -o "${tmp_path}"; then
        echo "Failed to download ${component} v${version} for ${platform}/${arch}" >&2
        exit 1
    fi

    chmod +x "${tmp_path}"
    mv "${tmp_path}" "${dest_path}"
    trap - EXIT
}
