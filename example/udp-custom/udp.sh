#!/bin/bash
clear
cd
rm -rf /root/udp
mkdir -p /root/udp

# change to time GMT+7
echo "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -qO- /root/udp/udp-custom 'https://raw.githubusercontent.com/myzhero/v3/main/fv-tunnel/udp-custom-linux-amd64'
chmod +x /root/udp/udp-custom
sleep 2
echo downloading default config
wget -qO- /root/udp/config.json 'https://raw.githubusercontent.com/myzhero/v3/main/fv-tunnel/config.json'
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

systemctl start udp-custom &>/dev/null
systemctl enable udp-custom &>/dev/null
systemctl restart udp-custom &>/dev/null
rm -rf udp.sh