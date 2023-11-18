#!/bin/bash
clear
if [ ! -e /etc/encrypt ]; then
  mkdir -p /etc/encrypt
else
echo > /dev/null
fi

cd /etc/encrypt
if [[ xyz -gt 0 ]]; then
wget -qO- /usr/bin/xyz "https://raw.githubusercontent.com/myzhero/v3/main/example/zheevpn/xyz"
chmod +x /usr/bin/xyz
else
echo > /dev/null
cd
fi
cd

m-eshc(){
clear
figlet 'SHC' | lolcat
read -p "Input Dictory File !" -e dictory
cd ${dictory}
ls
read -p "Input File Name !" -e encshc
shc -rf $encshc
rm -rf $encshc
rm -rf ${encshc}.x.c
mv ${encshc}.x $encshc
clear 
echo -e "Encrypt Using SHC Success" | lolcat
sleep 2
sh /etc/encrypt/xyz.sh
}

m-ebzip2(){
clear
figlet 'Bzip2' | lolcat
read -p "Input Dictory File !" -e dictory
cd ${dictory}
ls
read -p "Input File Name !" -e encshc
xyz $encshc
rm -rf $encshc
mv ${encshc}~ $encshc
clear 
echo -e "Encrypt Using BZIP2 Success" | lolcat
sleep 2
sh /etc/encrypt/xyz.sh
}

x="\e[0m"
g="\e[1;92m"
y="\e[1;93m"
b="\e[1;36m"
clear
echo -e "${y}┌──────────────────────────────────────────┐${x}"
echo -e "${y}│${x}               $g MENU ENCRYPT                  ${x}"
echo -e "${y}└──────────────────────────────────────────┘${x}"
echo -e "${y}┌──────────────────────────────────────────┐${x}"
echo -e "${y}│${x}${g} 1.${x} ${b}Encrypt Using Bzip2 $x "
echo -e "${y}│${x}${g} 2.${x} ${b}Encrypt Using SHC $x "
echo -e "${y}│${x}${g} x.${x} ${b}Back To Menu $x "
echo -e "${y}└──────────────────────────────────────────┘{x}"
echo ""
read -p "  Select Menu From Options [ 1 - 2 or x ] : " ztunnel
echo ""
if [[ $ztunnel == "1" ]]; then
clear
m-ebzip2
elif [[ $ztunnel == "2" ]]; then
clear
m-eshc
elif [[ $ztunnel == "x" ]]; then
menu
else
clear 
echo -e "Input Degan Benar !" 
sleep 2
sh /etc/encrypt/xyz.sh
fi
