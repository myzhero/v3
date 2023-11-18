#!/bin/bash
clear
if [ ! -e /etc/encrypt ]; then
  mkdir -p /etc/encrypt
fi

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
echo -e "Encrypt SHC Success" | lolcat
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
read -p "  Select Menu From Options [ 1 - 3 or x ] : " fvstore
echo ""
if [[ $fvstore == "1" ]]; then
echo ""
elif [[ $fvstore == "2" ]]; then
clear
m-eshc
elif [[ $fvstore == "x" ]]; then
menu
else
clear 
echo -e "Input Degan Benar !" 
sleep 2
sh /etc/encrypt/xyz.sh
fi
