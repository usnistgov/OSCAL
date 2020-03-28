
FROM ubuntu:18.04

ARG saxonversion
ARG schematrondir
ARG oscaltoolsdir

RUN apt-get update && apt-get install -y apt-utils libxml2-utils jq maven hugo nodejs npm build-essential python3-pip git && apt-get clean
RUN npm install -g prettyjson markdown-link-check json-diff
RUN pip3 install lxml

RUN useradd --create-home --home-dir /home/user user
USER user

RUN mkdir "${schematrondir}" && git clone --depth 1 --no-checkout https://github.com/Schematron/schematron.git "${schematrondir}" && cd "${schematrondir}" && git checkout master -- trunk/schematron/code
RUN mkdir "${oscaltoolsdir}" && git clone --depth 1 https://github.com/usnistgov/oscal-tools.git "${oscaltoolsdir}" && cd "${oscaltoolsdir}/json-cli" && mvn install
RUN mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=${saxonversion}

RUN chown -R user:user /home/user

VOLUME ["/oscal"]
WORKDIR /oscal

ENTRYPOINT /bin/bash
