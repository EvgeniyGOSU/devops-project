```markdown
# DevOps Project - Uptime Kuma on Kubernetes

Полный DevOps-проект для развертывания Uptime Kuma в Kubernetes с использованием современных практик.

## Технологический стек

- **Infrastructure as Code**: Ansible, Terraform
- **Container Runtime**: containerd
- **Container Orchestration**: Kubernetes (kubeadm)
- **Network**: Flannel CNI
- **GitOps**: ArgoCD
- **CI/CD**: GitLab CE
- **Proxy**: Hysteria2 (для обхода блокировок)
- **Application**: Uptime Kuma

## Предварительные требования

- Ubuntu 22.04/24.04 на всех нодах
- Пользователь `k8s` с sudo без пароля
- SSH ключ `id_ed25519`
- Настроенный Hysteria2 прокси на 127.0.0.1:8080

## Быстрый старт

Клонирование репозитория:
```bash
git clone git@github.com:EvgeniyGOSU/devops-project.git
cd devops-project
```

Настройка инвентаря:
```bash
cp ansible/inventory/hosts.yml.example ansible/inventory/hosts.yml
vim ansible/inventory/hosts.yml
```

Полный деплой одной командой:
```bash
cd ansible
ansible-playbook playbooks/deploy-all.yml -v
```

Проверка кластера:
```bash
kubectl get nodes
kubectl get pods -A
```

## Структура проекта

```
devops-project/
├── ansible/                    # Ansible конфигурация и плейбуки
│   ├── ansible.cfg            # Конфигурация Ansible
│   ├── inventory/             # Инвентарь хостов
│   ├── playbooks/             # Плейбуки
│   │   ├── deploy-all.yml     # Полный деплой
│   │   ├── setup-containerd.yml
│   │   ├── configure-proxy.yml
│   │   ├── init-cluster.yml
│   │   ├── join-worker.yml
│   │   ├── install-cni.yml
│   │   ├── get-kubeconfig.yml
│   │   └── reset-cluster.yml
│   ├── roles/                 # Ansible роли
│   └── group_vars/           # Переменные групп
├── terraform/                 # Terraform конфигурация
├── kubernetes/               # Kubernetes манифесты
│   ├── uptime-kuma/          # Uptime Kuma deployment
│   └── argocd/               # ArgoCD конфигурация
├── gitlab/                   # GitLab docker-compose
└── docs/                     # Документация
```

## Команды управления

Проверка подключения к хостам:
```bash
ansible all -m ping
```

Полный деплой:
```bash
ansible-playbook playbooks/deploy-all.yml -v
```

Сброс кластера:
```bash
ansible-playbook playbooks/reset-cluster.yml -v
```

Установка только CNI:
```bash
ansible-playbook playbooks/install-cni.yml -v
```

Статус кластера:
```bash
kubectl get nodes -o wide
kubectl get pods -A
```

Логи пода:
```bash
kubectl logs -f <pod-name> -n <namespace>
```

Подключение к поду:
```bash
kubectl exec -it <pod-name> -n <namespace> -- /bin/bash
```

## Примечания

Все плейбуки идемпотентны - можно запускать многократно. Прокси Hysteria2 должен быть запущен на всех нодах. Для сброса кластера используйте `reset-cluster.yml`. Kubeconfig автоматически копируется в `~/.kube/config`.

Не коммитьте `hosts.yml` с реальными IP в публичные репозитории. Используйте `ansible-vault` для шифрования чувствительных данных. Храните SSH ключи в безопасности.
```
