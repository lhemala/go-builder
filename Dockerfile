FROM golang:1.15.6

ENV GOLANGCI_VERSION 1.35.2

RUN apt update && apt install -y upx-ucl

RUN wget https://github.com/golangci/golangci-lint/releases/download/v$GOLANGCI_VERSION/golangci-lint-$GOLANGCI_VERSION-linux-amd64.deb && \
	dpkg -i golangci-lint-$GOLANGCI_VERSION-linux-amd64.deb && \
	rm golangci-lint-$GOLANGCI_VERSION-linux-amd64.deb

