# archiso for Lenovo ThinkPad X13s

This repository contains a customized archiso preset for building images for the ThinkPad X13s ARM laptop. Pre-built images are available in [Releases](https://github.com/ironrobin/archiso-x13s/releases). These images use a [custom kernel](https://github.com/ironrobin/x13s-alarm/tree/trunk/linux-x13s-archiso)/[firmware](https://github.com/ironrobin/x13s-alarm/tree/trunk/x13s-firmware) to make the iso work reliably. 

PKGBUILDs for Leo Shen's packages can be found [here](https://github.com/szclsya/x13s-alarm).

## Boot instructions
1. Download the latest Pre-built image
2. Flash to a USB `dd bs=4M if=archlinuxarm-YYYY.MM.DD-aarch64.iso of=<DEV-TARGET> conv=fsync oflag=direct status=progress`
3. Reboot the laptop, and press F12 when the Lenovo logo appears
4. Select the USB to boot

## Installation
The instructions in the [Installation_guide](https://wiki.archlinux.org/title/Installation_guide) mostly apply, however there are some things specific to the X13s to be aware of:

 * The internal drive is `/dev/nvme0n1`, and USB storage will be `/dev/sdX`.
 * The X13s ships with an existing EFI system partition on the internal drive that you can use `/dev/nvme0n1p1`.
 * Currently, the regular `linux-aarch64` and `linux-aarch64-rc` kernels don't work, until this is sorted out you can use Leo's `x13s` repository and install `linux-x13s` from it.
 * The `x13s` repo will be missing from the target system's `pacman.conf`, make sure to edit it and add this if you want to use Leo's prebuilt packages
```
[x13s]
Server = https://lecs.dev/repo
```

You'll need to trust the public key in order to verify package signature:

```bash
# Run as root
curl -O https://lecs.dev/repo/public.asc
pacman-key --add public.asc
pacman-key --lsign 9FD0B48BBBD974B80A3310AB6462EE0B8E382F3F
```

If this project helped you, you can buy me a cup of coffee :)
<br/><br/>
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/theironrobin)
<br/><br/>
DOGE address: DLDNfkXoJeueb2GRx4scnmRc12SX1H22VW