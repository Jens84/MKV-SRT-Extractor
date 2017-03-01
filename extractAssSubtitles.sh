#!/bin/bash

SOURCE="$( dirname "${BASH_SOURCE[0]}" )"

if [ -z "$1" ]
then
  echo "You must specify a folder containing .mkv files"
  exit 1
fi

find "$1" -maxdepth 1 -name "*.mkv" -exec $SOURCE/extractASS.sh {} \;