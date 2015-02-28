#!/bin/sh

BUCKET=${1}
PROFILE=${2}

aws s3 rm s3://${BUCKET} --recursive --profile ${PROFILE}
aws s3 cp . s3://${BUCKET} --recursive \
    --exclude ".git/*" \
    --exclude ".idea/*" \
    --exclude ".gitignore" \
    --exclude "deploy.sh" \
    --grants full=uri=http://acs.amazonaws.com/groups/global/AllUsers \
    --profile ${PROFILE}