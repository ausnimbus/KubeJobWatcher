FROM golang:1.8-alpine
MAINTAINER Erin Corson

ENV KUBECTL_VERSION v1.5.2

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl /bin/kubectl

#copy the source files
RUN chmod +x /bin/kubectl
ADD . /usr/local/go/src/kubejobwatcher

#switch to our app directory
WORKDIR /usr/local/go/src/kubejobwatcher
CMD ["go", "run", "main.go"]
