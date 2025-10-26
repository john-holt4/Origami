# <img height="55" alt="Origami Logo" src="https://github.com/user-attachments/assets/c04f71a0-a283-4007-8381-05437b00f15a" /> Origami Linux &nbsp; [![bluebuild build badge](https://github.com/john-holt4/origami/actions/workflows/build.yml/badge.svg)](https://github.com/john-holt4/origami/actions/workflows/build.yml)
<img width="2028" height="1188" alt="Origami Screenshot" src="https://github.com/user-attachments/assets/8fd9a5e5-67a5-4f13-b221-bd7c1d38268e" />
&nbsp;&nbsp;

Origami is a modern Linux distribution that blends the elegance of Japanese philosophy with the power of open-source technology. Built on Fedora Atomic with Universal Blue, Origami is designed for creators, tinkerers, and anyone who values a beautiful, efficient, and customizable Cosmic desktop experience.

## Why "Origami"?

Origami (折り紙) is the Japanese art of paper folding, symbolizing transformation, creativity, and simplicity. Just as a single sheet of paper can be folded into infinite forms, Origami Linux lets you shape your system to fit your unique workflow. Inspired by the philosophy of *kaizen* (continuous improvement) and *wabi-sabi* (finding beauty in simplicity), Origami encourages users to craft their digital space with intention and artistry.

## Features

- **Fedora Atomic Base built with Universal Blue**: Cutting-edge, atomic updates for stability and security.
- **Cloudflare Warp**: Integrated for fast, private, and secure networking.
- **Beautiful Defaults**: WhiteSur icon theme, custom wallpapers, and fastfetch ASCII config.
- **Powerful Tools**: Includes btop, fastfetch, podman-compose, bat, ripgrep, zoxide, lazygit, yazi, eza, hyperfine, starship, cbonsai, cmatrix, tty-clock, and more.
- **Smart Aliases**: Enhanced shell experience with modern replacements for classic commands.
- **Fonts**: JetBrainsMono (Nerd Font) and Inter (Google Font) for a crisp, readable interface.
- **Minimal Bloat**: Removes unnecessary packages for a lean system.

## Installation

> **Warning:** Origami is experimental. Use at your own discretion.

To rebase an existing Fedora Atomic installation:

```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/john-holt4/origami-linux:latest
systemctl reboot
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/john-holt4/origami-linux:latest
systemctl reboot
```

The `latest` tag always points to the newest build, but your Fedora version is controlled by `recipe.yml`.

## Verification

Images are signed with [Sigstore](https://www.sigstore.dev/) and [cosign](https://github.com/sigstore/cosign). Download `cosign.pub` and verify with:

```sh
cosign verify --key cosign.pub ghcr.io/john-holt4/origami-linux:latest
```

## Philosophy

Origami Linux is more than an OS—it's a canvas for digital creativity. Inspired by the Japanese principles of *kaizen* (continuous improvement) and *wabi-sabi* (embracing imperfection), Origami invites you to fold, shape, and refine your computing experience. Every detail, from the ASCII art to the curated tools, reflects a commitment to beauty, simplicity, and user empowerment.
