FROM ubuntu:22.04 as base-environment

ADD ./ci-cd/python/requirements.txt .

ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get dist-upgrade -y

FROM base-environment as oscal-dependencies

ARG saxonversion
ARG hugoversion
ARG calabashversion

RUN apt-get install -y apt-utils build-essential git jq libxml2-utils maven nodejs npm python3-pip unzip wget && apt-get clean
RUN npm install -g npm n
RUN n latest
RUN npm install --loglevel verbose -g ajv-cli@"^4.0.x" ajv-formats@"^1.5.x" json-diff markdown-link-check yaml-convert@"^1.0.x" yargs
RUN pip3 install -r requirements.txt

#RUN useradd --create-home --home-dir /home/user user
#USER user

ENV SAXON_VERSION=${saxonversion}

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=${SAXON_VERSION}

ENV HUGO_VERSION=${hugoversion}
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
RUN dpkg -i hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

# calabash
ENV CALABASH_VERSION=${calabashversion}
ENV CALABASH_HOME=/dependencies/calabash
RUN wget https://github.com/ndw/xmlcalabash1/releases/download/${CALABASH_VERSION}/xmlcalabash-${CALABASH_VERSION}.zip
RUN mkdir -p "${CALABASH_HOME}"
RUN unzip -d "${CALABASH_HOME}" "xmlcalabash-${CALABASH_VERSION}.zip"
RUN f=`ls -d "${CALABASH_HOME}"/*| xargs` && mv "${CALABASH_HOME}"/*/* "${CALABASH_HOME}" && rmdir "${f}"

#RUN chown -R user:user /home/user

FROM oscal-dependencies as oscal-base
VOLUME ["/oscal"]
WORKDIR /oscal

FROM oscal-base as cli

ENTRYPOINT ["/bin/bash"]
