# Архитектура проекта

## Компоненты

- **WSL (Control Plane)** - рабочая станция DevOps инженера
- **VMware VMs** - кластер Kubernetes (1 master + 1 worker)
- **VPS (Netherlands)** - VPN сервер для обхода блокировок
- **Hysteria2** - VPN клиент на всех нодах

## Сетевая схема

- Master Node: 192.168.29.137
- Worker Node: 192.168.29.136
- VPS: 212.192.0.214
- Proxy: 127.0.0.1:8080 (HTTP), 127.0.0.1:1080 (SOCKS5)
