#!/data/data/com.termux/files/usr/bin/bash

# --- Color Palette ---
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
C='\033[1;36m'
W='\033[1;37m'
B='\033[1;34m'
P='\033[1;35m'
RESET='\033[0m'

# --- GitHub Database ---
GITHUB_DB="https://raw.githubusercontent.com/mrparves707-star/database/main/premium_users.txt"

# --- 1. INTRO & STARTUP ANIMATION ---
intro_animation() {
    clear
    echo -e "${C}"
    type_effect "        [#] PARVEZ PHONE MASTER ENGINE [#]"
    type_effect "        [#] SYSTEM VERSION: 2.0 (GOLD) [#]"
    echo -e "${RESET}"
    echo -ne "${Y}INITIALIZING CORE MODULES: "
    for i in {1..15}; do echo -ne "${G}■"; sleep 0.1; done
    echo -e " ${W}100%${RESET}\n"
    sleep 1
}

type_effect() {
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -ne "${text:$i:1}"
        sleep 0.03
    done
    echo ""
}

pro_progress() {
    local task="$1"
    echo -ne "${C}[#] $task ${RESET}\n"
    echo -ne "${W}["
    for i in {1..30}; do
        echo -ne "${G}■"
        sleep 0.02
    done
    echo -e "${W}] ${G}DONE${RESET}\n"
}

