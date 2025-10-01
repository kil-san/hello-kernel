# MyOS

A simple hobby operating system.

## Build

To build the operating system, run the `build.sh` script:

```sh
./build.sh
```

This will create a bootable ISO image at `build/os/myos.iso`.

## Running

You can run the operating system in a virtual machine like QEMU:

```sh
qemu-system-i386 -cdrom build/os/myos.iso
```
