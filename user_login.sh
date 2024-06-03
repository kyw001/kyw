#!/bin/bash

user=$1

if [ $# -ne 1 ]; 
then
  echo "인수가 1개가 아닙니다."
  exit 1
fi

while [ -z "$user" ]
do
  if who | grep -w "$user"; then
    echo "$user 로그인함!"
    exit 0
  fi
  sleep 60
done
