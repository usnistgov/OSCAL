FROM openjdk:8-jre-alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*

ARG version=9.8.0-12

ENV SAXON_HOME=/src
WORKDIR /src

# metaschema xml as arg

# Download Saxon jar from maven central
RUN wget -O /src/saxon.jar https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/$version/Saxon-HE-$version.jar

COPY . /src


CMD ["java", "-jar", "/saxon.jar"]

# Build Workflow
#docker build -t usnistgov/oscal .
#docker run --rm -v $PWD/build -w /build/schema/metaschema usnistgov/oscal ./run-metaschema.sh oscal-catalog-metaschema.xml
#docker run --rm -v $PWD/build -w /build/schema/metaschema usnistgov/oscal run-metaschema.sh oscal-profile-metaschema.xml