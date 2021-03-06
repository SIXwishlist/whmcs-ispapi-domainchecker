#!/bin/bash

# THIS SCRIPT UPDATES THE HARDCODED VERSION
# IT WILL BE EXECUTED IN STEP "prepare" OF
# semantic-release. SEE package.json

# version format: X.Y.Z
newversion="$1";
branch="$2";
date="$(date +'%Y-%m-%d')";

if [ "$branch" = "master" ]; then
    sed -i "s/\$module_version = \"[0-9]\+\.[0-9]\+\.[0-9]\+\"/\$module_version = \"${newversion}\"/g" modules/addons/ispapidomaincheck/ispapidomaincheck.php
    sed -i "s/\"version\": \"[0-9]\+\.[0-9]\+\.[0-9]\+\"/\"version\": \"${newversion}\"/g" release.json
    sed -i "s/\"date\": \"[0-9]\+-[0-9]\+-[0-9]\+\"/\"date\": \"${date}\"/g" release.json
fi;
