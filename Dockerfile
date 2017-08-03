FROM openjdk:latest

LABEL maintainer="lucapazz"

ARG GIT_BRANCH
LABEL git.branch="${GIT_BRANCH}"

ARG GIT_COMMIT
LABEL git.commit="${GIT_COMMIT}"

ARG GIT_MESSAGE
LABEL git.message="${GIT_MESSAGE}"

ARG PDI_VERSION
ENV PDI_VERSION ${PDI_VERSION:-7.1}

ARG PDI_RELEASE
ENV PDI_RELEASE ${PDI_RELEASE:-7.1.0.0-12}

WORKDIR /pentaho

RUN wget --progress=dot:giga http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${PDI_VERSION}/pdi-ce-${PDI_RELEASE}.zip && \
    unzip -q *.zip && \
    rm -f *.zip

ENTRYPOINT ["/bin/bash"]