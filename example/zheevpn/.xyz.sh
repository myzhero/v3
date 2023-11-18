#!/bin/bash
clear
if [ ! -e /etc/encrypt ]; then
  mkdir -p /etc/encrypt
else
echo > /dev/null
fi

m-eshc(){
clear
figlet 'SHC' | lolcat
read -p "Input Dictory File ! : " -e dictory
cd ${dictory}
ls
read -p "Input File Name ! : " -e encshc
shc -rf $encshc
rm -rf $encshc
rm -rf ${encshc}.x.c
mv ${encshc}.x $encshc
clear 
echo -e "Encrypt Using SHC Success" | lolcat
sleep 2
bash .xyz.sh
}

m-ebzip2(){
clear
figlet 'Bzip2' | lolcat
read -p "Input Dictory File ! : " -e dictory
cd ${dictory}
ls
read -p "Input File Name ! : " -e encshc
xyz $encshc
rm -rf $encshc
mv ${encshc}~ $encshc
clear 
echo -e "Encrypt Using BZIP2 Success" | lolcat
sleep 2
bash .xyz.sh
}

x="\e[0m"
g="\e[1;92m"
y="\e[1;93m"
b="\e[1;36m"
clear
echo -e "${y}┌──────────────────────────────────────────┐${x}"
echo -e "${y}│${x}              $g MENU ENCRYPT               ${y}│${x}"
echo -e "${y}└──────────────────────────────────────────┘${x}"
echo -e "${y}┌──────────────────────────────────────────┐${x}"
echo -e "${y}│${x}${g} 1.${x} ${b}Encrypt Using Bzip2 $x "
echo -e "${y}│${x}${g} 2.${x} ${b}Encrypt Using SHC $x "
echo -e "${y}│${x}${g} 3.${x} ${b}Download Bzip File $x "
echo -e "${y}│${x}${g} x.${x} ${b}Back To Menu $x "
echo -e "${y}└──────────────────────────────────────────┘${x}"
echo ""
read -p "  Select Menu From Options [ 1 - 3 or x ] : " ztunnel
echo ""
if [[ $ztunnel == "1" ]]; then
clear
m-ebzip2
elif [[ $ztunnel == "2" ]]; then
clear
m-eshc
elif [[ $ztunnel == "3" ]]; then
clear
cd /usr/bin
wget -q -O xyz "https://raw.githubusercontent.com/myzhero/v3/main/example/zheevpn/xyz" ; chmod +x xyz ; ./xyz
cd
bash .xyz.sh
elif [[ $ztunnel == "x" ]]; then
menu
else
clear 
echo -e "Input Degan Benar !" 
sleep 2
bash .xyz.sh
fi
