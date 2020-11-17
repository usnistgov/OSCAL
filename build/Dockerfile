
FROM ubuntu:18.04

ARG saxonversion

RUN apt-get update && apt-get install -y apt-utils libxml2-utils jq maven hugo nodejs npm build-essential python-pip git && apt-get clean
RUN npm install -g prettyjson markdown-link-check json-diff ajv-cli
RUN pip install lxml

#RUN useradd --create-home --home-dir /home/user user
#USER user

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=${saxonversion}

#RUN chown -R user:user /home/user

VOLUME ["/oscal"]
WORKDIR /oscal

ENTRYPOINT /bin/bash
