FROM markbnj/alpine-maven:3.3.9
MAINTAINER betz.mark@gmail.com

ENV JENA_HOME=/opt/apache-jena-3.0.1 \
    FUSEKI_HOME=/opt/apache-jena-fuseki-2.3.1

ENV PATH=${PATH}:${JENA_HOME}/bin:${FUSEKI_HOME}

RUN cd opt && \
    curl -s -o apache-jena-3.0.1.tar.gz http://apache.mesi.com.ar/jena/binaries/apache-jena-3.0.1.tar.gz && \
    tar -xvzf apache-jena-3.0.1.tar.gz && \
    rm apache-jena-3.0.1.tar.gz && \
    curl -s -o apache-jena-fuseki-2.3.1.tar.gz http://apache.mesi.com.ar/jena/binaries/apache-jena-fuseki-2.3.1.tar.gz && \
    tar -xvzf apache-jena-fuseki-2.3.1.tar.gz && \
    rm apache-jena-fuseki-2.3.1.tar.gz

ENTRYPOINT ["fuseki-server", "--update"]