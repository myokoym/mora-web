#!/bin/sh

echo -n "Please input a keyword.>>>"
read KEY
echo $KEY >.key

cd .repository
git init
git add .
git commit -m init
