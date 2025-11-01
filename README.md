# <img height="55" alt="Origami Logo" src="https://github.com/user-attachments/assets/c04f71a0-a283-4007-8381-05437b00f15a" /> Origami Linux &nbsp; [![bluebuild build badge](https://github.com/john-holt4/origami/actions/workflows/build.yml/badge.svg)](https://github.com/john-holt4/origami/actions/workflows/build.yml)

<img width="2028" height="1188" alt="Origami Screenshot" src="https://github.com/user-attachments/assets/8fd9a5e5-67a5-4f13-b221-bd7c1d38268e" />

Origami is a next-generation Linux distribution inspired by the art of Japanese paper folding. Built on Fedora Atomic with Universal Blue, Origami elegantly folds together cutting-edge tools, beautiful design, and thoughtful defaults to create a lightweight, customizable, and visually stunning operating system using the Cosmic desktop environment.

> ⚠️ **Experimental project**: expect rapid iteration – back up your data.

## 📚 Table of Contents
- [Why "Origami"?](#why-origami)
- [Features](#-features)
- [Installation](#-installation)
- [What's Included](#-whats-included)
- [Development Workflow](#-development-workflow)
- [Philosophy](#-philosophy)
- [Contributing](#-contributing)

## Why "Origami"?

Origami (折り紙) is the Japanese art of paper folding, symbolizing transformation, creativity, and simplicity. Just as a single sheet of paper can be folded into infinite forms, Origami Linux lets you shape your system to fit your unique workflow.

## ✨ Features

**🏗️ Foundation**
- Cosmic Desktop Environment with modern, beautiful interface
- Fedora Atomic base with Universal Blue for atomic updates and stability
- Container-first development with Podman and Docker compatibility
- Signed images with Sigstore and cosign verification

**🎨 Visual Design**
- WhiteSur icon theme and custom wallpapers
- JetBrainsMono Nerd Font and Inter Google Font
- Custom ASCII art and fastfetch configuration

**⚡ Modern Tools**
- Enhanced command-line: `eza`, `bat`, `zoxide`, `btop`, `ripgrep`, `lazygit`, `axel`, `aria2c`
- Rust-powered utilities: `sudo-rs`, `uutils-coreutils`
- Smart aliases with distrobox-aware functionality
- FZF integration for fuzzy searching

**🧑‍💻 Development Ready**
- Distrobox integration for isolated development environments
- ujust commands for system management
- Cloudflare Warp for enhanced networking

**🗑️ Minimal & Clean**
- No bloatware or unnecessary GUI applications by default
- User choice through Cosmic Store
- Lean, focused system design

## 🚀 Installation

> ⚠️ **Warning**: Origami is experimental and actively developed. Use at your own discretion.

### Rebasing from Fedora Atomic

```bash
# Rebase to Origami (unsigned first, then signed)
rpm-ostree rebase ostree-unverified-registry:ghcr.io/john-holt4/origami-linux:latest
systemctl reboot

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/john-holt4/origami-linux:latest
systemctl reboot
```
For Nvidia Support

```bash
# Rebase to Origami (unsigned first, then signed)
rpm-ostree rebase ostree-unverified-registry:ghcr.io/john-holt4/origami-linux-nvidia:latest
systemctl reboot

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/john-holt4/origami-linux-nvidia:latest
systemctl reboot
```

### ISO Download

**[📥 Download Origami ISO](https://origami.dpdns.org/origami.iso)**

**[📥 Download Origami Nvidia ISO](https://origami.dpdns.org/origami-nvidia.iso)**

### Image Verification

All images are signed with [Sigstore](https://www.sigstore.dev/) for security:

```bash
# Download public key and verify
curl -O https://raw.githubusercontent.com/john-holt4/Origami-Linux/main/cosign.pub
cosign verify --key cosign.pub ghcr.io/john-holt4/origami-linux:latest
```

## 🎯 What's Included

### Modern Command-Line Tools

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

### Additional Tools
- **Git**: Enhanced with `lazygit` terminal UI
- **Containers**: Podman with Docker-compatible aliases  
- **Terminal**: Starship prompt with beautiful display
- **File Management**: Yazi terminal file manager
- **Networking**: Cloudflare Warp for fast, private, and secure internet connectivity
- **Downloading**: `axel` & `aria2` for accelerated file downloading.
- **Fun**: `cbonsai`, `cmatrix`, `tty-clock`, `cava` for terminal aesthetics

## 🏗️ Development Workflow

Origami follows the **atomic desktop philosophy** - your host system stays immutable while development happens in containers.

### Using Distrobox for Development

```bash
# Create a development container
distrobox create --name dev-ubuntu --image ubuntu:latest
distrobox enter dev-ubuntu

# Install tools inside the container (aliases auto-disable)
sudo apt update && sudo apt install nodejs npm python3-pip

# Or use ujust for quick setup
ujust distrobox-new
```

**Benefits:**
- 🛡️ Keep host system clean and stable
- 🔄 Multiple environments for different projects  
- 🧹 Easy cleanup without affecting host
- ⚡ Native performance with full hardware access

### System Management

Update the system with `update`

Update device firmware with `update-firmware`

Origami includes **ujust** recipes for common system management tasks like updates, hardware configuration, development containers, and diagnostics. Run `ujust` to see all available commands.

## 🧘 Philosophy

Origami Linux embodies the Japanese principles of:

- **Kaizen (改善)**: Continuous improvement through thoughtful iteration
- **Wabi-Sabi (侘寂)**: Finding beauty in simplicity and imperfection  
- **Kanso (簡素)**: Simplicity and elimination of clutter
- **Shizen (自然)**: Naturalness without pretense

Like the ancient art of paper folding, Origami transforms the ordinary into something extraordinary through patience, precision, and purpose.

## 🤝 Contributing

Origami thrives on community contributions:
- 🐛 Report bugs and issues
- 💡 Suggest new features  
- 📖 Improve documentation
- 🔧 Contribute code
- 🎨 Create themes or wallpapers

Visit our [GitHub repository](https://github.com/john-holt4/Origami) to get started.

## 📄 License

Origami is released under the [Apache License 2.0](LICENSE).

---

*"In the hands of an origami master, a simple sheet of paper becomes a work of art. In the hands of its users, Origami Linux becomes whatever they need it to be."* 🎋
