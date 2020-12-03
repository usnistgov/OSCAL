
FROM ubuntu:18.04

ARG saxonversion
ARG hugoversion

RUN apt-get update && apt-get install -y wget apt-utils libxml2-utils jq maven nodejs npm build-essential python-pip git && apt-get clean
RUN npm install -g prettyjson markdown-link-check json-diff ajv-cli
RUN pip install lxml

#RUN useradd --create-home --home-dir /home/user user
#USER user

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=${saxonversion}

RUN wget https://github.com/gohugoio/hugo/releases/download/v${hugoversion}/hugo_extended_${hugoversion}_Linux-64bit.deb
RUN dpkg -i hugo_extended_${hugoversion}_Linux-64bit.deb

#RUN chown -R user:user /home/user

VOLUME ["/oscal"]
WORKDIR /oscal

ENTRYPOINT /bin/bash
