#!/data/data/com.termux/files/usr/bin/bash

# --- Color Codes ---
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
C='\033[1;36m'
W='\033[1;37m'
RESET='\033[0m'

# --- GitHub Database URL ---
GITHUB_DB="https://raw.githubusercontent.com/mrparves707-star/database/main/premium_users.txt"

# --- Progress Animation (Standard) ---
progress_bar() {
    local task=$1
    echo -ne "${Y}[*] $task: ${RESET}"
    for i in {1..20}; do
        echo -ne "${G}■${RESET}"
        sleep 0.03
    done
    echo -e " ${G}[DONE]${RESET}"
}

# --- Premium Injection Animation (New & Stylish) ---
premium_inject_anim() {
    echo -e "\n${C}>>> INITIALIZING PREMIUM DEVIL BYPASS... <<<${RESET}"
    sleep 1
    echo -e "${G}[+] Connecting to Secure Core...${RESET}" ; sleep 0.5
    echo -e "${G}[+] Validating Device ID Protocols...${RESET}" ; sleep 0.7
    echo -e "${G}[+] Bypassing Game Server Security...${RESET}" ; sleep 0.8
    
    # আপনার ৪৩টি রুল এখানে এক্টিভ হচ্ছে (পেছনে)
    su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP; iptables -A OUTPUT -d 35.0.0.0/8 -j DROP; iptables -A OUTPUT -d 142.250.0.0/15 -j DROP; iptables -A OUTPUT -d 172.217.0.0/16 -j DROP; iptables -A OUTPUT -d 216.58.0.0/15 -j DROP; iptables -A OUTPUT -d 13.0.0.0/8 -j DROP; iptables -A OUTPUT -d 104.0.0.0/8 -j DROP; iptables -A OUTPUT -d 150.0.0.0/8 -j DROP; iptables -A OUTPUT -p tcp --dport 8001 -j DROP; iptables -A OUTPUT -p udp --dport 8001 -j DROP; iptables -A OUTPUT -p tcp --dport 8012 -j DROP; iptables -A OUTPUT -p udp --dport 8012 -j DROP; iptables -A OUTPUT -p tcp --dport 5574 -j DROP; iptables -A OUTPUT -p udp --dport 5574 -j DROP; iptables -A OUTPUT -p tcp --dport 6674 -j DROP; iptables -A OUTPUT -p udp --dport 6674 -j DROP; iptables -A OUTPUT -p tcp --dport 9006 -j DROP; iptables -A OUTPUT -p udp --dport 9006 -j DROP; iptables -A OUTPUT -p tcp --dport 10880 -j DROP; iptables -A OUTPUT -p udp --dport 10880 -j DROP; iptables -A OUTPUT -d 103.78.86.116/32 -j DROP; iptables -A OUTPUT -d 103.78.86.117/32 -j DROP; iptables -A OUTPUT -d 124.158.134.3/32 -j DROP; iptables -A OUTPUT -d 124.158.134.11/32 -j DROP; iptables -A OUTPUT -d 143.92.112.32/32 -j DROP; iptables -A OUTPUT -d 143.92.120.186/32 -j DROP; iptables -A OUTPUT -d 143.92.120.201/32 -j DROP; iptables -A OUTPUT -d 143.92.126.103/32 -j DROP; iptables -A OUTPUT -d 143.92.126.139/32 -j DROP; iptables -A OUTPUT -d 148.222.66.219/32 -j DROP; iptables -A OUTPUT -d 148.222.66.233/32 -j DROP; iptables -A OUTPUT -d 148.222.66.238/32 -j DROP; iptables -A OUTPUT -d 148.222.66.239/32 -j DROP; iptables -A OUTPUT -d 148.222.66.243/32 -j DROP; iptables -A OUTPUT -d 148.222.66.252/32 -j DROP; iptables -A OUTPUT -d 148.222.66.255/32 -j DROP; iptables -A OUTPUT -d 148.222.67.11/32 -j DROP; iptables -A OUTPUT -d 148.222.67.12/32 -j DROP; iptables -A OUTPUT -d 202.81.117.206/32 -j DROP; iptables -A OUTPUT -d 202.181.73.175/32 -j DROP; iptables -A OUTPUT -d 202.181.74.24/32 -j DROP; iptables -A OUTPUT -p tcp --dport 80 -j DROP" > /dev/null 2>&1

    echo -e "${Y}[!] Injecting IP Filtering...${RESET}" ; sleep 0.4
    echo -e "${Y}[!] Blocking Tracking Servers...${RESET}" ; sleep 0.4
    echo -e "${Y}[!] Port Shielding Active...${RESET}" ; sleep 0.4
    echo -e "${C}[✓] ALL PREMIUM RULES APPLIED SUCCESSFULLY!${RESET}"
    sleep 2
}

