FROM python:3.8.3
LABEL maintainer="Andrew Cole <andrew.cole@illallangi.com>"

ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    XDG_CONFIG_HOME=/config

WORKDIR /usr/src/app

ENV KUBERNETES_VERSION=v1.18.3
ADD https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

ADD . /usr/src/app

RUN pip3 install .

ENTRYPOINT ["/usr/local/bin/alfa-controller"]