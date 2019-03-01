#!/usr/bin/env bash
set -euo pipefail

# TODO move to ansible
rm -rf ${GOPATH:?}/{bin,pkg} "$(go env GOCACHE)"
nvim example.go +GoInstallBinaries +qa
gometalinter --install

# non-vim-go binaries that are not packaged some other way
go get -u -v github.com/onsi/ginkgo/ginkgo
