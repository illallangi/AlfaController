FROM docker.io/library/python:3.8.3-alpine

ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    XDG_CONFIG_HOME=/config

WORKDIR /usr/src/app

ENV KUBERNETES_VERSION=v1.18.3
ADD https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ADD . /usr/src/app

RUN pip3 install .

ENTRYPOINT ["/usr/local/bin/alfa-controllr"]

ARG VCS_REF
ARG VERSION
ARG BUILD_DATE
LABEL maintainer="Andrew Cole <andrew.cole@illallangi.com>" \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.description="Creates Kubernetes resources by processing custom resources through a Jinja2 template" \
      org.label-schema.name="AlfaControllr" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url="http://github.com/illallangi/AlfaControllr" \
      org.label-schema.usage="https://github.com/illallangi/AlfaControllr/blob/master/README.md" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/illallangi/AlfaControllr" \
      org.label-schema.vendor="Illallangi Enterprises" \
      org.label-schema.version=$VERSION
