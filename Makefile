BINARY_NAME=kubectl-sg4pod
VERSION=dev
REVISION=none
LDFLAGS=-ldflags "-X 'github.com/naka-gawa/kubectl-sg4pod/cmd/subcommand.version=$(VERSION)' -X 'github.com/naka-gawa/kubectl-sg4pod/cmd/subcommand.revision=$(REVISION)'"

.PHONY: all build test clean release

all: build

build:
	go build $(LDFLAGS) -o $(BINARY_NAME) -v ./cmd/main.go

test:
	go test -v ./... -count=1

clean:
	rm -f $(BINARY_NAME)

release:
	goreleaser release --snapshot --skip-publish --rm-dist
