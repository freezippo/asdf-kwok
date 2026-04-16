# asdf-kwok

[![Build](https://github.com/freezippo/asdf-kwok/actions/workflows/ci.yml/badge.svg)](https://github.com/freezippo/asdf-kwok/actions/workflows/ci.yml)

[kwok](https://github.com/kubernetes-sigs/kwok) plugin for the [asdf](https://github.com/asdf-vm/asdf) version manager.

## Installation

```shell
asdf plugin add kwok https://github.com/freezippo/asdf-kwok.git
asdf install kwok latest
asdf global kwok latest
```

## Usage

### Install

```shell
# Install the latest stable version
asdf install kwok latest

# Install a specific version
asdf install kwok 0.7.0

# Install the latest stable 0.6.x version
asdf install kwok latest:0.6

# Install all versions listed in .tool-versions
asdf install
```

### Set a Version

```shell
# Set the global version (writes to ~/.tool-versions)
asdf set -u kwok 0.7.0

# Set the version in the current directory (writes to .tool-versions)
asdf set kwok 0.7.0

# Use a specific version in the current shell session only
asdf shell kwok 0.7.0
```

### Inspect

```shell
# List installed versions
asdf list kwok

# List all available versions
asdf list all kwok

# Show the latest stable version
asdf latest kwok

# Show current version in use
asdf current kwok

# Show where a version is installed
asdf where kwok 0.7.0
```

### Uninstall

```shell
asdf uninstall kwok 0.7.0
```

See the [asdf commands documentation](https://asdf-vm.com/manage/commands.html) for the full list of available commands.

## Installed Binaries

This plugin installs both binaries provided by the [kwok](https://github.com/kubernetes-sigs/kwok) project:

| Binary | Description |
|--------|-------------|
| `kwok` | KWOK - Kubernetes WithOut Kubelet |
| `kwokctl` | CLI for managing KWOK clusters |

## Supported Platforms

| OS | Architecture |
|----|-------------|
| Linux | x86_64 (amd64) |
| Linux | aarch64 (arm64) |
| macOS | x86_64 (amd64) |
| macOS | aarch64 (arm64) |

## Dependencies

- `curl` — for downloading release binaries
- `git` — for listing available versions

## Checksum Verification

This plugin downloads pre-built binaries directly from the [official kwok releases](https://github.com/kubernetes-sigs/kwok/releases). Binaries are served over HTTPS with fail-on-error enabled (`curl -fsSL`).

## Links

- [kwok Homepage](https://kwok.sigs.k8s.io)
- [kwok GitHub](https://github.com/kubernetes-sigs/kwok)
- [asdf Documentation](https://asdf-vm.com)
