#!/bin/bash

# CachyOS Kernel Configuration Script for Origami Linux
# This script configures the CachyOS kernel as default and applies optimal settings

set -euo pipefail

echo "🔧 Configuring CachyOS kernel for Origami Linux..."

# Create kernel postinst.d directory if it doesn't exist
mkdir -p /etc/kernel/postinst.d

# Create script to set CachyOS kernel as default after updates
cat > /etc/kernel/postinst.d/99-default-cachyos << 'EOF'
#!/bin/sh

set -e

# Set the latest CachyOS kernel as the default kernel
grubby --set-default=/boot/$(ls /boot | grep vmlinuz.*cachy | sort -V | tail -1)
EOF

# Make the script executable
chmod +x /etc/kernel/postinst.d/99-default-cachyos
chown root:root /etc/kernel/postinst.d/99-default-cachyos

# Set current CachyOS kernel as default
if ls /boot/vmlinuz*cachy* &> /dev/null; then
    CACHY_KERNEL=$(ls /boot | grep vmlinuz.*cachy | sort -V | tail -1)
    grubby --set-default=/boot/${CACHY_KERNEL}
    echo "✅ Set CachyOS kernel as default: ${CACHY_KERNEL}"
fi

# Create default scx scheduler configuration
mkdir -p /etc/default
cat > /etc/default/scx << 'EOF'
# SCX Scheduler Configuration for Origami Linux
# Using scx_bpfland for optimal desktop performance

SCX_SCHEDULER="scx_bpfland"
SCX_FLAGS=""
EOF

# Enable and start ananicy-cpp for automatic process nice adjustment
if systemctl list-unit-files | grep -q ananicy-cpp.service; then
    systemctl enable ananicy-cpp.service
    echo "✅ Enabled ananicy-cpp service for automatic process optimization"
fi

# Configure SELinux for kernel module loading if SELinux is enabled
if command -v getenforce &> /dev/null && [ "$(getenforce)" != "Disabled" ]; then
    setsebool -P domain_kernel_load_modules on
    echo "✅ Configured SELinux for kernel module loading"
fi

# Apply CachyOS settings optimizations
if command -v dracut &> /dev/null; then
    echo "🔄 Rebuilding initramfs with CachyOS settings..."
    dracut -f
    echo "✅ Initramfs rebuilt with CachyOS optimizations"
fi

echo "🎉 CachyOS kernel configuration completed successfully!"
echo ""
echo "📋 What was configured:"
echo "   • CachyOS kernel set as default boot option"
echo "   • Auto-selection script installed for future kernel updates"
echo "   • SCX scheduler configured (scx_bpfland for desktop)"
echo "   • Ananicy-cpp enabled for process optimization"
echo "   • SELinux configured for kernel modules"
echo "   • Initramfs rebuilt with optimizations"
echo ""
echo "🔄 Please reboot to use the CachyOS kernel"