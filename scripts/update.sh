#!/bin/bash

echo "🔄 Updating DevOps Stack..."
echo ""

# Pull latest changes
echo "📥 Pulling latest code..."
git pull origin main

# Sync ArgoCD applications
echo "🔄 Syncing ArgoCD applications..."
kubectl get application -n argocd -o name | while read app; do
    echo "Syncing $app..."
    argocd app sync $app --prune --timeout 300
done

# Restart deployments if needed
echo "🔄 Restarting deployments..."
kubectl rollout restart deployment -n uptime-kuma
kubectl rollout restart deployment -n monitoring

echo "✅ Update completed!"
