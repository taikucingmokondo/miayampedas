#!/bin/bash


echo '[Unit]
Description=Turn on LED after SSH is ready
After=multi-user.target
[Service]
WorkingDirectory=/boot/.pppwn
ExecStart=/boot/.pppwn/run.sh
Restart=never
User=root
Group=root
Environment=NODE_ENV=production
[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/pppwn.service
sudo chmod u+rwx /etc/systemd/system/pppwn.service
sudo systemctl daemon-reload
sudo systemctl enable pppwn
echo -e '\033[36mInstall complete,\033[33m Rebooting\033[0m'

