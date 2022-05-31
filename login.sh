#!/bin/bash

name=$(git config --global user.name)
email=$(git config --global user.email)

if [[ $name == "" ]] || [[ $email == "" ]]; then
  echo -n "git username: "
  read config_name

  echo -n "git email: "
  read config_email

  git config --global user.name $config_name
  git config --global user.email $config_email
fi

git config --global credential.helper store

git add .

git commit -m "Logging In"

git push
