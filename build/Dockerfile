
FROM ubuntu:20.04

ARG saxonversion
ARG hugoversion

ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y wget apt-utils libxml2-utils jq maven nodejs npm build-essential python3-pip git && apt-get clean
RUN npm install -g npm n
RUN n latest
RUN npm install -g markdown-link-check json-diff ajv-formats@"^1.5.x" ajv-cli@"^4.0.x" yaml-convert@"^1.0.x"
RUN pip3 install lxml

#RUN useradd --create-home --home-dir /home/user user
#USER user

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=${saxonversion}

RUN wget https://github.com/gohugoio/hugo/releases/download/v${hugoversion}/hugo_extended_${hugoversion}_Linux-64bit.deb
RUN dpkg -i hugo_extended_${hugoversion}_Linux-64bit.deb

#RUN chown -R user:user /home/user

VOLUME ["/oscal"]
WORKDIR /oscal

ENTRYPOINT /bin/bash
