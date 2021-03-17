#!/bin/bash

if [[ ! -e $(which dpkg) ]]; then
  printf "Could not find dpkg in \$PATH.\nPlease install dpkg or ensure it is in your \$PATH."
  exit 1
fi

rm ./deb/anbox-image-gapps/var/ -rfv || exit 1
mkdir -pv ./deb/anbox-image-gapps/var/lib/anbox/ || exit 1
cd ./src || exit 1
cp -v android.img ../deb/anbox-image-gapps/var/lib/anbox/android.img || exit 1

cd ../deb/anbox-image-gapps || exit 1
find . -type f ! -regex '.*.hg.*' ! -regex '.*?debian-binary.*' ! -regex '.*?DEBIAN.*' -printf '%P ' | xargs md5sum > DEBIAN/md5sums

cd .. || exit 1
dpkg -b ./anbox-image-gapps anbox-image-gapps-2018.07.19-amd64.deb || exit 1

mv -v anbox-image-gapps-2018.07.19-amd64.deb .. || exit 1
