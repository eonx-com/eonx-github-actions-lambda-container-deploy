#!/usr/bin/env bash

export AWS_ACCESS_KEY_ID=${1}
export AWS_SECRET_ACCESS_KEY=${2}
export AWS_DEFAULT_REGION=${3}
export REPOSITORY_NAME=${4}
export SOURCE_PATH=${5}
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq -r .Account)

cd ${SOURCE_PATH};
aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com;
docker build -t ${REPOSITORY_NAME} .;
docker tag ${REPOSITORY_NAME}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION.amazonaws.com/${REPOSITORY_NAME}:${GITHUB_SHA};
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION.amazonaws.com/${REPOSITORY_NAME}:${GITHUB_SHA};
