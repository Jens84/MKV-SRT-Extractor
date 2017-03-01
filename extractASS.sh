#!/bin/bash

SOURCE="$( dirname "${BASH_SOURCE[0]}" )"

if [ -z "$1" ]
then
  echo "You must specify the .mvk file path"
  exit 1
fi

echo -e "\n$1"
mkvinfo "$1" | grep 'Nom :\|Numéro de piste\|Type de piste\|Une piste'
filename=`basename "$1" .mkv`
echo ""

read -p "Select the subtitles track ID (for mkvextract): " trackId
mkvextract tracks "$1" ${trackId}:${filename}.ass

echo "Converting .ass to .srt"
ruby "${SOURCE}/converter.rb" "${filename}.ass" > /dev/null

rm -f "${filename}.ass"

echo "Done"