# <img height="55" alt="Origami Logo" src="https://github.com/user-attachments/assets/c04f71a0-a283-4007-8381-05437b00f15a" /> Origami Linux &nbsp; [![bluebuild build badge](https://github.com/john-holt4/origami/actions/workflows/build.yml/badge.svg)](https://github.com/john-holt4/origami/actions/workflows/build.yml)
<img width="2028" height="1188" alt="Origami Screenshot" src="https://github.com/user-attachments/assets/8fd9a5e5-67a5-4f13-b221-bd7c1d38268e" />
&nbsp;&nbsp;

Origami is a next-generation Linux distribution inspired by the art of Japanese paper folding. Built on Fedora Atomic with Universal Blue, Origami elegantly folds together cutting-edge tools, beautiful design, and thoughtful defaults to create a lightweight, customizable, and visually stunning operating system using the Cosmic desktop environment. With a focus on simplicity, speed, and creativity, Origami empowers users to shape their digital environment as effortlessly as folding a masterpiece.

> Experimental project: expect rapid iteration – back up your data.

---
## 📚 Table of Contents
1. [Why "Origami"](#why-origami)
2. [Key Features](#-key-features)
3. [Quick Start](#-quick-start)
4. [Installation](#-installation)
5. [Image Verification](#-image-verification)
6. [What's Included (Tools)](#-whats-included)
7. [Development Workflow](#-development-workflow)
8. [System Management (ujust)](#system-management-with-ujust)
9. [Getting Started](#-getting-started)
10. [Philosophy](#-philosophy)
11. [Contributing](#-contributing)
12. [License](#-license)
---

## Why "Origami"?

Origami (折り紙) is the Japanese art of paper folding, symbolizing transformation, creativity, and simplicity. Just as a single sheet of paper can be folded into infinite forms, Origami Linux lets you shape your system to fit your unique workflow. Inspired by the philosophy of *kaizen* (continuous improvement) and *wabi-sabi* (finding beauty in simplicity), Origami encourages users to craft their digital space with intention and artistry.

## ✨ Key Features

### 🏗️ **Foundation**
- **Cosmic Desktop Environment**: Modern, beautiful, and efficient desktop experience
- **Fedora Atomic Base**: Built with Universal Blue for cutting-edge, atomic updates and stability
- **Container-First**: Podman integration with Docker compatibility aliases
- **Secure by Design**: Signed images with Sigstore and cosign verification

### 🌐 **Networking & Privacy**
- **Cloudflare Warp**: Integrated for fast, private, and secure networking

### 🎨 **Visual Design**
- **WhiteSur Icon Theme**: Beautiful, modern iconography automatically installed
- **Custom Wallpapers**: Curated Origami-themed backgrounds
- **Custom ASCII Art**: Personalized fastfetch configuration with Origami branding
- **Premium Fonts**: JetBrainsMono Nerd Font and Inter Google Font for optimal readability

### ⚡ **Modern Command-Line Tools**
- **Enhanced File Management**: `eza` (modern ls), `yazi` (terminal file manager), `bat` (syntax-highlighted cat)
- **System Monitoring**: `btop` (modern htop), `fastfetch` (system info with custom ASCII)
- **Development Tools**: `lazygit` (Git UI), `ripgrep` (fast grep), `hyperfine` (benchmarking)
- **Navigation & Search**: `zoxide` (smart cd), `starship` (beautiful prompt)
- **Rust-Powered Core**: `sudo-rs`, `uutils-coreutils` for modern, safe system utilities
- **Fun Extras**: `cbonsai`, `cmatrix`, `tty-clock` for terminal aesthetics

### 🛠️ **Intelligent Shell Experience**
- **Smart Aliases**: Comprehensive set of modern command replacements
- **Distrobox-Aware**: Automatically disables custom aliases inside containers
- **Helpful Hints**: Gentle nudges to use modern alternatives (fd instead of find, rg instead of grep)
- **Fuzzy Everything**: FZF integration for enhanced command-line productivity

### 💻 **Development & Container Workflow**
- **Distrobox Integration**: Seamless container-based development environments
- **ujust Commands**: System management and configuration utilities
- **Isolated Development**: Keep your host system clean while developing

### 🗑️ **Minimal & Clean**
- **Removed Bloat**: Firefox, GNOME utilities, and other unnecessary packages removed
- **No GUI Applications**: Origami doesn't install GUI applications by default, giving you complete control over your software selection
- **User Choice**: Install your preferred applications from the Cosmic Store after enabling software repositories in the store's settings
- **Lean System**: Focused on essential tools and beautiful defaults

<details>
<summary><strong>🔍 Expand Full Feature Bullet List</strong></summary>

#### Foundation
* Cosmic Desktop Environment: Modern, beautiful, and efficient desktop experience
* Fedora Atomic Base: Built with Universal Blue for cutting-edge, atomic updates and stability
* Container-First: Podman integration with Docker compatibility aliases
* Secure by Design: Signed images with Sigstore and cosign verification

#### Networking & Privacy
* Cloudflare Warp: Integrated for fast, private, and secure networking

#### Visual Design
* WhiteSur Icon Theme: Beautiful, modern iconography automatically installed
* Custom Wallpapers: Curated Origami-themed backgrounds
* Custom ASCII Art: Personalized fastfetch configuration with Origami branding
* Premium Fonts: JetBrainsMono Nerd Font and Inter Google Font for optimal readability

#### Modern Command-Line Tools
* Enhanced File Management: `eza` (modern ls), `yazi` (terminal file manager), `bat` (syntax-highlighted cat)
* System Monitoring: `btop` (modern htop), `fastfetch` (system info with custom ASCII)
* Development Tools: `lazygit` (Git UI), `ripgrep` (fast grep), `hyperfine` (benchmarking)
* Navigation & Search: `zoxide` (smart cd), `starship` (beautiful prompt)
* Rust-Powered Core: `sudo-rs`, `uutils-coreutils` for modern, safe system utilities
* Fun Extras: `cbonsai`, `cmatrix`, `tty-clock` for terminal aesthetics

#### Intelligent Shell Experience
* Smart Aliases (modern replacements)
* Distrobox-Aware (aliases auto-disable in containers)
* Helpful Hints (fd vs find, rg vs grep)
* FZF integration

#### Development & Container Workflow
* Distrobox Integration
* ujust Commands
* Isolated Development

#### Minimal & Clean
* Removed Bloat (Firefox, GNOME utilities, etc.)
* No GUI Applications by default
* User Choice via Cosmic Store
* Lean System
</details>

## 🚀 Quick Start
```bash
# Rebase (unsigned then signed)
rpm-ostree rebase ostree-unverified-registry:ghcr.io/john-holt4/origami-linux:latest && systemctl reboot
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/john-holt4/origami-linux:latest && systemctl reboot

# Verify image signature
curl -O https://raw.githubusercontent.com/john-holt4/Origami/main/cosign.pub
cosign verify --key cosign.pub ghcr.io/john-holt4/origami-linux:latest

# Create a development container
distrobox create --name dev-fedora --image fedora:latest
distrobox enter dev-fedora

# Update & maintain
ujust update
ujust clean-system
```

## 🚀 Installation

> **⚠️ Warning:** Origami is experimental and actively developed. Use at your own discretion.

### Rebasing from Fedora Atomic

To rebase an existing Fedora Atomic installation to Origami:

```bash
# First rebase (unsigned)
rpm-ostree rebase ostree-unverified-registry:ghcr.io/john-holt4/origami-linux:latest
systemctl reboot

# Second rebase (signed)
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/john-holt4/origami-linux:latest
systemctl reboot
```

The `latest` tag always points to the newest build. Your Fedora version is controlled by the base image specified in `recipe.yml`.

### Download ISO Image

For new installations, you can download the Origami ISO image:

**[📥 Download Origami ISO](https://origami.dpdns.org/origami.iso)**

> **⚠️ Important Caveats:**
> - **NVIDIA Support**: This is the first ISO release and currently **only works on non-NVIDIA machines**. An NVIDIA-compatible image is coming soon.
> - **Early Release**: This is the inaugural ISO build. Please [report any bugs or issues](https://github.com/john-holt4/Origami/issues) you encounter to help us improve.
> - **Testing Phase**: As this is experimental software, please backup your data before installation.

## 🔐 Image Verification

All Origami images are signed with [Sigstore](https://www.sigstore.dev/) and [cosign](https://github.com/sigstore/cosign) for security and authenticity.

To verify an image before installation:

```bash
# Download the public key
curl -O https://raw.githubusercontent.com/john-holt4/Origami/main/cosign.pub

# Verify the image signature
cosign verify --key cosign.pub ghcr.io/john-holt4/origami-linux:latest
```

## 🎯 What's Included

### Command-Line Tools
| Traditional | Origami Alternative | Description |
|-------------|-------------------|-------------|
| `ls` | `eza` | Modern file listing with icons and colors |
| `cat` | `bat` | Syntax-highlighted file viewer |
| `cd` | `zoxide` | Smart directory jumping |
| `htop` | `btop` | Beautiful system monitor |
| `neofetch` | `fastfetch` | Fast system information with custom ASCII |
| `sudo` | `sudo-rs` | Rust-based sudo implementation |
| `find` | Suggests `fd` | User-friendly file finder |
| `grep` | Suggests `rg` | Ultra-fast text search |

### Development & Productivity
- **Git**: Enhanced with `lazygit` for terminal-based Git UI
- **Containers**: Podman with Docker-compatible aliases
- **Terminal**: Starship prompt with beautiful, informative display
- **File Management**: Yazi terminal file manager
- **Benchmarking**: Hyperfine for command performance testing

### System Enhancements
- **Desktop**: Cosmic desktop environment with custom theming
- **Icons**: WhiteSur theme automatically configured
- **Fonts**: JetBrainsMono Nerd Font and Inter for optimal readability
- **Networking**: Cloudflare Warp for enhanced privacy and performance

## 🏗️ **Development Workflow**

### Container-Based Development with Distrobox

Origami follows the **atomic desktop philosophy** where the host system remains immutable and clean. For development work, use **Distrobox** to create isolated, mutable containers:

```bash
# Create a development container (Ubuntu example)
distrobox create --name dev-ubuntu --image ubuntu:latest

# Enter the container
distrobox enter dev-ubuntu

# Install development tools inside the container
# Your Origami aliases are automatically disabled here
sudo apt update && sudo apt install nodejs npm python3-pip
```

**Benefits:**
- 🛡️ **Host Protection**: Keep your base system clean and stable
- 🔄 **Multiple Environments**: Run different distros for different projects
- 🧹 **Easy Cleanup**: Remove containers without affecting the host
- ⚡ **Native Performance**: Full access to host hardware and home directory

### System Management with ujust

Origami includes **ujust** recipes for common system management tasks (collapsible reference below for readability):

<details>
<summary><strong>📜 ujust Command Reference (click to expand)</strong></summary>

```bash
# System Updates & Maintenance
ujust update                 # Update system, flatpaks, and containers all at once
ujust clean-system          # Clean up old podman images, volumes, flatpaks and rpm-ostree content
ujust update-firmware       # Update device firmware
ujust toggle-updates        # Turn automatic updates on or off

# Hardware Configuration
ujust configure-nvidia      # Configure NVIDIA drivers (if applicable)
ujust configure-nvidia-optimus  # Configure NVIDIA Optimus for laptops
ujust enroll-secure-boot-key     # Enroll driver signing keys for secure boot
ujust toggle-nvk            # Switch between NVIDIA image and NVK

# Development Containers
ujust distrobox-new         # Create a new custom distrobox container
ujust distrobox-assemble    # Create distroboxes from a defined manifest
ujust setup-distrobox-app   # Install specialized application containers

# System Information & Diagnostics
ujust device-info           # Gather device info for troubleshooting
ujust bios-info            # Show BIOS information
ujust logs-this-boot       # Show all messages from current boot
ujust logs-last-boot       # Show all messages from last boot
ujust check-idle-power-draw # Measure system power consumption

# Security & Encryption
ujust setup-luks-tpm-unlock    # Enable automatic LUKS unlock via TPM
ujust remove-luks-tpm-unlock   # Disable automatic LUKS unlock via TPM

# Additional Utilities
ujust bios                 # Boot into BIOS/UEFI screen
ujust changelogs          # Show system changelogs
ujust install-resolve     # Install DaVinci Resolve video editor
ujust toggle-user-motd    # Toggle terminal welcome message
```

**Why ujust?**
* 📋 Comprehensive Management (updates, hardware, containers)
* 🔧 Automated Maintenance workflows
* 🎯 User-Friendly (no long rpm-ostree/systemctl commands)
* 🔄 Consistent Universal Blue experience

</details>


## 🌟 **Getting Started**

### 1. **Install Origami** 
Follow the installation instructions above.

### 2. **Set Up Development Environment**
```bash
# Create your preferred development container
distrobox create --name mydev --image fedora:latest
distrobox enter mydev

# Or use ujust for quick setup
ujust setup-development
```

### 3. **Configure Your System**
```bash
# Update everything at once
ujust update

# Clean up system
ujust clean-system
```

## 🧘 Philosophy

Origami Linux is more than an operating system—it's a digital *dojo* for creativity and productivity. Inspired by the Japanese principles of:

- **Kaizen (改善)**: Continuous improvement through thoughtful iteration
- **Wabi-Sabi (侘寂)**: Finding beauty in simplicity and imperfection  
- **Kanso (簡素)**: Simplicity and elimination of clutter
- **Shizen (自然)**: Naturalness without pretense

Every aspect of Origami, from the carefully curated command-line tools to the elegant visual design, reflects a commitment to mindful computing. Like the ancient art of paper folding, Origami transforms the ordinary into something extraordinary through patience, precision, and purpose.

## 🤝 Contributing

Origami thrives on community contributions. Whether you're:
- 🐛 Reporting bugs
- 💡 Suggesting features  
- 📖 Improving documentation
- 🔧 Contributing code
- 🎨 Creating themes or wallpapers

Your input helps shape Origami's evolution. Visit our [GitHub repository](https://github.com/john-holt4/Origami) to get started.

## 📄 License

Origami is released under the [Apache License 2.0](LICENSE), ensuring freedom to use, modify, and distribute.

---

*"In the hands of an origami master, a simple sheet of paper becomes a work of art. In the hands of its users, Origami Linux becomes whatever they need it to be."* 🎋
