#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
yl='\e[32;1m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Mjoyvpn/DAFTAR/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Mjoyvpn/DAFTAR/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Mjoyvpn/DAFTAR/main/main/allow | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='XRAY'
bec='xray'
else
rekk='V2RAY'
bec='v2ray'
fi

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/Mjoyvpn/DAFTAR/main/main/allow | grep $MYIP | awk '{print $3}')
fi
clear
echo -e "${CYAN}╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕\033[0m${NC}"
echo -e " \E[0;41;36m     ⇱ AutoScript By bahenol Project ⇲                             \E[0m"
echo -e "${CYAN}╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛\033[0m${NC}"
echo -e "   \e[36m[ SSH WebSocket : ${GREEN}ON${NC}\e[36m ]     [ XRAY : ${GREEN}ON${NC}\e[36m ] \033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                                       \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
serverV=$( curl -sS https://raw.githubusercontent.com/Mjoyvpn/KIBO/main/versi)

if [ "$cekup" = "day" ]; then
echo -e "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e "System Uptime   :  $uphours $upminutes"
fi
echo -e "Use Core        :  $rekk"
echo -e "Current Domain  :  $(cat /etc/$bec/domain)"
echo -e "IP-VPS          :  $IPVPS"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 PANEL MENU                                        \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
 [\033[1;36m01\033[0m] Add User SSH   [\033[1;36m07\033[0m] Add Vmess Account
 [\033[1;36m02\033[0m] SSH WS Enable  [\033[1;36m08\033[0m] Add Vless Account
 [\033[1;36m03\033[0m] Cek User SSH   [\033[1;36m09\033[0m] Add Trojan Account
 [\033[1;36m04\033[0m] Del User SSH   [\033[1;36m10\033[0m] Add Sdosok Account
 [\033[1;36m05\033[0m] Renew SSH      [\033[1;36m11\033[0m] Cek User Xray
 [\033[1;36m06\033[0m] Member         [\033[1;36m12\033[0m] Del User Xray
                                      [\033[1;36m13\033[0m] Renew User Xray
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m               Settings MENU                                      \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
 [\033[1;36m14\033[0m] Setting Menu [${GREEN}Pro${NC}] [\033[1;36m21\033[0m] Cek Pkt bulanan${NC}
 [\033[1;36m15\033[0m] Gen SSL            [\033[1;36m22\033[0m] Cek Pkt \033[1;33mHarian${NC}
 [\033[1;36m16\033[0m] Cek Status ${GREEN}RUNNING${NC}
 [\033[1;36m17\033[0m] Reboot VPS ${GREEN}X-Ray${NC}
 [\033[1;36m18\033[0m] Restart VPS${NC}
 [\033[1;36m19\033[0m] ${RED}SEtting Pasword VPS${NC}
 [\033[1;36m20\033[0m] ${BLUE}SEtting Auto Reboot${NC}
echo ""
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
echo -ne
else
echo ""
fi
echo -e "\033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
echo -e "\e[36m╒═════════════════════════════════════════════╕\033[0m"
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
echo -e "Client Name   : $Name"
echo -e "Expiry script : LIFETIME"
echo -e "\e[36m╘═════════════════════════════════════════════╕\033[0m"
echo -e ""
echo -e "\e[36m╒═════════════════════════════════════════════╕\033[0m"
echo -e "           AUTO SCRIPT BY JOYSMARK                                               \E[0m"
echo -e "\e[36m╘═════════════════════════════════════════════╛\033[0m"
echo ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       usernew
    elif [[ $x -eq 2 ]]; then
       sshws
    elif [[ $x -eq 3 ]]; then
       cek
    elif [[ $x -eq 4 ]]; then
       hapus
    elif [[ $x -eq 5 ]]; then
       renew
    elif [[ $x -eq 6 ]]; then
       member
    elif [[ $x -eq 7 ]]; then
       add-ws
    elif [[ $x -eq 8 ]]; then
       add-vless
    elif [[ $x -eq 9 ]]; then
       add-tr
    elif [[ $x -eq 10 ]]; then
       add-ssws
    elif [[ $x -eq 11 ]]; then
       cek-user
    elif [[ $x -eq 12 ]]; then
       del-user
    elif [[ $x -eq 13 ]]; then
       renew-xray
    elif [[ $x -eq 14 ]]; then
       setting-menu
    elif [[ $x -eq 15 ]]; then
       crtv2ray
    elif [[ $x -eq 16 ]]; then
       running
    elif [[ $x -eq 17 ]]; then
       reboot
    elif [[ $x -eq 18 ]]; then
       restart
    elif [[ $x -eq 19 ]]; then
       passwd
    elif [[ $x -eq 20 ]]; then
       autoreboot
    elif [[ $x -eq 21 ]]; then
       vnstat
    elif [[ $x -eq 22 ]]; then
       vnstat -d
    else
       menu
    fi
fi
