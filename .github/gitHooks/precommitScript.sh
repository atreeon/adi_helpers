#!/bin/sh

pub run test > /dev/null 2>&1
EXIT_CODE_LAST=$?
#echo "pub run test wad_front_end_logic: ${EXIT_CODE_LAST}"
if [ $EXIT_CODE_LAST != "0" ] ; then
  echo "testing failed"
  exit 1; fi;

echo "success"
exit 0
