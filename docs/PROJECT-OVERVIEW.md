# DevOps Project - Полный обзор

## Что реализовано

### Инфраструктура
- ✅ Kubernetes кластер (1 master + 1 worker) на VMware
- ✅ containerd как container runtime
- ✅ Flannel CNI для сети
- ✅ Hysteria2 прокси для обхода блокировок

### Автоматизация
- ✅ Ansible playbooks для полного деплоя
- ✅ Идемпотентные плейбуки (можно запускать многократно)
- ✅ Автоматическая настройка containerd, kubelet, kubeadm

### GitOps
- ✅ ArgoCD для управления приложениями
- ✅ Автоматическая синхронизация с GitHub
- ✅ 4 приложения в ArgoCD: uptime-kuma, monitoring, gitea, ingress

### Мониторинг
- ✅ Prometheus для сбора метрик
- ✅ Grafana для визуализации
- ✅ Node Exporter для метрик нод
- ✅ ServiceMonitor для метрик ArgoCD

### CI/CD
- ✅ Gitea как git-сервер
- ✅ .gitlab-ci.yml для pipeline
- ✅ Автоматическая валидация Ansible и Kubernetes манифестов

### Приложения
- ✅ Uptime Kuma для мониторинга доступности
- ✅ NGINX Ingress Controller для маршрутизации
- ✅ Metrics Server для resource metrics

## Технологический стек

| Категория | Технология |
|-----------|-----------|
| Infrastructure as Code | Ansible, Terraform |
| Container Runtime | containerd |
| Orchestration | Kubernetes (kubeadm) |
| Network | Flannel CNI |
| GitOps | ArgoCD |
| CI/CD | Gitea + GitHub Actions |
| Monitoring | Prometheus + Grafana |
| Ingress | NGINX Ingress Controller |
| Proxy | Hysteria2 |
| Application | Uptime Kuma |

## Быстрый старт

```bash
# Клонирование
git clone <repo-url>
cd devops-project

# Полный деплой
cd ansible
ansible-playbook playbooks/deploy-all.yml -v

# Проверка статуса
cd ..
./scripts/status.sh
Структура проекта
text
devops-project/
├── ansible/              # Ansible конфигурация
│   ├── playbooks/        # Плейбуки для деплоя
│   ├── inventory/        # Инвентарь хостов
│   └── roles/           # Роли
├── kubernetes/          # Kubernetes манифесты
│   ├── uptime-kuma/     # Uptime Kuma
│   ├── monitoring/      # Prometheus + Grafana
│   ├── gitea/           # Git сервер
│   ├── argocd/          # ArgoCD applications
│   └── ingress/         # Ingress конфигурация
├── terraform/           # Terraform конфигурация
├── scripts/             # Управляющие скрипты
├── docs/                # Документация
├── Makefile             # Команды управления
└── .gitlab-ci.yml       # CI/CD pipeline
