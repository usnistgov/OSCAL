FROM ubuntu:22.04 as oscal-os-dependencies

ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        apt-utils build-essential git jq libxml2-utils maven nodejs npm python3-pip unzip wget && \
    apt-get clean

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

ENV SAXON_HOME=/opt/oscal
ENV CALABASH_HOME=${SAXON_HOME}
ENV SAXON_CP="/opt/oscal/*"
ENV PATH=/oscal/build/metaschema/support/xspec/bin:/opt/oscal/node_modules/.bin:${PATH}

RUN git config --global --add safe.directory /oscal

ENTRYPOINT ["/bin/bash"]
