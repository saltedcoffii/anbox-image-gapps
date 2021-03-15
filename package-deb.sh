#!/bin/bash
rm ./deb/anbox-image-gapps/var/ -rfv
mkdir -pv ./deb/anbox-image-gapps/var/lib/anbox/
cd ./src
cp -v android.img ../deb/anbox-image-gapps/var/lib/anbox/android.img

cd ../deb/anbox-image-gapps
find . -type f ! -regex '.*.hg.*' ! -regex '.*?debian-binary.*' ! -regex '.*?DEBIAN.*' -printf '%P ' | xargs md5sum > DEBIAN/md5sums

cd ..
dpkg -b ./anbox-image-gapps anbox-image-gapps-2018.07.19-amd64.deb

mv -v anbox-image-gapps-2018.07.19-amd64.deb ..
