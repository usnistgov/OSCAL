# oscalkit - OSCAL conversion utility
# Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

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
