#!/bin/bash

# Create manager user with sudo privileges
sudo adduser manager --gecos "Manager,,," --disabled-password
echo "manager:ManagerPass123" | sudo chpasswd
sudo usermod -aG sudo manager

# Create insider user without sudo by default
sudo adduser insider --gecos "Insider,,," --disabled-password
echo "insider:InsiderPass123" | sudo chpasswd

# Create confidential directory and file
sudo mkdir -p /srv/company_secrets
echo "TopSecret: Company Data ABC123" | sudo tee /srv/company_secrets/secret_file.txt

# Set ownership and permissions so only manager can read/write
sudo chown manager:manager /srv/company_secrets/secret_file.txt
sudo chmod 640 /srv/company_secrets/secret_file.txt

echo "Lab setup completed."
Usage:
Save this as example-setup.sh in your scripts/ folder inside your project.

Make it executable:

bash
chmod +x scripts/example-setup.sh
Run the script with:

bash
./scripts/example-setup.sh