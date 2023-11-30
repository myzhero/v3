#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
b="\033[1;36m"
bg="\e[1;97;101m"
g="\e[1;92m"
RED="\e[1;31m"
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
#wget https://raw.githubusercontent.com/myzhero/v3/main/files/bot.zip
#unzip bot.zip
#mv bot/* /usr/bin
#chmod +x /usr/bin/*
#rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/myzhero/v3/main/files/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt

#isi data
clear
echo ""
echo -e "${b}=━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━=${NC}"
echo -e " ${bg}             ADD BOT PANEL              ${NC}"
echo -e "${b}=━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━=${NC}"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "${b}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━=${NC}"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

cat > /etc/systemd/system/zhee.service << END
[Unit]
Description=Simple zhee - @zheevpn
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start zhee
systemctl enable zhee
systemctl restart zhee
cd /root

bott=$(systemctl status zhee | grep running | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE BOT
if [[ $bott == "running" ]]; then 
   status_bott="${g}Online$NC"
   else
   status_bott="${RED}Offline${NC} "
fi

rm -rf ins-bot.sh
clear
echo -e "${b}=━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━=${NC}"
echo -e "        $g .::. ${NC}INFO BOT PANEL${g} .::.        ${NC}"
echo -e "${b}=━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━=${NC}"
echo -e " • Status BOT = $status_bott "
echo ""
echo -e " • Token BOT = $bottoken"
echo -e " • Admin ID  = $admin"
echo -e " • Dubdomain = $domain"
echo -e "${b}=━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━=${NC}"
echo -e " Installations complete, type /menu or .menu on your bot "
read -p "Press Enter For Back To Menu"
menu
