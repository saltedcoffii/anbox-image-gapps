# Anbox Image Gapps
## A collection of scripts to build a modified anbox image containing libhoudini and open-gapps for the amd64 architecture.
---

### \*\*IMPORTANT\*\*

This repository is a work in progress. The scripts are functional however they are not ready for production and the documentation is incorrect.

### Dependencies

These scripts depend on the following: squashfs-tools, binutils,as curl, tar, tarlz, coreutils, unzip, You can install these on Debian/Ubuntu by running `sudo apt install squashfs-tools binutils curl tar coreutils unzip tarlz`

### Installing

#### Installing on Debian-based distros:

These scripts have been tested on:
 - Debian 11 (bullseye)
 - Kali Linux (kali-rolling)

These scripts will almost certainly work on:
 - Debian Unstable (sid)
 - Ubuntu 19.04 (eoan)
 - Ubuntu 20.04 (focal)
 - Linux Mint 19
 - Linux Mint 20

These scripts are likely to work on:
 - Debian 10 (buster)
 - Ubuntu 18.04 (bionic)
 - Linux Mint 18

These scripts will not work on:
 - Debian 9 (stretch) or earlier
 - Ubuntu 16.04 (xenial) or earlier
 - Devuan (anbox requires systemd)

Installation is simple. Simply clone the repository into a working directory (your Downloads directory is fine.), and run the scripts in order:

`bash download.sh`

`bash verify.sh`

`bash build.sh`

`bash package-deb.sh`

A deb file will appear in the root directory of the project. Simply install it with `dpkg`.
`sudo dpkg --install <filename.deb>`

If it raises errors or fails to install, run:
`sudo apt -f install`

Reboot your computer after installing!

Note that this script won't work if you have the anbox snap installed. If you do, remove it and reboot your computer.

To remove, simply run `sudo apt remove anbox-image-gapps`. You may need to run `sudo apt autoremove --purge` afterward to remove orphaned dependencies.

#### Installing on an Arch based distro:

It's in the AUR! Ditch these scripts entirely and read this wiki page: https://wiki.archlinux.org/index.php/Anbox

#### Installing on RedHat based distros:

I hope to support RHEL, CentOS and Fedora soon!! For now, install like you would on any other Linux distro (read below).

#### Installing on another linux distro:

Anbox must be preinstalled for this script to work. You can install the offical snap https://docs.anbox.io/userguide/install.html. Keep in mind you may need to enable the `ashmem_linux` and `binder_linux` kernel modules. Depending on your distro, that may be a few commands or a config file (which I provide) or it may require recompiling the linux kernel.

Run:

`bash download.sh`

`bash verify.sh`

`bash build.sh`

`bash install.sh`

If you would like the kernel modules `ashmem_linux` and `binder_linux` to autostart on boot, run `echo "ashmem_linux" | sudo tee /etc/modules-load.d/anbox.conf && echo "binder_linux" | sudo tee -a /etc/modules-load.d/anbox.conf`

Note that anything installed this way will not be removable by your distribution's package manager.

#### Contributing
These scripts may contain bugs. If you run into one please create an issue!
If you have an idea, please open an issue or pull request. All ideas welcome.

### License
This program is licensed under the EUPL v1.2 or later. See the [license website](https://www.eupl.eu/) for more information.
