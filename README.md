## Overview

InfraOps is an infrastructure automation project using Ansible to provision and manage services such as:

- Nginx (Web server & reverse proxy)
- Docker (Container management)
- PostgreSQL (Database)
- Grafana (Monitoring & visualization)
- Prometheus (Metrics collection & alerting)

## Prerequisites

Ensure you have the following installed:

- Ansible (>=2.9)
- SSH access to target servers
- Python (>=3.6)

## Installation

### Install via Ansible Galaxy

You can install this role from Ansible Galaxy:
```bash
ansible-galaxy install nguyentuan1696.infra-ops
```
More details at: [Ansible Galaxy - InfraOps](https://galaxy.ansible.com/ui/standalone/roles/nguyentuan1696/infra-ops/install/)

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/nguyentuan1696/infraops.git
cd infraops
```

2. Configure your inventory in inventory.ini:
```yaml
all:
  hosts:
    web:
      ansible_host: 127.0.0.1
      ansible_user: root
```

3. Run the Ansible playbook
```bash 
ansible-playbook -i inventory.yml playbook.yml
```

## Monitoring Dashboard
Once deployed, access Grafana at: `http://your-server-ip:9090`

## Note

1. **Access the Server**: Log in to your server and create an SSH key.

   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_ansible -N ""
   ```

2. **Add the Public Key**: Append the contents of `id_rsa_ansible.pub` to the `authorized_keys` file to allow SSH access.

   ```bash
   cat ~/.ssh/id_rsa_ansible.pub >> ~/.ssh/authorized_keys
   ```

3. **Set Correct Permissions**: Ensure that the permissions for the `authorized_keys` file and the `.ssh` directory are set correctly to enhance security.

   ```bash
   chmod 600 ~/.ssh/authorized_keys
   chmod 700 ~/.ssh
   ```

4. **Copy the Private Key**: Make sure to securely copy the contents of `~/.ssh/id_rsa_ansible` to your local machine or wherever you need to use it.

   ```bash
   cat ~/.ssh/id_rsa_ansible
   ```

### Important Notes

- Keep your private key secure and do not share it publicly.
- Ensure that the SSH service is running on your server to allow connections.
- If you encounter any issues, check the SSH configuration and firewall settings.

## Completely remove PostgreSQL

To completely remove PostgreSQL from your system, follow these steps:

### **1. Stop the PostgreSQL Service**
```bash
sudo systemctl stop postgresql
```

### **2. Uninstall PostgreSQL and Related Packages**
```bash
sudo apt remove --purge postgresql postgresql-*
```

### **3. Remove PostgreSQL Data and Configuration Files**
```bash
sudo rm -rf /var/lib/postgresql/
sudo rm -rf /etc/postgresql/
sudo rm -rf /etc/postgresql-common/
sudo rm -rf /var/log/postgresql/
```

### **4. Remove PostgreSQL User and Group (Optional)**
```bash
sudo deluser postgres
sudo delgroup postgres
```

### **5. Clean Up Unused Dependencies**
```bash
sudo apt autoremove
sudo apt autoclean
```

### **6. Verify PostgreSQL is Completely Removed**
Check if any PostgreSQL-related services or files are still present:
```bash
psql --version
```
or
```bash
dpkg -l | grep postgresql
```
## Contributing

Feel free to open issues and pull requests

## License

MIT License

## Contact

For any inquiries, reach out via email: nguyentuan1696@gmail.com or telegram: @nguyentuan1696