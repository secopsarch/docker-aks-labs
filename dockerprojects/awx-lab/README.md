# AWX Local Development Environment

This project sets up AWX in a local WSL development environment using K3s and Docker Desktop.

## Prerequisites

### System Requirements
- Windows 10/11 with WSL2
- Oracle Linux (OEL) 9 in WSL
- Minimum 8GB RAM (recommended)
- Minimum 4 CPU cores (recommended)
- 20GB free disk space

### Software Requirements
- Docker Desktop with WSL integration enabled
- K3s v1.32.x or later
- Python 3.9 or later
- Helm v3.17 or later
- kubectl configured to access K3s cluster

### Python Dependencies
```bash
pip3 install kubernetes>=12.0.0 openshift>=0.12.0
```

## Pre-Installation Checks

1. Verify K3s is running:
```bash
kubectl get nodes
```

2. Verify Docker Desktop integration:
```bash
docker info
```

3. Check default storage class:
```bash
kubectl get storageclass
```

4. Verify Helm installation:
```bash
helm version
```

## Installation Steps

1. Clone this repository:
```bash
git clone <repository-url>
cd awx-lab
```

2. Review and update configuration (optional):
   - Edit `roles/awx/defaults/main.yml` for AWX settings
   - Default credentials are:
     - Username: admin
     - Password: password123 (change this!)

3. Install AWX:
```bash
ansible-playbook -i inventory site.yml
```

4. Monitor the deployment:
```bash
kubectl get pods -n awx -w
```

## Access AWX

Once deployed, AWX will be available at:
- URL: `http://localhost:30080`
- Default credentials:
  - Username: admin
  - Password: password123

## Troubleshooting

### Common Issues

1. Storage Class Issues:
```bash
kubectl get storageclass
kubectl describe storageclass local-path
```

2. Pod Issues:
```bash
kubectl get pods -n awx
kubectl describe pod <pod-name> -n awx
kubectl logs <pod-name> -n awx
```

3. AWX Operator Issues:
```bash
kubectl logs -n awx -l control-plane=controller-manager
```

4. Persistence Issues:
```bash
kubectl get pvc -n awx
kubectl describe pvc <pvc-name> -n awx
```

## Resource Requirements

AWX components require:
- Database: 
  - CPU: 500m
  - Memory: 2Gi
  - Storage: 8Gi
- Web:
  - CPU: 500m
  - Memory: 1Gi
- Task:
  - CPU: 500m
  - Memory: 2Gi
- Projects Storage: 8Gi

## Cleanup

To remove AWX:
```bash
kubectl delete namespace awx
```

## Note

This setup is intended for local development/testing. For production environments, refer to the official AWX documentation for hardened deployment configurations.