#!/bin/bash
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
export _gapps_md5="$(${STDOUT_DOWNLOADER} $_gapps_src.md5 | sed -r 's/^([0-9a-z]+).*/\1/')"
export _gapps_rel="$(${STDOUT_DOWNLOADER} https://api.opengapps.org/list | sed -r 's/.*-x86_64-7.1-pico-([0-9]+).zip".*/\1/')"
export _gapps_src="https://downloads.sourceforge.net/project/opengapps/x86_64/$_gapps_rel/open_gapps-x86_64-7.1-pico-$_gapps_rel.zip"

echo '------------------------------------------'
echo '26874452a6521ec2e37400670d438e33  android_amd64.img'
md5sum android_amd64.img
echo '------------------------------------------'
echo '7ebf618b1af94a02322d9f2d2610090b  houdini_y.sfs'
md5sum houdini_y.sfs
echo '------------------------------------------'
echo '5ca37e1629edb7d13b18751b72dc98ad  houdini_z.sfs'
md5sum houdini_z.sfs
echo '------------------------------------------'
cat  ./open_gapps-x86_64-7.1-pico-$_gapps_rel.zip.md5
md5sum open_gapps-x86_64-7.1-pico-$_gapps_rel.zip
echo '------------------------------------------'
echo ' '
echo "Do these match? If not, please delete everything in ./src and rerun the download script."
