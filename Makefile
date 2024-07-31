# Makefile

# Переменные
INVENTORY_FILE = inventory.ini
PLAYBOOK_FILE = site.yml

# Задачи
.PHONY: prepare
prepare: install_ansible install_role run_playbook

.PHONY: install_ansible
install_ansible:
	@if ! command -v ansible &> /dev/null; then \
		echo "Ansible не установлен. Устанавливаем..."; \
		sudo apt update && sudo apt install -y ansible || \
		sudo yum install epel-release && sudo yum install -y ansible || \
		brew install ansible; \
	else \
		echo "Ansible уже установлен."; \
	fi

.PHONY: install_role
install_role:
	ansible-galaxy role install geerlingguy.pip

.PHONY: run_playbook
run_playbook:
	ansible-playbook -i $(INVENTORY_FILE) $(PLAYBOOK_FILE)
