# Desktop Configuration with Ansible

This repository contains an Ansible script designed to configure your desktop computer. It automates system setup and management, ensuring a consistent and reproducible environment.


## System setup

1. Installer Type
  - Graphical Installer
  - Easier to navigate and avoids missing config steps.
  - Use the netinst ISO (small download, pulls latest packages during install):
    - (Debian Netinst ISO Download)[https://www.debian.org/distrib/]
2. Language, Location, Keyboard
  - Choose what fits your locale and keyboard layout. No wrong answers here.
3. Partitioning
  - Recommended: Manual or Guided with Separate /home
  - Benefit: You can reinstall OS later without wiping your personal files.
  - Example:
    - `/` (root): ~20–40 GB
    - `/home`: rest of the disk
    - `/boot/efi`: (if UEFI, ~500 MB, FAT32)
    - Optional: separate `/var` or `swap` partition
    - *If unsure, choose Guided – use entire disk with separate `/home`.*
4. Users
  -  Set a strong root password (or leave blank to disable root and use sudo)
  - Create a regular user (this will be your daily driver account)\
5. Network Configuration
  - Wired will auto-configure via DHCP.
  - For Wi-Fi: you'll need to load firmware (see notes below).
6. Software Selection
  - **Desktop Environment: Cinnamon**
    - Matches your LMDE-style goal
    - If not listed, select “None” and install manually later.
  - **Deselect:**
    - "GNOME" (unless you specifically want GNOME)
    - "Print Server" (unless you plan to print)
    - "SSH Server" (optional — you can install later)
  - **Always select:**
    - “Standard System Utilities”
7. Package Mirror
  - Choose a nearby country/mirror
  - Enable the security + updates repos (you can always change them later in `/etc/apt/sources.list`)
8. GRUB Bootloader
  - Install GRUB to:
    - `/dev/sda` or your primary drive (not a partition like `/dev/sda1`)
    - Necessary if this is your main OS or dual-boot setup
9. After First Boot – Recommended First Steps
  - `sudo apt update && sudo apt upgrade`

## Usage

- Execute the script using the `ansible-playbook` command.
- Ensure the target machine is accessible and properly configured for Ansible (e.g., SSH access and Python installed).

### System setup

```sh
sudo apt update && sudo apt install -y \
  git \
  python3 \
  python3-pip \
  ansible

```

### Install

```sh
ansible-playbook -i inventory.ini playbook.yml
```

## Notes

- Customize variables and tasks to match your specific desktop configuration needs.
- Carefully review the script before running it to prevent unintended changes.