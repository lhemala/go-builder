FROM golang:1.16.4

ENV GOLANGCI_VERSION 1.37.1
ENV GOTESTSUM_VERSION 1.6.4

RUN apt update && apt install -y upx-ucl

RUN wget https://github.com/golangci/golangci-lint/releases/download/v$GOLANGCI_VERSION/golangci-lint-$GOLANGCI_VERSION-linux-amd64.deb && \
	dpkg -i golangci-lint-$GOLANGCI_VERSION-linux-amd64.deb && \
	rm golangci-lint-$GOLANGCI_VERSION-linux-amd64.deb && \
	wget https://github.com/gotestyourself/gotestsum/releases/download/v$GOTESTSUM_VERSION/gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz && \
	tar -xzf gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz gotestsum && \
	rm gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz && \
	mv gotestsum /usr/local/bin