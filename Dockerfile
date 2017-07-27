FROM openjdk:latest

LABEL maintainer="lucapazz"

ARG PDI_VERSION
ENV PDI_VERSION ${PDI_VERSION:-7.1}

ARG PDI_RELEASE
ENV PDI_RELEASE ${PDI_RELEASE:-7.1.0.0-12}

RUN mkdir /pentaho

WORKDIR /pentaho

RUN wget --progress=dot:giga http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${PDI_VERSION}/pdi-ce-${PDI_RELEASE}.zip && \
    unzip -q *.zip && \
    rm -f *.zip

ENTRYPOINT ["/bin/bash"]