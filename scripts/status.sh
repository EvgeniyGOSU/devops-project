#!/bin/bash

echo "╔════════════════════════════════════════════════╗"
echo "║     🚀 DevOps Project - Cluster Status        ║"
echo "╚════════════════════════════════════════════════╝"
echo ""

echo "📊 Nodes:"
kubectl get nodes -o wide
echo ""

echo "📦 Resource Usage:"
kubectl top nodes 2>/dev/null
echo ""

echo "🔧 ArgoCD Applications:"
kubectl get application -n argocd
echo ""

echo "📱 All Pods:"
kubectl get pods -A | grep -v kube-system
echo ""

echo "🌐 Services & Access URLs:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ArgoCD:       https://192.168.29.137:30080"
echo "  Uptime Kuma:  http://192.168.29.137:30081"
echo "  Gitea:        http://192.168.29.137:30083"
echo "  Grafana:      http://192.168.29.137:30091"
echo "  Prometheus:   http://192.168.29.137:30090"
echo "  Ingress HTTP: http://192.168.29.137:30070"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🔑 Credentials:"
echo "  Grafana:  admin / admin123"
echo "  Gitea:    created on first login"
echo "  ArgoCD:   admin / $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' 2>/dev/null | base64 -d)"
echo "╚════════════════════════════════════════════════╝"
