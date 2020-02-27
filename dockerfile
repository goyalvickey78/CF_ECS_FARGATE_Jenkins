FROM alpine:3.8

# Default evironment variables.
ENV AWS_DEFAULT_REGION us-east-1
ENV AWS_ACCESS_KEY_ID aws_key_id
ENV AWS_SECRET_ACCESS_KEY aws_Secret_key

COPY templates/New_ECS_Fargate_Para.yml .
COPY parameters/parameters.json .

RUN apk add -q --update \
    && apk add -q \
            python py-pip py-setuptools \
            ca-certificates \
    && pip install --upgrade pip \
    && pip install awscli \
    && pip install cfn-lint \
    && rm -rf /var/cache/apk/*
