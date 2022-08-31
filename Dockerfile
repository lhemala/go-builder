FROM golang:1.19.0-alpine3.16

ENV GOLANGCI_VERSION 1.49.0
ENV GOTESTSUM_VERSION 1.8.2

RUN apk add --update upx git make build-base

RUN wget https://github.com/golangci/golangci-lint/releases/download/v$GOLANGCI_VERSION/golangci-lint-$GOLANGCI_VERSION-linux-amd64.tar.gz && \
	tar -xzf golangci-lint-$GOLANGCI_VERSION-linux-amd64.tar.gz golangci-lint-$GOLANGCI_VERSION-linux-amd64/golangci-lint && \
	rm golangci-lint-$GOLANGCI_VERSION-linux-amd64.tar.gz && \
	mv golangci-lint-$GOLANGCI_VERSION-linux-amd64/golangci-lint /usr/local/bin && \
	wget https://github.com/gotestyourself/gotestsum/releases/download/v$GOTESTSUM_VERSION/gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz && \
	tar -xzf gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz gotestsum && \
	rm gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz && \
	mv gotestsum /usr/local/bin
