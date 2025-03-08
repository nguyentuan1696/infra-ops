# Define variables
INVENTORY ?= inventory.yml
PLAYBOOK ?= playbook.yml
ANSIBLE_FLAGS ?= -v

# Run Ansible Playbook
run:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) $(ANSIBLE_FLAGS)

# Check Ansible syntax before running
check:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) --syntax-check

# List available hosts in inventory
hosts:
	ansible-inventory -i $(INVENTORY) --list

# Test connection to all hosts
ping:
	ansible all -i $(INVENTORY) -m ping

# Run playbook with dry-run (check mode)
dry-run:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) --check

# Clean up cached facts (optional)
clean:
	rm -rf .ansible/

# Test locally using localhost inventory
test-local:
	ansible-playbook -i inventory.local.yml $(PLAYBOOK) $(ANSIBLE_FLAGS)