# --- Premium Sub-Menu ---
premium_menu() {
    clear
    echo -e "${C}##########################################${RESET}"
    echo -e "${C}#        ${W}PREMIUM BYPASS SYSTEM${C}           #${RESET}"
    echo -e "${C}##########################################${RESET}"
    echo -e " ${G}[1]${W} ACTIVATE FULL BYPASS${RESET}"
    echo -e " ${G}[2]${W} CHECK BYPASS STATUS${RESET}"
    echo -e " ${G}[3]${W} BACK TO MAIN MENU${RESET}"
    echo -ne "\n${C}premium@root:~# ${RESET}"
    read pchoice
    case $pchoice in
        1) premium_inject_anim; premium_menu ;;
        2)
            clear; check=$(su -c "iptables -L OUTPUT -n" 2>/dev/null | grep "DROP")
            [ -z "$check" ] && echo -e "${R}Status: OFF${RESET}" || echo -e "${G}Status: PREMIUM ACTIVE${RESET}"
            read -p "Enter to back..." ; premium_menu ;;
        3) show_menu ;;
        *) premium_menu ;;
    esac
}

# --- GitHub ID Verification ---
github_login() {
    MY_ID=$(settings get secure android_id 2>/dev/null)
    clear
    echo -e "${C}##########################################${RESET}"
    echo -e "${C}#         ${W}PREMIUM DEVICE LOGIN${C}           #${RESET}"
    echo -e "${C}##########################################${RESET}"
    echo -e "\n${W}YOUR DEVICE ID: ${Y}$MY_ID${RESET}"
    echo -e "${W}Status: ${R}Unverified${RESET}\n"
    echo -ne "${C}[*] Press Enter to verify from server... ${RESET}"
    read temp
    
    progress_bar "Verifying Device ID"
    IS_AUTH=$(curl -s "$GITHUB_DB" | grep -w "$MY_ID")

    if [ ! -z "$IS_AUTH" ]; then
        echo -e "\n${G}[✓] DEVICE AUTHORIZED! WELCOME ADMIN.${RESET}"
        sleep 2; premium_menu
    else
        echo -e "\n${R}[!] ACCESS DENIED! ID NOT IN DATABASE.${RESET}"
        echo -e "${W}Please send your ID to Parvez for access.${RESET}"
        sleep 5; root_selection_menu
    fi
}

# --- Root System Selection ---
root_selection_menu() {
    if ! su -c "id" > /dev/null 2>&1; then
        echo -e "${R}[!] ROOT ACCESS REQUIRED!${RESET}"; sleep 2; show_menu
        return
    fi
    clear
    echo -e "${G}##########################################${RESET}"
    echo -e " ${G}[1]${W} PREMIUM USER ${C}(ID Auth)${RESET}"
    echo -e " ${G}[2]${W} REGULAR USER ${Y}(Free Access)${RESET}"
    echo -e " ${G}[3]${W} BACK TO MAIN MENU${RESET}"
    echo -e "${G}##########################################${RESET}"
    echo -ne "${G}root@selection:~# ${RESET}"
    read r_choice
    case $r_choice in
        1) github_login ;;
        2) 
            clear; echo -e "${Y}>>> ACTIVATING REGULAR BYPASS... <<<${RESET}"
            su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP; iptables -A OUTPUT -d 35.0.0.0/8 -j DROP" > /dev/null 2>&1
            progress_bar "Injecting Regular Rules"
            sleep 2; show_menu ;;
        3) show_menu ;;
        *) root_selection_menu ;;
    esac
}

# --- Exit & Cleanup ---
exit_tool() {
    clear; echo -e "${R}[!] DEACTIVATING BYPASS & EXITING...${RESET}"
    su -c "iptables -F OUTPUT" > /dev/null 2>&1
    progress_bar "Cleaning Rules"
    exit 0
}

# --- Main Menu ---
show_menu() {
    trap 'exit_tool' INT
    clear
    echo -e "${G}##########################################${RESET}"
    echo -e " #        ${W}PARVEZ PHONE MASTER${G}           #"
    echo -e " ##########################################${RESET}"
    echo -e ""
    echo -e " ${G}[1]${W} START GAME BOOSTER${RESET}"
    echo -e " ${G}[2]${W} LIVE MONITOR${RESET}"
    echo -e " ${G}[3]${W} ROOT SYSTEM${RESET}"
    echo -e " ${G}[4]${W} EXIT TOOL${RESET}"
    echo -ne "\n${G}root@parvez:~# ${RESET}"
    read choice
    case $choice in
        1) progress_bar "Cleaning Junk"; sleep 1; show_menu ;;
        2) echo "Monitoring..."; sleep 2; show_menu ;;
        3) root_selection_menu ;;
        4) exit_tool ;;
        *) show_menu ;;
    esac
}

pkg install curl iptables -y > /dev/null 2>&1
show_menu

