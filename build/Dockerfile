FROM ubuntu:22.04 as oscal-os-dependencies

ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        apt-utils build-essential git jq libxml2-utils maven nodejs npm python3-pip unzip wget && \
    apt-get clean

FROM golang:1.19.5-bullseye as oscal-hugo-build

RUN mkdir -p /go/src/github.com/usnistgov/OSCAL/build

WORKDIR /go/src/github.com/usnistgov/OSCAL/build

ADD tools.go .
ADD go.mod .
ADD go.sum .

RUN go install -tags "extended" github.com/gohugoio/hugo

FROM oscal-os-dependencies as oscal-runtime-dependencies

RUN mkdir -p /opt/oscal

WORKDIR /opt/oscal

ADD ./ci-cd/python/requirements.txt .
ADD ./package.json .
ADD ./package-lock.json .
ADD ./pom.xml .

RUN npm ci && \
    pip3 install -r requirements.txt && \
    mvn dependency:copy-dependencies -DoutputDirectory=/opt/oscal

FROM oscal-runtime-dependencies as oscal-base
VOLUME ["/oscal"]
WORKDIR /oscal

FROM oscal-base as cli

COPY --from=oscal-hugo-build /go/bin/hugo /usr/local/bin

ENV SAXON_HOME=/opt/oscal
ENV CALABASH_HOME=${SAXON_HOME}
ENV PATH=/opt/oscal/node_modules/.bin:${PATH}

RUN git config --global --add safe.directory /oscal

ENTRYPOINT ["/bin/bash"]
