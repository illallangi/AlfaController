FROM python:3.8.3
LABEL maintainer="Andrew Cole <andrew.cole@illallangi.com>"

WORKDIR /usr/src/app

ENV KUBERNETES_VERSION=v1.18.3
ADD https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

ADD AlfaController AlfaController

RUN chmod +x /usr/local/bin/kubectl AlfaController

CMD ./AlfaController