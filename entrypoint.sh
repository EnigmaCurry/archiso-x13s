#!/bin/bash
set -e
cd /build

pacman-key --init
pacman -Syu --noconfirm
useradd builduser -m
chown -R builduser:builduser /build
passwd -d builduser
printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers

sudo -u builduser bash -c 'cd /build && ./archiso/mkarchiso -v configs/x13s'||status=$?
if [ $status -ne 0 ]; then
    echo "Build failed"
    exit 1
fi
