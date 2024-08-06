setup:
	ansible-playbook playbook_setup.yml -i inventory.ini --vault-password-file vault_password

deploy:
	ansible-playbook playbook.yml --tags deploy -i inventory.ini --vault-password-file vault_password

monitoring:
	ansible-playbook playbook.yml --tags datadog -i inventory.ini --vault-password-file vault_password