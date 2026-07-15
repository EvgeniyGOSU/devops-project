#!/bin/bash

BACKUP_DIR="./backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p $BACKUP_DIR

echo "Creating backup in $BACKUP_DIR..."

# Бэкап Kubernetes ресурсов
echo "📦 Backing up Kubernetes resources..."
kubectl get all -A -o yaml > $BACKUP_DIR/all-resources.yaml
kubectl get pv,pvc -A -o yaml > $BACKUP_DIR/storage.yaml
kubectl get configmap,secret -A -o yaml > $BACKUP_DIR/configs.yaml

# Бэкап etcd (если есть доступ)
echo "💾 Backing up etcd..."
ssh master "sudo etcdctl snapshot save /tmp/etcd-backup.db" 2>/dev/null || echo "etcd backup skipped"
scp master:/tmp/etcd-backup.db $BACKUP_DIR/etcd-backup.db 2>/dev/null || echo "etcd copy skipped"

echo "✅ Backup completed: $BACKUP_DIR"
