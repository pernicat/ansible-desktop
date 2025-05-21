Great to hear it's working! Here's a **clean, repeatable summary** of the steps you’d take to install the latest NVIDIA driver (like 570.xx) for a GPU like the **RTX 4070 Ti Super** on a fresh **Debian 12** install.

---

## ✅ NVIDIA Driver 570 on Debian 12 – Clean Install Summary

### 🛠️ 1. **Prepare the System**

download the run file from nVidia offical driver page

#### Update packages and install needed tools:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential dkms linux-headers-$(uname -r) gcc make curl wget pkg-config libglvnd-dev
```

#### Add optional 32-bit support (if needed for legacy apps):

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgl1:i386 libc6:i386
```

---

### 🚫 2. **Remove Debian-packaged NVIDIA drivers**

```bash
sudo apt purge '^nvidia-.*'
sudo apt autoremove --purge
sudo apt clean
```

---

### 🚫 3. **Blacklist Nouveau driver**

Create a config file:

```bash
echo -e "blacklist nouveau\noptions nouveau modeset=0" | sudo tee /etc/modprobe.d/disable-nouveau.conf
```

Then regenerate initramfs:

```bash
sudo update-initramfs -u
```

---

### 🔒 4. **Disable Secure Boot (BIOS/UEFI)**

Reboot into your BIOS and:

* Set **Secure Boot** to **Disabled**
* Optionally switch “OS Type” to **Other OS** (on ASUS boards)

---

### 🔧 5. **Free up /tmp or use alternate TMPDIR**

Check space:

```bash
df -h /tmp
```

If `/tmp` is limited (e.g., tmpfs or small LVM), create an alternate temp directory:

```bash
mkdir -p ~/nvidia-tmp
```

---

### 🔻 6. **Exit the GUI and stop the display manager**

Press **Ctrl+Alt+F2** to switch to a TTY, then log in.

Stop your display manager (depending on your system):

```bash
sudo systemctl stop gdm    # or sddm, lightdm, etc.
```

---

### 📦 7. **Run the NVIDIA `.run` installer**

Make it executable:

```bash
chmod +x NVIDIA-Linux-x86_64-570*.run
```

Run it with a custom temp dir:

```bash
sudo TMPDIR=~/nvidia-tmp ./NVIDIA-Linux-x86_64-570*.run --dkms --install-libglvnd --log-file=~/nvidia-install.log
```

When prompted:

* ✅ Accept license
* ✅ Allow DKMS install
* ✅ Rebuild initramfs (especially if Nouveau is mentioned)
* ✅ Ignore 32-bit warnings if not needed

---

### 🔁 8. **Reboot and verify**

```bash
sudo reboot
```

Then check:

```bash
nvidia-smi
lsmod | grep nvidia
glxinfo | grep "OpenGL renderer"    # Install `mesa-utils` if needed
```

You should see your GPU listed and the correct driver version.

---

### 🧰 Optional: Ansible Automation

You can automate most of this using Ansible except the GUI stopping and `.run` execution, which typically require manual steps or a headless run with careful flags and preconditions.

Would you like an Ansible playbook outline for the parts that can be automated?
