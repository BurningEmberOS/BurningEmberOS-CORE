# BurningEmberOS-CORE
core DOS operating system, used as a base for the rest of BurningEmbersOS

## Development
### Requirements
* [NASM](https://www.nasm.us)
* [QEMU](https://www.qemu.org) (or other virtual machine software)
* GNU Compiler Collection

### compiling and running
to compile, use `nasm` then use `Get-Content` (or `cat`):
```sh
nasm -f bin bootloader.asm -o bootloader.bin
nasm -f bin kernel.asm -o kernel.bin

Get-Content bootloader.bin, kernel.bin -Encoding Byte -ReadCount 0 | Set-Content os.img -Encoding Byte
```

then open the `os.img` file using your virtual machine software.
```sh
qemu-system-x86_64 -hda os.img
```