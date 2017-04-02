#!/bin/bash

##
 #
 # Sample provisioning script
 #
 #   Please go to the section "User configurable options"
 #
 ##



# check for args

# if none, print instructions

# get project dir from arg

# check project dir exists and not empty

# rest of provisioning follows here in template

##
 #
 # User configurable options
 #
 #   Read through and edit these options to
 #   tailor to your target project
 #
 ##

# supports 'latest', '4.7.3', '4.6.1-RC1'
WP_VERSION='latest'
# supports 'latest', '5.3'
PHP_VERSION='latest'
# supports 'plugin_development', 'theme_development', 'custom'
ENVIRONMENT='plugin_development'

# supports 'mariadb', 'mysql', 'mysqli'
MYSQL='mariadb'

# check above options are matched in matrix 

DOCKER_IMAGE=$(SOMETHING_BASED_ON_CONFIG_CHECK)

# check dependencies for provisioning are met

# do we have docker? 

#  



