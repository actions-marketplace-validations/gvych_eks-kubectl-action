FROM amazon/aws-cli:2.0.6 as aws

#FROM python:2.7.18-alpine3.11

#LABEL maintainer="Ian Belcher <github.com@ianbelcher.me>"

#ENV PYTHONIOENCODING=UTF-8

#RUN apk add --no-cache curl

#RUN pip install awscli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

#COPY --from=aws /usr/local/aws-cli/ /usr/local/aws-cli/

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