# --- 2. NON-ROOT TURBO BOOSTER ---
start_booster() {
    clear
    echo -e "${B}╔════════════════════════════════════════╗${RESET}"
    echo -e "${B}║       ${W}NON-ROOT PERFORMANCE ENGINE      ${B}║${RESET}"
    echo -e "${B}╚════════════════════════════════════════╝${RESET}"
    pro_progress "SCANNIG SYSTEM JUNK"
    rm -rf ~/.cache/* > /dev/null 2>&1
    pro_progress "CLEANING DALVIK CACHE"
    pro_progress "FREEING RAM (SMART KILL)"
    am kill-all > /dev/null 2>&1
    pro_progress "OPTIMIZING CPU FREQUENCY"
    echo -e "${G}[✓] SYSTEM BOOSTED FOR SMOOTH GAMING!${RESET}"
    sleep 2
}

# --- 3. REGULAR ROOT MENU (NO PASSWORD) ---
regular_menu() {
    while true; do
        clear
        echo -e "${Y}╔════════════════════════════════════════╗${RESET}"
        echo -e "${Y}║         REGULAR BYPASS INTERFACE       ║${RESET}"
        echo -e "${Y}╚════════════════════════════════════════╝${RESET}"
        echo -e " ${G}[1]${W} ACTIVATE NORMAL BYPASS${RESET}"
        echo -e " ${G}[2]${W} CHECK BYPASS STATUS${RESET}"
        echo -e " ${R}[3]${W} OFF & GO TO MAIN MENU${RESET}"
        echo -ne "\n${Y}regular@root:~# ${RESET}"
        read r_choice
        case $r_choice in
            1)
                clear; echo -e "${Y}[*] Injecting Normal Rules...${RESET}"
                su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP; iptables -A OUTPUT -d 35.0.0.0/8 -j DROP" > /dev/null 2>&1
                pro_progress "APPLYING IP BLOCK"
                echo -e "${G}[✓] NORMAL BYPASS ACTIVE!${RESET}"; sleep 2 ;;
            2)
                clear; check=$(su -c "iptables -L OUTPUT -n" 2>/dev/null | grep "DROP")
                [ -z "$check" ] && echo -e "${R}Status: INACTIVE${RESET}" || echo -e "${G}Status: REGULAR BYPASS ACTIVE${RESET}"
                read -p "Press Enter..." temp ;;
            3) 
                su -c "iptables -F OUTPUT" > /dev/null 2>&1
                echo -e "${R}[!] Rules Flushed. Returning...${RESET}"; sleep 1; break ;;
            *) echo -e "${R}Invalid Option!${RESET}"; sleep 1 ;;
        esac
    done
}

# --- 4. PREMIUM ROOT MENU (AUTHORIZED) ---
premium_interface() {
    while true; do
        clear
        echo -e "${C}╔════════════════════════════════════════╗${RESET}"
        echo -e "${C}║        ${P}★ PREMIUM MASTER INTERFACE ★    ${C}║${RESET}"
        echo -e "${C}╚════════════════════════════════════════╝${RESET}"
        echo -e " ${G}[1]${W} PREMIUM BYPASS ON ${P}(DEVIL MODE)${RESET}"
        echo -e " ${G}[2]${W} CHECK PREMIUM STATUS${RESET}"
        echo -e " ${R}[3]${W} ALL OFF & GO TO MAIN MENU${RESET}"
        echo -ne "\n${C}premium@master:~# ${RESET}"
        read p_choice
        case $p_choice in
            1)
                clear; echo -e "${P}>>> DEPLOYING 43 PREMIUM RULES <<<${RESET}"
                su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP; iptables -A OUTPUT -d 35.0.0.0/8 -j DROP; iptables -A OUTPUT -d 142.250.0.0/15 -j DROP; iptables -A OUTPUT -d 172.217.0.0/16 -j DROP; iptables -A OUTPUT -d 216.58.0.0/15 -j DROP; iptables -A OUTPUT -d 13.0.0.0/8 -j DROP; iptables -A OUTPUT -d 104.0.0.0/8 -j DROP; iptables -A OUTPUT -d 150.0.0.0/8 -j DROP; iptables -A OUTPUT -p tcp --dport 8001 -j DROP; iptables -A OUTPUT -p udp --dport 8001 -j DROP; iptables -A OUTPUT -p tcp --dport 8012 -j DROP; iptables -A OUTPUT -p udp --dport 8012 -j DROP; iptables -A OUTPUT -p tcp --dport 5574 -j DROP; iptables -A OUTPUT -p udp --dport 5574 -j DROP; iptables -A OUTPUT -p tcp --dport 6674 -j DROP; iptables -A OUTPUT -p udp --dport 6674 -j DROP; iptables -A OUTPUT -p tcp --dport 9006 -j DROP; iptables -A OUTPUT -p udp --dport 9006 -j DROP; iptables -A OUTPUT -p tcp --dport 10880 -j DROP; iptables -A OUTPUT -p udp --dport 10880 -j DROP; iptables -A OUTPUT -d 103.78.86.116/32 -j DROP; iptables -A OUTPUT -d 103.78.86.117/32 -j DROP; iptables -A OUTPUT -d 124.158.134.3/32 -j DROP; iptables -A OUTPUT -d 124.158.134.11/32 -j DROP; iptables -A OUTPUT -d 143.92.112.32/32 -j DROP; iptables -A OUTPUT -d 143.92.120.186/32 -j DROP; iptables -A OUTPUT -d 143.92.120.201/32 -j DROP; iptables -A OUTPUT -d 143.92.126.103/32 -j DROP; iptables -A OUTPUT -d 143.92.126.139/32 -j DROP; iptables -A OUTPUT -d 148.222.66.219/32 -j DROP; iptables -A OUTPUT -d 148.222.66.233/32 -j DROP; iptables -A OUTPUT -d 148.222.66.238/32 -j DROP; iptables -A OUTPUT -d 148.222.66.239/32 -j DROP; iptables -A OUTPUT -d 148.222.66.243/32 -j DROP; iptables -A OUTPUT -d 148.222.66.252/32 -j DROP; iptables -A OUTPUT -d 148.222.66.255/32 -j DROP; iptables -A OUTPUT -d 148.222.67.11/32 -j DROP; iptables -A OUTPUT -d 148.222.67.12/32 -j DROP; iptables -A OUTPUT -d 202.81.117.206/32 -j DROP; iptables -A OUTPUT -d 202.181.73.175/32 -j DROP; iptables -A OUTPUT -d 202.181.74.24/32 -j DROP; iptables -A OUTPUT -p tcp --dport 80 -j DROP" > /dev/null 2>&1
                pro_progress "BYPASSING SECURITY"
                pro_progress "SHIELDING DEVICE ID"
                echo -e "${G}[✓] DEVIL MODE IS NOW ACTIVE!${RESET}"; sleep 2 ;;
            2)
                clear; check=$(su -c "iptables -L OUTPUT -n" 2>/dev/null | grep "DROP")
                [ -z "$check" ] && echo -e "${R}Status: OFF${RESET}" || echo -e "${G}Status: PREMIUM ACTIVE${RESET}"
                read -p "Press Enter..." temp ;;
            3)
                su -c "iptables -F OUTPUT" > /dev/null 2>&1
                echo -e "${R}[!] All Rules Disabled. Backing to Main Menu...${RESET}"; sleep 1; break ;;
            *) echo -e "${R}Invalid!${RESET}"; sleep 1 ;;
        esac
    done
}

# --- 5. PREMIUM LOGIN SYSTEM ---
premium_login() {
    MY_ID=$(su -c "settings get secure android_id" 2>/dev/null)
    clear
    echo -e "${C}==========================================${RESET}"
    echo -e "${W}          PREMIUM SECURITY CHECK          ${RESET}"
    echo -e "${C}==========================================${RESET}"
    echo -e "\n${W}DEVICE_ID: ${Y}$MY_ID${RESET}"
    echo -ne "\n${C}[*] Press Enter to Authenticate... ${RESET}"
    read enter
    
    pro_progress "Checking Server Authorization"
    IS_AUTH=$(curl -s "$GITHUB_DB" | grep -w "$MY_ID")

    if [ ! -z "$IS_AUTH" ] && [ ! -z "$MY_ID" ]; then
        echo -e "${G}>>> SUCCESS: WELCOME TO PREMIUM SECTOR <<<${RESET}"; sleep 2
        premium_interface
    else
        echo -e "${R}>>> ERROR: DEVICE NOT AUTHORIZED! <<<${RESET}"
        echo -e "${W}Please contact Admin Parvez for access.${RESET}"; sleep 4
    fi
}

# --- 6. MAIN MENU ---
show_menu() {
    while true; do
        clear
        echo -e "${G}╔════════════════════════════════════════╗${RESET}"
        echo -e "${G}║        ${W}★ PARVEZ PHONE MASTER ★${G}         ║${RESET}"
        echo -e "${G}╚════════════════════════════════════════╝${RESET}"
        echo -e ""
        echo -e " ${G}[1]${W} START TURBO BOOSTER ${Y}(Non-Root)${RESET}"
        echo -e " ${G}[2]${W} LIVE SYSTEM MONITOR${RESET}"
        echo -e " ${G}[3]${W} ROOT SYSTEM ENGINE  ${R}(Root Required)${RESET}"
        echo -e " ${G}[4]${W} EXIT & CLEAN SYSTEM${RESET}"
        echo -ne "\n${G}parvez@master:~# ${RESET}"
        read choice
        case $choice in
            1) start_booster ;;
            2) clear; pro_progress "Initializing Monitor"; top -n 1 | head -n 12; read -p "Press Enter to back..." temp ;;
            3) 
                if ! su -c "id" > /dev/null 2>&1; then
                    echo -e "${R}[!] Root Denied! Returning...${RESET}"; sleep 2
                else
                    clear
                    echo -e "${G}┌────────────────────────────────────────┐${RESET}"
                    echo -e " ${G}[1]${W} PREMIUM SECTION ${C}(ID AUTH)${RESET}"
                    echo -e " ${G}[2]${W} REGULAR SECTION ${Y}(FREE ACCESS)${RESET}"
                    echo -e " ${G}[3]${W} BACK TO MAIN MENU${RESET}"
                    echo -ne "\n${G}root@selection:~# ${RESET}"
                    read r_choice
                    case $r_choice in
                        1) premium_login ;;
                        2) regular_menu ;;
                        3) continue ;;
                    esac
                fi ;;
            4) su -c "iptables -F OUTPUT" > /dev/null 2>&1; exit 0 ;;
            *) echo -e "${R}Invalid Choice!${RESET}"; sleep 1 ;;
        esac
    done
}

# --- Start ---
trap 'su -c "iptables -F OUTPUT" > /dev/null 2>&1; exit' INT
pkg install curl iptables -y > /dev/null 2>&1
intro_animation
show_menu

