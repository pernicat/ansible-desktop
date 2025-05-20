# Desktop Configuration with Ansible

This repository contains an Ansible playbook designed to configure a Debian-based desktop environment. It helps automate the installation and setup of essential applications, development tools, and personal configurations, ensuring a consistent and repeatable setup process.

---

## 🖥️ Use Case

This playbook is intended for:

* Fresh installations of Debian (especially with Cinnamon)
* Users who want to document and replicate their personal system setup
* Developers who need to bootstrap a consistent environment quickly

---

## 📦 Features

* Installs Cinnamon desktop environment
* Adds useful APT and Flatpak packages
* Installs Google Chrome, VSCode, Steam
* Installs Python tooling (`pipx`, `pyenv`)
* Optionally creates a personal user account

---

## 🚀 Quick Start

### 1. Prerequisites

Install Ansible and supporting tools:

```bash
sudo apt update && sudo apt install -y \
  git \
  python3 \
  python3-pip \
  ansible
```

### 2. Clone This Repository

```bash
git clone https://your.repo/ansible-desktop.git
cd ansible-desktop
```

### 3. Run the Playbook

```bash
ansible-playbook -i inventory.ini playbook.yml
```

> 💡 You can edit `vars/default.yml` to customize package lists and your personal user settings.

---

## 🗂 Project Structure

```text
ansible-desktop/
├── README.md
├── inventory.ini           # Inventory file (localhost)
├── playbook.yml            # Entry point
├── vars/
│   └── default.yml         # Variables for APT/Flatpak/user
└── roles/
    └── common/
        ├── tasks/
        │   └── main.yml     # All setup tasks
        ├── files/
        │   └── ssh_keys/    # Optional public keys
        └── files/my-dotfiles/ (optional)
```

---

## 📝 Customization

### System Options in `default.yml`

```yaml
apt_packages:
  - vim
  - git
  - curl
  - htop
  - ...

flatpak_packages:
  - com.spotify.Client
  - org.gimp.GIMP

personal_user: pernicat
ssh_key_enabled: true
```

You can comment out the `personal_user` section if you're not using it yet.

---

## 🧠 Tips

* Run on a fresh install after initial Debian setup
* Ideal with Cinnamon desktop (select in Debian installer or install via Ansible)
* Customize your dotfiles and re-enable them once your base config is stable
* Use Timeshift for backups before and after major changes

---

## 📌 Notes

* Google Chrome is installed via `.deb` from Google's site
* VSCode is added from Microsoft’s APT repo
* Python tools (`pipx`, `pyenv`) are installed and configured
* Flatpak is used for apps that benefit from isolation and newer versions

---

## 🔒 Security

* Personal user can be created and configured with SSH key
* All software sources are reputable (Google, Microsoft, Flathub)
* You should still review the playbook before first use

---

## ✅ License

This project is currently intended for personal use and is shared without any license.
