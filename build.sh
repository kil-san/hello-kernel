#!/bin/sh

rm -rf build
mkdir -p build/intermediate
mkdir -p build/os/boot/grub

i686-elf-as src/bootloader/boot.s -o build/intermediate/boot.o
i686-elf-gcc -c src/kernel/kernel.c -o build/intermediate/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T linker.ld -o build/os/boot/myos.bin -ffreestanding -O2 -nostdlib build/intermediate/boot.o build/intermediate/kernel.o -lgcc

cp src/grub/grub.cfg build/os/boot/grub/grub.cfg
i686-elf-grub-mkrescue -o build/os/myos.iso build/os
