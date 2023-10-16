#!/bin/sh

dart test

if [ $? -ne 0 ]; then
  echo "testing failed xyz"
  exit 1;
fi;

echo "success"
exit 0
