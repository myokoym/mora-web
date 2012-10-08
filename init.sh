#!/bin/sh

cd .repository
git init
git add .
git commit -m init

touch .key
echo Please edit .key file.
