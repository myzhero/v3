#!/bin/bash
apt -y remove dropbear
sleep 0.5
apt -y purge dropbear
sleep 0.5
apt-get -y --purge remove dropbear
sleep 0.5
apt-get install dropbear -y > /dev/null 2>&1
wget -q -O /etc/default/dropbear "https://raw.githubusercontent.com/myzhero/v3/files/dropbear.conf"
chmod +x /etc/default/dropbear
/etc/init.d/dropbear restart
systemctl restart dropbear
