# oscalkit - OSCAL conversion utility
# Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

GOOS ?= darwin
GOARCH ?= amd64
LDFLAGS=-ldflags "-s -w"
BINARY=oscalkit_$(GOOS)_$(GOARCH)

.DEFAULT_GOAL := $(BINARY)
.PHONY: clean test push opencontrol $(BINARY)

test:
	docker container run \
		-v $$PWD:/go/src/github.com/usnistgov/OSCAL/oscalkit \
		-w /go/src/github.com/usnistgov/OSCAL/oscalkit \
		golang:1.9 \
		sh -c "go test \$$(go list ./... | grep -v /vendor/)"

build-docker:
	docker image build -t usnistgov/oscalkit .

push: build-docker
	docker image push usnistgov/oscalkit:latest

$(BINARY):
	docker container run --rm \
		-v $$PWD:/go/src/github.com/usnistgov/OSCAL/oscalkit \
		-w /go/src/github.com/usnistgov/OSCAL/oscalkit \
		golang:1.9 \
		sh -c 'GOOS=${GOOS} GOARCH=${GOARCH} go build -v ${LDFLAGS} -o ${BINARY}'

# Convert Docker EE OpenControl example project to OSCAL-formatted JSON "implementation"
opencontrol: clean $(BINARY)
	cp -r $$GOPATH/src/github.com/docker/compliance/examples/opencontrol/DockerEE-Moderate-ATO/ DockerEE-Moderate-ATO/
	cd DockerEE-Moderate-ATO/ && \
		compliance-masonry get
	./${BINARY} convert opencontrol DockerEE-Moderate-ATO/opencontrol.yaml DockerEE-Moderate-ATO/opencontrols/
	rm -rf DockerEE-Moderate-ATO/ ./${BINARY}

clean:
	if [ -f "opencontrol-oscal.json" ]; then rm "opencontrol-oscal.json"; fi
	if [ -f ${BINARY} ]; then rm ${BINARY}; fi
