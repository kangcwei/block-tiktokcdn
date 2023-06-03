#!/bin/bash
# Create Crontab auto Reboot Service
#echo "0 */6 * * * root reboot" >> /etc/crontab
# Reload Crontab
#systemctl restart  cron.service
# Create AutoStart Service
cat >/etc/systemd/system/block-tiktok.service<<EOF
[Unit]
Description=Block tiktok video Nameserver
After=default.target

[Service]
ExecStart=/sbin/iptables  -A OUTPUT -m string --string "tiktokcdn.com" --algo bm --to 65535 -j DROP

[Install]
WantedBy=default.target
EOF
systemctl enable block-tiktok.service
iptables  -A OUTPUT -m string --string "tiktokcdn.com" --algo bm --to 65535 -j DROP
