#!/bin/sh

cd .repository
git init
git add .
git commit -m init

echo -n "Please input a keyword.>>>"
read KEY
echo $KEY >.keytest
