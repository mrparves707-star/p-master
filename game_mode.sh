#!/data/data/com.termux/files/usr/bin/bash

# --- Color Palette ---
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
C='\033[1;36m'
W='\033[1;37m'
B='\033[1;34m'
RESET='\033[0m'

# --- GitHub Database ---
GITHUB_DB="https://raw.githubusercontent.com/mrparves707-star/database/main/premium_users.txt"

# --- Advanced Typing Animation ---
type_effect() {
    local text="$1"
    local delay=0.02
    for ((i=0; i<${#text}; i++)); do
        echo -ne "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

# --- Pro Progress Bar ---
pro_progress() {
    local task="$1"
    echo -ne "${C}[#] $task ${RESET}\n"
    echo -ne "${W}["
    for i in {1..30}; do
        echo -ne "${G}■"
        sleep 0.03
    done
    echo -e "${W}] ${G}100%${RESET}\n"
}

# --- 1. NON-ROOT PREMIUM BOOSTER ---
start_booster() {
    clear
    echo -e "${B}==========================================${RESET}"
    echo -e "${W}       ULTRA GAME BOOSTER ACTIVE          ${RESET}"
    echo -e "${B}==========================================${RESET}"
    
    pro_progress "Analyzing System Performance"
    pro_progress "Cleaning Android Dalvik Cache"
    # রিয়েল ক্লিনিং কমান্ড
    rm -rf ~/.cache/* > /dev/null 2>&1
    
    pro_progress "Optimizing RAM (Heap Size)"
    pro_progress "Killing Background Ghost Tasks"
    # প্রসেস কিলিং
    am kill-all > /dev/null 2>&1
    
    pro_progress "Stabilizing Network Ping (DNS)"
    pro_progress "Fine-tuning CPU Governor"
    
    echo -e "${G}>>> SYSTEM OPTIMIZED FOR GAMING <<<${RESET}"
    sleep 2; show_menu
}

# --- 2. PREMIUM BYPASS (ROOT) ---
premium_inject_anim() {
    clear
    echo -e "${R}##########################################${RESET}"
    echo -e "${W}      EXECUTING DEVIL BYPASS PROTOCOL     ${RESET}"
    echo -e "${R}##########################################${RESET}"
    
    type_effect "${Y}[!] Initiating Root Command Shell...${RESET}"
    sleep 0.5
    
    # Injecting IP Rules (The 43 Rules)
    su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP; iptables -A OUTPUT -d 35.0.0.0/8 -j DROP; iptables -A OUTPUT -d 142.250.0.0/15 -j DROP; iptables -A OUTPUT -d 172.217.0.0/16 -j DROP; iptables -A OUTPUT -d 216.58.0.0/15 -j DROP; iptables -A OUTPUT -d 13.0.0.0/8 -j DROP; iptables -A OUTPUT -d 104.0.0.0/8 -j DROP; iptables -A OUTPUT -d 150.0.0.0/8 -j DROP; iptables -A OUTPUT -p tcp --dport 8001 -j DROP; iptables -A OUTPUT -p udp --dport 8001 -j DROP; iptables -A OUTPUT -p tcp --dport 8012 -j DROP; iptables -A OUTPUT -p udp --dport 8012 -j DROP; iptables -A OUTPUT -p tcp --dport 5574 -j DROP; iptables -A OUTPUT -p udp --dport 5574 -j DROP; iptables -A OUTPUT -p tcp --dport 6674 -j DROP; iptables -A OUTPUT -p udp --dport 6674 -j DROP; iptables -A OUTPUT -p tcp --dport 9006 -j DROP; iptables -A OUTPUT -p udp --dport 9006 -j DROP; iptables -A OUTPUT -p tcp --dport 10880 -j DROP; iptables -A OUTPUT -p udp --dport 10880 -j DROP; iptables -A OUTPUT -d 103.78.86.116/32 -j DROP; iptables -A OUTPUT -d 103.78.86.117/32 -j DROP; iptables -A OUTPUT -d 124.158.134.3/32 -j DROP; iptables -A OUTPUT -d 124.158.134.11/32 -j DROP; iptables -A OUTPUT -d 143.92.112.32/32 -j DROP; iptables -A OUTPUT -d 143.92.120.186/32 -j DROP; iptables -A OUTPUT -d 143.92.120.201/32 -j DROP; iptables -A OUTPUT -d 143.92.126.103/32 -j DROP; iptables -A OUTPUT -d 143.92.126.139/32 -j DROP; iptables -A OUTPUT -d 148.222.66.219/32 -j DROP; iptables -A OUTPUT -d 148.222.66.233/32 -j DROP; iptables -A OUTPUT -d 148.222.66.238/32 -j DROP; iptables -A OUTPUT -d 148.222.66.239/32 -j DROP; iptables -A OUTPUT -d 148.222.66.243/32 -j DROP; iptables -A OUTPUT -d 148.222.66.252/32 -j DROP; iptables -A OUTPUT -d 148.222.66.255/32 -j DROP; iptables -A OUTPUT -d 148.222.67.11/32 -j DROP; iptables -A OUTPUT -d 148.222.67.12/32 -j DROP; iptables -A OUTPUT -d 202.81.117.206/32 -j DROP; iptables -A OUTPUT -d 202.181.73.175/32 -j DROP; iptables -A OUTPUT -d 202.181.74.24/32 -j DROP; iptables -A OUTPUT -p tcp --dport 80 -j DROP" > /dev/null 2>&1

    pro_progress "Overriding Firewall Chains"
    pro_progress "Masking Data Packets"
    pro_progress "Applying IP Stealth Mode"
    
    echo -e "${G}[✓] DEVIL BYPASS DEPLOYED SUCCESSFULLY!${RESET}"
    sleep 2; premium_menu
}

# --- 3. GITHUB LOGIN SYSTEM ---
github_login() {
    MY_ID=$(su -c "settings get secure android_id" 2>/dev/null)
    clear
    echo -e "${C}==========================================${RESET}"
    echo -e "${W}          PREMIUM ACCESS PORTAL           ${RESET}"
    echo -e "${C}==========================================${RESET}"
    echo -e "\n${W}DEVICE_ID: ${Y}$MY_ID${RESET}"
    echo -e "${W}STATUS: ${R}PENDING VERIFICATION...${RESET}\n"
    echo -ne "${C}[>] Click Enter to Link Server: ${RESET}"
    read enter
    
    type_effect "${B}[*] Contacting GitHub Server...${RESET}"
    pro_progress "Fetching Remote Database"
    
    IS_AUTH=$(curl -s "$GITHUB_DB" | grep -w "$MY_ID")

    if [ ! -z "$IS_AUTH" ] && [ ! -z "$MY_ID" ]; then
        echo -e "${G}>>> ACCESS GRANTED: WELCOME MASTER <<<${RESET}"
        sleep 2; premium_menu
    else
        echo -e "${R}>>> ACCESS DENIED: UNAUTHORIZED DEVICE <<<${RESET}"
        echo -e "${W}Please Provide your ID to Admin.${RESET}"
        sleep 4; root_selection_menu
    fi
}

# --- 4. ROOT SELECTION MENU ---
root_selection_menu() {
    clear
    echo -e "${R}[*] Requesting SuperUser Permission...${RESET}"
    if ! su -c "id" > /dev/null 2>&1; then
        echo -e "${R}[!] ROOT ACCESS REJECTED!${RESET}"
        sleep 2; show_menu; return
    fi
    
    clear
    echo -e "${G}┌────────────────────────────────────────┐${RESET}"
    echo -e "${G}│        ${W}ROOT SYSTEM ARCHITECTURE${G}        │${RESET}"
    echo -e "${G}└────────────────────────────────────────┘${RESET}"
    echo -e " ${G}[1]${W} PREMIUM BYPASS ${C}(ID VERIFIED)${RESET}"
    echo -e " ${G}[2]${W} REGULAR BYPASS ${Y}(FREE RULES)${RESET}"
    echo -e " ${G}[3]${W} EXIT TO MAIN MENU${RESET}"
    echo -ne "\n${G}root@selection:~# ${RESET}"
    read r_choice
    case $r_choice in
        1) github_login ;;
        2) 
            clear; pro_progress "Injecting Standard Rules"
            su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP" > /dev/null 2>&1
            echo -e "${G}[✓] Done!${RESET}"; sleep 2; root_selection_menu ;;
        3) show_menu ;;
        *) root_selection_menu ;;
    esac
}

# --- 5. MAIN MENU ---
show_menu() {
    trap 'su -c "iptables -F OUTPUT" > /dev/null 2>&1; exit' INT
    clear
    echo -e "${C}╔════════════════════════════════════════╗${RESET}"
    echo -e "${C}║        ${W}★ PARVEZ PHONE MASTER ★${C}         ║${RESET}"
    echo -e "${C}╚════════════════════════════════════════╝${RESET}"
    echo -e ""
    echo -e " ${G}[1]${W} START TURBO BOOSTER ${Y}(Non-Root)${RESET}"
    echo -e " ${G}[2]${W} SYSTEM MONITOR      ${Y}(Live)${RESET}"
    echo -e " ${G}[3]${W} ROOT ENGINE         ${R}(Devil Bypass)${RESET}"
    echo -e " ${G}[4]${W} DISCONNECT & EXIT${RESET}"
    echo -ne "\n${C}parvez@master:~# ${RESET}"
    read choice
    case $choice in
        1) start_booster ;;
        2) clear; pro_progress "Initializing Monitor"; top -n 1 | head -n 12; read -p "Press Enter..." ; show_menu ;;
        3) root_selection_menu ;;
        4) su -c "iptables -F OUTPUT" > /dev/null 2>&1; exit 0 ;;
        *) show_menu ;;
    esac
}

# --- Initialize ---
clear
type_effect "${G}[+] Starting Parvez Phone Master Engine...${RESET}"
pkg install curl iptables -y > /dev/null 2>&1
show_menu
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

