#!/bin/bash

# check for  2 args
if [ "$#" -ne 2 ]; then
    echo "Missing arguments"
    echo ""
    echo "./provisioner.sh TEMPLATE_NAME PROJECT_PATH"
    exit 1
fi

SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR
SCRIPT_DIR_FULL=$(pwd)
echo "Running WP Auto Provisioning script installed at $SCRIPT_DIR_FULL"

# assign vars from args
TEMPLATE_NAME=$1
PROJECT_PATH=$2
TEMPLATE_DIR="$SCRIPT_DIR_FULL/templates/$TEMPLATE_NAME"

# check template exists and not empty
if find $TEMPLATE_DIR -mindepth 1 -print -quit | grep -q .; then
    echo Using template: $TEMPLATE_NAME
else
    echo The directory $TEMPLATE_NAME is empty '(or non-existent)'
    exit 1
fi

# check project dir exists and not empty
if find "$PROJECT_PATH" -mindepth 1 -print -quit | grep -q .; then
    echo Using project in directory: $PROJECT_PATH
else
    echo The directory $PROJECT_PATH is empty '(or non-existent)'
    exit 1
fi

# load env vars from template

source $SCRIPT_DIR_FULL/templates/$TEMPLATE_NAME/options.env

echo env vars loaded:

env | grep WPAP_


#DOCKER_IMAGE=$('SOMETHING_BASED_ON_CONFIG_CHECK')

# check dependencies for provisioning are met

# do we have docker? 
command -v docker >/dev/null 2>&1 || { echo >&2 "docker not found, please install"; exit 1; }

# create temporary Dockerfile in template folder
touch $TEMPLATE_DIR/Dockerfile


