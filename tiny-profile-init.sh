#!/bin/bash

git init .
git remote add origin https://github.com/johnweldon/tiny-profile
git fetch
git checkout -t origin/master -f
git submodule update --init --recursive

chmod 700 .ssh
chmod 600 .ssh/config
chmod 600 .ssh/authorized_keys
