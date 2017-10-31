FROM golang:1.9-alpine AS builder
WORKDIR /go/src/github.com/usnistgov/OSCAL/oscalkit
COPY . .
RUN CGO_ENABLED=0 go install -v -ldflags="-s -w"

FROM alpine:3.6
RUN apk --no-cache add ca-certificates libxml2-utils
WORKDIR /oscalkit
COPY --from=builder /go/bin/oscalkit /oscalkit-linux-x86_64
RUN ln -s /oscalkit-linux-x86_64 /usr/local/bin/oscalkit
ENTRYPOINT ["oscalkit"]
