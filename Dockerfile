FROM alpine:3.3
RUN apk add --no-cache git go make && rm -rf /var/cache/apk/*
ENV GOPATH /go
ENV GO15VENDOREXPERIMENT 1
RUN go get github.com/barnybug/cli53
RUN cd $GOPATH/src/github.com/barnybug/cli53 && make install && rm -Rf $GOPATH/src
ENTRYPOINT ["/go/bin/cli53"]

