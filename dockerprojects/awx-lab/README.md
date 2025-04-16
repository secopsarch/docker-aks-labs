# AWX Local Development Environment

This project contains two Ansible playbooks for setting up AWX in a local WSL development environment:
1. K3s installation playbook for WSL
2. AWX installation playbook using the installed K3s cluster

## Prerequisites

- Windows 10/11 with WSL2
- Oracle Linux (OEL) 9 or CentOS 9 Stream in WSL
- Docker Desktop with WSL integration enabled
- Minimum 4GB RAM
- Minimum 2 CPU cores
- Root or sudo access

## Installation Steps

### 1. Install K3s First

```bash
# Install K3s in WSL
ansible-playbook -i inventory k3s_setup.yml
```

Verify K3s installation:
```bash
kubectl get nodes
```

### 2. Install AWX

Once K3s is up and running:

```bash
# Install AWX
ansible-playbook -i inventory site.yml
```

## Configuration

### K3s Configuration
Default variables can be modified in `roles/k3s_wsl/defaults/main.yml`:
- `k3s_version`: Version of K3s to install
- `k3s_config`: K3s configuration options
- Network and user settings

### AWX Configuration
AWX variables can be modified in `roles/awx/defaults/main.yml`:
- `awx_operator_version`: Version of AWX Operator to install
- `kubernetes_namespace`: Kubernetes namespace for AWX
- `admin_user`: Default admin username
- `admin_password`: Default admin password

## Accessing AWX

After successful deployment, AWX will be available at:
- URL: `http://<your-server-ip>:30080`
- Default username: `admin`
- Default password: `password`

## Troubleshooting

### K3s Issues
1. Check K3s service status:
```bash
systemctl status k3s
```

2. View K3s logs:
```bash
journalctl -u k3s
```

### AWX Issues
1. Check pod status:
```bash
kubectl get pods -n awx
```

2. View pod logs:
```bash
kubectl logs -n awx <pod-name>
```

## Cleanup

To remove AWX and all its components:
```bash
kubectl delete namespace awx
```

To uninstall K3s:
```bash
/usr/local/bin/k3s-uninstall.sh
```

## Note

This setup is intended for local development/testing and is not recommended for production use.