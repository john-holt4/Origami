# <img height="55" alt="Origami Logo" src="https://github.com/user-attachments/assets/c04f71a0-a283-4007-8381-05437b00f15a" /> Origami Linux &nbsp; [![bluebuild build badge](https://github.com/john-holt4/origami/actions/workflows/build.yml/badge.svg)](https://github.com/john-holt4/origami/actions/workflows/build.yml)
<img width="2028" height="1188" alt="Origami Screenshot" src="https://github.com/user-attachments/assets/8fd9a5e5-67a5-4f13-b221-bd7c1d38268e" />
&nbsp;&nbsp;

Origami is a next-generation Linux distribution inspired by the art of Japanese paper folding. Built on Fedora Atomic with Universal Blue, Origami elegantly folds together cutting-edge tools, beautiful design, and thoughtful defaults to create a lightweight, customizable, and visually stunning operating system using the Cosmic desktop environment. With a focus on simplicity, speed, and creativity, Origami empowers users to shape their digital environment as effortlessly as folding a masterpiece.

## Why "Origami"?

Origami (折り紙) is the Japanese art of paper folding, symbolizing transformation, creativity, and simplicity. Just as a single sheet of paper can be folded into infinite forms, Origami Linux lets you shape your system to fit your unique workflow. Inspired by the philosophy of *kaizen* (continuous improvement) and *wabi-sabi* (finding beauty in simplicity), Origami encourages users to craft their digital space with intention and artistry.

## ✨ Features

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

### 🗑️ **Minimal & Clean**
- **Removed Bloat**: Firefox, GNOME utilities, and other unnecessary packages removed
- **Lean System**: Focused on essential tools and beautiful defaults

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

## 🛠️ Project Structure

```
Origami/
├── recipes/
│   └── recipe.yml              # Main build configuration
├── files/
│   ├── scripts/
│   │   └── example.sh          # Build-time scripts
│   └── system/
│       ├── etc/
│       │   └── profile.d/
│       │       └── origami-aliases.sh  # Shell aliases and functions
│       └── usr/
│           └── share/
│               ├── backgrounds/        # Custom wallpapers
│               ├── fastfetch/         # Custom ASCII and config
│               ├── glib-2.0/          # Desktop environment settings
│               ├── pixmaps/           # Custom icons
│               └── plymouth/          # Boot splash themes
├── modules/                    # Custom build modules
└── .github/
    └── workflows/
        └── build.yml          # Automated daily builds
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
