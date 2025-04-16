#!/bin/bash
set -e

# Stop K3s service
systemctl stop k3s || true

# Remove systemd service files
rm -f /etc/systemd/system/k3s.service
rm -f /etc/systemd/system/k3s.service.env
rm -rf /etc/systemd/system/k3s.service.d
systemctl daemon-reload

# Clean up K3s directories
rm -rf /var/lib/rancher/k3s
rm -rf /etc/rancher/k3s
rm -f /usr/local/bin/k3s
rm -f /usr/local/bin/kubectl

# Clean up network interfaces
ip link delete cni0 2>/dev/null || true
ip link delete flannel.1 2>/dev/null || true

# Clean up iptables
iptables-save | grep -v KUBE | grep -v CNI | iptables-restore

echo "K3s cleanup completed successfully"