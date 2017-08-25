FROM alpine:3.3
ENV GOPATH /go
ENV GO15VENDOREXPERIMENT 1
RUN apk add --no-cache curl git go make ;\
    go get github.com/barnybug/cli53 ;\
    cd $GOPATH/src/github.com/barnybug/cli53 ;\
    make install ;\
    rm -Rf $GOPATH/src /var/cache/apk/* ;\
    apk del git go make
ENV PORT 9083
ADD metastore_host_update.sh /usr/bin/metastore_host_update.sh
#ENTRYPOINT ["/go/bin/cli53"]
CMD /usr/bin/metastore_host_update.sh
