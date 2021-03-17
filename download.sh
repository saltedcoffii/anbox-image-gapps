#!/bin/bash
mkdir -v ./src || exit 1
cd ./src || exit 1

#if [[ -e $(aria2c) ]]; then
#  DOWNLOADER="aria2c"
if [[ -e $(which curl) ]]; then
  DOWNLOADER="curl -LO"
  STDOUT_DOWNLOADER="curl -L"
elif [[ -e $(which wget) ]]; then
  DOWNLOADER="wget"
  STDOUT_DOWNLOADER="wget -O -"
else
  printf "Could not find a valid downloader.\nPlease install curl, wget or aria2."
  exit 1
fi

export imgver=2018.07.19
export imgver2=${imgver//./\/}
export _gapps_rel="$(${STDOUT_DOWNLOADER} https://api.opengapps.org/list | sed -r 's/.*-x86_64-7.1-pico-([0-9]+).zip".*/\1/')"
export _gapps_src="https://downloads.sourceforge.net/project/opengapps/x86_64/$_gapps_rel/open_gapps-x86_64-7.1-pico-$_gapps_rel.zip"

${DOWNLOADER} "https://build.anbox.io/android-images/$imgver2/android_amd64.img"
${DOWNLOADER} "https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_y.sfs"
${DOWNLOADER} "https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_z.sfs"
${DOWNLOADER} "$_gapps_src"
${DOWNLOADER} "$_gapps_src.md5"
