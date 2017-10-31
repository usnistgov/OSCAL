GOOS ?= darwin
GOARCH ?= amd64
LDFLAGS=-ldflags "-s -w"
BINARY=oscalkit_$(GOOS)_$(GOARCH)

.DEFAULT_GOAL := $(BINARY)

test:
	docker run \
		-v $$PWD:/go/src/github.com/usnistgov/OSCAL/oscalkit \
		-w /go/src/github.com/usnistgov/OSCAL/oscalkit \
		golang:1.9 \
		sh -c "go test \$$(go list ./... | grep -v /vendor/)"

build-docker:
	docker build -t usnistgov/oscalkit .

push: build-docker
	docker push usnistgov/oscalkit:latest

$(BINARY):
	docker run --rm \
		-v $$PWD:/go/src/github.com/usnistgov/OSCAL/oscalkit \
		-w /go/src/github.com/usnistgov/OSCAL/oscalkit \
		golang:1.9 \
		sh -c 'GOOS=${GOOS} GOARCH=${GOARCH} go build -v ${LDFLAGS} -o ${BINARY}'

clean:
	if [ -f ${BINARY} ]; then rm ${BINARY}; fi

.PHONY: clean test push $(BINARY)
