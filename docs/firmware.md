# Firmware

## Update the bootloader

First recommended step is updating the Raspberry Pi bootloader to the latest version. This will also
allow you to decide which boot drive you want to use (you should select the SD card option).

This can be done using the official Raspberry Pi Imager tool:

- Download and install the [Raspberry Pi Imager](https://www.raspberrypi.com/download/)
- Select your device model and SD card
- In the OS selector, choose "Misc utility images" -> "Bootloader" -> "SD Card Boot"
- Write the image to the SD card
- Insert the SD card into your Raspberry Pi and power it on
- The bootloader will be updated automatically. The result can be seen on the screen: green
  indicates success, red indicates failure
- You can now power off the Raspberry Pi and remove the SD card
- Restore the SD card and format it with the Imager tool

## Prepare the SD card

We'll boot the Raspberry Pi with an SD card, since the bootloader requires an MBR partition table for the storage device containing the firmware needed for booting, while at the same time Android requires a GPT partition table.

If you instead want to boot entirely from a USB drive without the need of a SD card, or running Android just from a SD card, you have to look into hybrid MBR, but you're on your own in that case.

Any 128MB+ SD card will suffice, since it will just need to store the official Raspberry Pi firmware.

Format it with an MBR partition table, create a single FAT32 partition and mark it as bootable.

Download the latest release from there: https://github.com/raspberrypi/firmware/releases

Extract it to the newly made partition.

## Partition the Android boot drive

It should have enough space to store the Android system plus user data, so a minimum of 16GB is recommended.

Partition table must be GPT.

Create the following partitions:

| Name | Size | Filesystem | Type / flags |
| ---- | ---- | ---------- | ----- |
| boot | 128MiB | Unformatted | N/A |
| recovery | 128MiB | Unformatted | N/A |
| misc | 16MiB | Unformatted | N/A |
| super | 8704MiB (8.5GiB) | Unformatted | N/A |
| metadata | 128MiB | F2FS | N/A |
| cache | 384MiB | F2FS | N/A |
| userdata | Remaining space | F2FS | N/A |

Note: Each partition must have its name set as the table's name, else Android won't be able to find
and/or mount the partitions!

## Flash the build


