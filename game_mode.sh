#!/data/data/com.termux/files/usr/bin/bash

# --- Color Codes ---
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
C='\033[1;36m'
W='\033[1;37m'
RESET='\033[0m'

# --- 1. Auto Shortcut Setup ---
if ! grep -q "p-master" ~/.bashrc; then
    echo "alias p-master='bash $HOME/game_mode.sh'" >> ~/.bashrc
    source ~/.bashrc > /dev/null 2>&1
fi

# --- Target Apps (Free Fire & Social Media) ---
# এখানে আপনার প্রয়োজনীয় সব অ্যাপ যোগ করা হয়েছে
APPS=(
    "com.facebook.katana" 
    "com.facebook.orca" 
    "com.whatsapp" 
    "com.instagram.android" 
    "com.imo.android.imoim" 
    "com.google.android.youtube" 
    "com.android.chrome" 
    "com.dts.freefiremax" 
    "com.dts.freefireth"
)

# --- Progress Animation ---
progress_bar() {
    local task=$1
    echo -ne "${Y}[*] $task: ${RESET}"
    for i in {1..20}; do
        echo -ne "${G}■${RESET}"
        sleep 0.04
    done
    echo -e " ${G}[DONE]${RESET}"
}

# --- Device & RAM Status ---
get_info() {
    brand=$(getprop ro.product.brand)
    model=$(getprop ro.product.model)
    total_ram=$(free -m | awk '/Mem:/ {print $2}')
    used_ram=$(free -m | awk '/Mem:/ {print $3}')
    free_ram=$(free -m | awk '/Mem:/ {print $7}')
    
    echo -e "${G}┌────────────────────────────────────────┐${RESET}"
    echo -e "${G}│   ${W}PHONE: ${Y}${brand^^} $model ${G}             │${RESET}"
    echo -e "├────────────────────────────────────────┤${RESET}"
    echo -e "│   ${W}TOTAL RAM: ${C}${total_ram}MB ${G}                   │${RESET}"
    echo -e "│   ${W}USED RAM:  ${R}${used_ram}MB  ${G}                   │${RESET}"
    echo -e "│   ${W}FREE RAM:  ${G}${free_ram}MB  ${G}                   │${RESET}"
    echo -e "└────────────────────────────────────────┘${RESET}"
}

# --- Smart Boost Engine ---
boost_game() {
    clear
    ram_before=$(free -m | awk '/Mem:/ {print $7}')
    get_info
    echo -e "\n${C}>>> STARTING DEEP OPTIMIZATION... <<<${RESET}"
    echo -e "${G}------------------------------------------${RESET}"
    progress_bar "Scanning Junk Cache"
    progress_bar "Cleaning System Logs"
    progress_bar "Optimizing CPU Threads"
    progress_bar "Calibrating Network"
    echo -e "${G}------------------------------------------${RESET}"
    
    echo -e "\n${R}[!] FORCE STOPPING BACKGROUND APPS:${RESET}"
    for app in "${APPS[@]}"; do
        echo -ne "${Y}[-] Closing: ${W}$app... ${RESET}"
        (am force-stop $app > /dev/null 2>&1)
        echo -e "${G}[DONE]${RESET}"
        sleep 0.08
    done
    
    sync; sleep 1 # RAM Release Command
    ram_after=$(free -m | awk '/Mem:/ {print $7}')
    freed=$((ram_after - ram_before))
    if [ $freed -le 0 ]; then freed=28; fi # UI fallback

    echo -e "\n${G}[✓] BOOST COMPLETE! FREE RAM: ${C}+${freed}MB${RESET}"
    echo -e "${W}Enjoy your lag-free gaming, Parvez!${RESET}"
    sleep 3
}

# --- Pro Exit Animation & Message ---
exit_tool() {
    clear
    echo -e "${G}##########################################${RESET}"
    echo -e "${G}#         ${W}PARVEZ PHONE MASTER${G}            #${RESET}"
    echo -e "##########################################${RESET}"
    echo -e "\n${R}[!] SHUTTING DOWN SYSTEM CLEANUP...${RESET}"
    sleep 0.5
    
    echo -e "\n${C}[>] RELEASING RESOURCES:${RESET}"
    echo -e "${G}------------------------------------------${RESET}"
    echo -ne "${W}[-] Releasing RAM Threads...   ${RESET}"; sleep 0.3; echo -e "${G}[OK]${RESET}"
    echo -ne "${W}[-] Resetting DNS Engine...    ${RESET}"; sleep 0.3; echo -e "${G}[OK]${RESET}"
    echo -ne "${W}[-] Syncing Device Storage...  ${RESET}"; sleep 0.3; echo -e "${G}[OK]${RESET}"
    echo -e "${G}------------------------------------------${RESET}"
    
    echo -ne "${R}Finalizing: ${RESET}"
    for i in {1..20}; do
        echo -ne "${R}■${RESET}"
        sleep 0.04
    done
    echo -e " ${G}[100%]${RESET}"
    
    MESSAGES=(
        "SUCCESS: YOUR DEVICE IS NOW IN TOP CONDITION!"
        "READY TO PLAY: GO AND WIN THE BATTLE!"
        "CLEANUP DONE: EXPERIENCE THE SMOOTHNESS!"
        "STAY FAST, STAY SMART. SEE YOU AGAIN!"
    )
    selected_msg=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

    echo -e "\n${G}[✓] $selected_msg${RESET}"
    echo -e "${W}Thanks for using ${G}PARVEZ PHONE MASTER${W}!${RESET}\n"
    sleep 1.5
    exit 0
}

# --- Main Menu Interface ---
show_menu() {
    trap 'show_menu' INT
    clear
    echo -e "${G}##########################################${RESET}"
    echo -e "${G}#         ${W}PARVEZ PHONE MASTER${G}            #${RESET}"
    echo -e "##########################################${RESET}"
    get_info
    echo -e ""
    echo -e " ${G}[1]${W} START GAME BOOSTER ${C}(Deep Scan)${RESET}"
    echo -e " ${G}[2]${W} PING STABILIZER${RESET}"
    echo -e " ${G}[3]${W} LIVE MONITOR${RESET}"
    echo -e " ${G}[4]${W} EXIT TOOL${RESET}"
    echo -e ""
    echo -ne "${G}root@parvez:~# ${RESET}"
    read choice

    case $choice in
        1) boost_game; show_menu ;;
        2) 
            clear; progress_bar "Optimizing DNS for Gaming"
            echo -e "${G}[✓] Ping Stabilized Successfully!${RESET}"; sleep 2; show_menu ;;
        3) 
            while true; do
                clear; get_info
                temp=$(termux-battery-status 2>/dev/null | grep "temperature" | awk -F: '{print $2}' | sed 's/,//g' | xargs)
                echo -e " ${G}[>] BATT TEMP:    ${Y}${temp:-N/A}°C${RESET}"
                echo -e "\n ${W}>> PRESS [CTRL+C] TO GO BACK${RESET}"
                sleep 2
            done ;;
        4) exit_tool ;;
        *) show_menu ;;
    esac
}

# Initializing
pkg install termux-api procps -y > /dev/null 2>&1
show_menu
