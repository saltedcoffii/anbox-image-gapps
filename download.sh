#!/bin/bash
mkdir -v ./src
cd ./src
export imgver=2018.07.19
export imgver2=${imgver//./\/}
export _gapps_rel="$(curl -sL https://api.opengapps.org/list | sed -r 's/.*-x86_64-7.1-pico-([0-9]+).zip".*/\1/')"
export _gapps_src="https://downloads.sourceforge.net/project/opengapps/x86_64/$_gapps_rel/open_gapps-x86_64-7.1-pico-$_gapps_rel.zip"

curl -#LO "https://build.anbox.io/android-images/$imgver2/android_amd64.img"
curl -#LO "https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_y.sfs"
curl -#LO "https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_z.sfs"
curl -#LO "$_gapps_src"
curl -#LO "$_gapps_src.md5"
