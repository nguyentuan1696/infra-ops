# InfraOps

InfraOps is a comprehensive infrastructure automation project using Ansible to provision, manage, and monitor a modern containerized environment. It simplifies the deployment of core services, monitoring stacks, and security tools.

## Features

This project automates the deployment of the following services:

- **Core Infrastructure**:
  - **Docker**: Container runtime and network setup.
  - **Traefik**: Modern reverse proxy and load balancer with dashboard support.
  - **Portainer**: Web-based UI for managing Docker containers.

- **Data Services**:
  - **PostgreSQL**: Relational database system.
  - **Redis**: In-memory data structure store.
  - **MinIO**: High-performance object storage (S3 compatible).

- **Security**:
  - **HashiCorp Vault**: Secret management and data protection.

- **Monitoring & Observability**:
  - **Prometheus**: Metrics collection and alerting.
  - **Grafana**: Visualization dashboards (Pre-configured for Docker, Redis, Postgres, etc.).
  - **Alertmanager**: Handling alerts from Prometheus.
  - **Loki & Promtail**: Log aggregation and querying.
  - **cAdvisor & Node Exporter**: Container and system metric exporters.

## Prerequisites

- **Ansible** (>= 2.9)
- **SSH Access** to the target servers.
- **Python** (>= 3.8) on the control node.
- Target User with `sudo` privileges.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/nguyentuan1696/infraops.git
   cd infraops
   ```

2. **Configure Inventory:**
   Edit `inventory.yml` to match your target servers:
   ```yaml
   all:
     hosts:
       your-server:
         ansible_host: 192.168.1.100
         ansible_user: your-user
   ```

3. **Configure Variables (Optional):**
   Check `group_vars/all.yml` or role-specific `defaults/main.yml` to customize ports, versions, or passwords.

4. **Run the Playbook:**
   ```bash
   ansible-playbook -i inventory.yml playbook.yml
   ```
   
   To run specific tags (e.g., only deploy traefik):
   ```bash
   ansible-playbook -i inventory.yml playbook.yml --tags traefik
   ```

## Project Structure

```
infra-ops/
├── group_vars/          # Global variables
├── roles/               # Ansible roles
│   ├── common/          # Basic system setup
│   ├── docker/          # Docker engine setup
│   ├── minio/           # Object storage
│   ├── monitoring/      # Observability stack (Prometheus, Grafana, Loki, etc.)
│   ├── portainer/       # Container management UI
│   ├── postgresql/      # Database
│   ├── redis/           # Cache
│   ├── traefik/         # Reverse Proxy
│   └── vault/           # Secrets management
├── inventory.yml        # Server inventory
├── playbook.yml         # Main playbook
└── README.md            # Documentation
```

## Services & Access

After successful deployment, you can access the services at the following endpoints (default ports):

| Service | Port | Description |
|---------|------|-------------|
| **Traefik Dashboard** | `8080` | Load Balancer Dashboard |
| **Portainer** | `9000` | Docker Management UI |
| **Grafana** | `3000` | Monitoring Dashboards (Login: admin/admin) |
| **Prometheus** | `9090` | Metrics Browser |
| **MinIO Console** | `9001` | Object Storage UI |
| **Vault UI** | `8200` | Secrets Management UI |
| **PostgreSQL** | `5432` | Database Connection |
| **Redis** | `6379` | Cache Connection |

*Note: Ensure your firewall allows traffic on these ports or access them via SSH tunneling.*

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.

## License

MIT License

## Contact

For any inquiries, reach out via email: nguyentuan1696@gmail.com or Telegram: [@nguyentuan1696](https://t.me/nguyentuan1696)
