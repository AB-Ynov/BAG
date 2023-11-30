```bash
#!/bin/bash

# Installation de MariaDB
sudo apt-get update
sudo apt-get install -y mariadb-server

# Démarrage et activation au démarrage du service
sudo systemctl start mariadb
sudo systemctl enable mariadb
```
