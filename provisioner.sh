#!/bin/bash

# check for  2 args
if [ "$#" -ne 2 ]; then
    echo "Missing arguments"
    echo ""
    echo "./provisioner.sh TEMPLATE_PATH PROJECT_PATH"
    exit 1
fi

# assign vars from args
TEMPLATE_PATH=$1
PROJECT_PATH=$2

# check template exists and not empty
if find "$TEMPLATE_PATH" -mindepth 1 -print -quit | grep -q .; then
    TEMPLATE_NAME=$(echo "$TEMPLATE_PATH" | sed 's/templates\///')
    echo Using template: $TEMPLATE_NAME
else
    echo The directory $TEMPLATE_PATH is empty '(or non-existent)'
    exit 1
fi

# check project dir exists and not empty
if find "$PROJECT_PATH" -mindepth 1 -print -quit | grep -q .; then
    echo Using project in directory: $PROJECT_PATH
else
    echo The directory $PROJECT_PATH is empty '(or non-existent)'
    exit 1
fi

# rest of provisioning follows here in template
