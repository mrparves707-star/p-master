#!/data/data/com.termux/files/usr/bin/bash

# ============================================
#           PARVEZ H4x BYPASS
#          AUTO INSTALL & UPDATE
# ============================================

# --- Colors ---
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
W='\033[1;37m'
P='\033[1;35m'
B='\033[1;34m'
NC='\033[0m'

# --- Telegram Channels ---
OWNER_CHANNEL="https://t.me/PRIME_H4x_OWNER"
MAIN_CHANNEL1="https://t.me/PARVEZH4x1"
MAIN_CHANNEL2="https://t.me/parvezh4x"
FILE_CHANNEL="https://t.me/parvezh4xfile"

# --- URLs ---
DB_URL="https://raw.githubusercontent.com/mrparves707-star/database/main/premium_users.txt"
SCRIPT_URL="https://raw.githubusercontent.com/mrparves707-star/p-master/main/bypass.sh"
SCRIPT_NAME=$(basename "$0")

# --- Auto Install Dependencies ---
install_dependencies() {
    echo -e "${G}[*] Installing required packages...${NC}"
    
    # Update package list
    pkg update -y > /dev/null 2>&1
    
    # Install necessary packages
    for pkg_name in iptables curl git; do
        if ! command -v $pkg_name &> /dev/null; then
            echo -e "${Y}[*] Installing $pkg_name...${NC}"
            pkg install $pkg_name -y > /dev/null 2>&1
            echo -e "${G}[✓] $pkg_name installed${NC}"
        fi
    done
    
    # Install Termux API for opening URLs
    if ! pkg list-installed | grep -q termux-api; then
        echo -e "${Y}[*] Installing Termux API...${NC}"
        pkg install termux-api -y > /dev/null 2>&1
    fi
    
    echo -e "${G}[✓] All dependencies installed${NC}"
    sleep 1
}

# --- Auto Update System ---
auto_update() {
    echo -e "${G}[*] Checking for updates...${NC}"
    
    # Get current script directory
    SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
    
    # Download latest version from GitHub
    if curl -s "$SCRIPT_URL" -o "/tmp/bypass_new.sh"; then
        # Compare with current version
        if ! cmp -s "$0" "/tmp/bypass_new.sh"; then
            echo -e "${Y}[!] New update found! Updating...${NC}"
            
            # Backup current script
            cp "$0" "$0.backup"
            
            # Replace with new version
            mv "/tmp/bypass_new.sh" "$0"
            
            # Set permissions
            chmod +x "$0"
            
            echo -e "${G}[✓] Update completed! Restarting...${NC}"
            sleep 2
            
            # Restart with new version
            exec "$0" "$@"
            exit 0
        else
            echo -e "${G}[✓] You have the latest version${NC}"
        fi
    else
        echo -e "${Y}[!] Could not check for updates${NC}"
    fi
    
    sleep 1
}

# --- SMS Style Message for Non-Verified Users ---
show_sms_message() {
    clear
    echo -e "${R}╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${R}║               📱 SMS NOTIFICATION                ║${NC}"
    echo -e "${R}╠══════════════════════════════════════════════════╣${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}║  ${W}From: ${G}PARVEZ H4x SYSTEM${R}                         ║${NC}"
    echo -e "${R}║  ${W}To: ${Y}REGULAR USER${R}                               ║${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}║  ${W}⚠️ DEVICE NOT VERIFIED!${R}                           ║${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}║  ${W}Your device ID is not in our premium database.${R}     ║${NC}"
    echo -e "${R}║  ${W}For premium access, contact owner:${R}                 ║${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}║  ${G}📞 CONTACT OWNER: ${B}$OWNER_CHANNEL${R}        ║${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}║  ${W}📢 Join our channels for updates:${R}                  ║${NC}"
    echo -e "${R}║  ${G}• ${B}$MAIN_CHANNEL1${R}                         ║${NC}"
    echo -e "${R}║  ${G}• ${B}$MAIN_CHANNEL2${R}                         ║${NC}"
    echo -e "${R}║  ${G}• ${B}$FILE_CHANNEL${R}                         ║${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}║  ${Y}Press Enter to continue with REGULAR mode...${R}       ║${NC}"
    echo -e "${R}║                                                  ║${NC}"
    echo -e "${R}╚══════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Open Telegram links automatically
    if command -v termux-open-url &> /dev/null; then
        echo -e "${W}[*] Opening Telegram links...${NC}"
        termux-open-url "$OWNER_CHANNEL"
        sleep 2
        termux-open-url "$MAIN_CHANNEL1"
        sleep 2
        termux-open-url "$MAIN_CHANNEL2"
        sleep 2
        termux-open-url "$FILE_CHANNEL"
    fi
    
    read -p ""
}

# --- Check Access ---
check_access() {
    clear
    echo -e "${W}[*] Checking device...${NC}"
    sleep 1
    
    DEVICE_ID=$(su -c "settings get secure android_id" 2>/dev/null)
    
    if [ -z "$DEVICE_ID" ]; then
        DEVICE_ID="UNKNOWN"
    fi
    
    echo -e "${W}[*] Verifying with server...${NC}"
    sleep 1
    
    if curl -s "$DB_URL" | grep -iq "$DEVICE_ID"; then
        echo -e "${G}[✓] PREMIUM ACCESS GRANTED${NC}"
        IS_PREMIUM=1
    else
        echo -e "${Y}[!] REGULAR ACCESS GRANTED${NC}"
        IS_PREMIUM=0
        show_sms_message
    fi
    sleep 1
}

# --- DEVIL MODE ---
devil_mode() {
    clear
    echo -e "${P}========================================${NC}"
    echo -e "${P}          DEVIL MODE BYPASS             ${NC}"
    echo -e "${P}========================================${NC}"
    
    echo -e "${G}[*] Activating Devil Mode...${NC}"
    
    su -c "iptables -F OUTPUT" 2>/dev/null
    
    # All premium rules
    su -c "iptables -A OUTPUT -d 103.78.86.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 103.78.86.116 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 103.78.86.117 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 124.158.134.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 124.158.134.3 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 124.158.134.11 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.0.0/16 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.112.32 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.120.186 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.120.201 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.126.103 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.126.139 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.219 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.233 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.238 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.239 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.243 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.252 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.255 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.67.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.67.11 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.67.12 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 202.81.117.206 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 202.181.73.175 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 202.181.74.24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 35.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 142.250.0.0/15 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 172.217.0.0/16 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 8001 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p udp --dport 8001 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 8012 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p udp --dport 8012 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 5574 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p udp --dport 5574 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 6674 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p udp --dport 6674 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 9006 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p udp --dport 9006 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 10880 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p udp --dport 10880 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 80 -j DROP" 2>/dev/null
    
    echo -e "${G}[✓] Devil Mode Activated${NC}"
    sleep 2
}

# --- REGULAR BYPASS ---
regular_bypass() {
    clear
    echo -e "${Y}========================================${NC}"
    echo -e "${Y}           REGULAR BYPASS               ${NC}"
    echo -e "${Y}========================================${NC}"
    
    echo -e "${G}[*] Activating Regular Bypass...${NC}"
    
    su -c "iptables -F OUTPUT" 2>/dev/null
    
    # Regular rules
    su -c "iptables -A OUTPUT -d 103.78.86.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 124.158.134.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 143.92.0.0/16 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 35.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.66.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 148.222.67.0/24 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 8001 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 8012 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -p tcp --dport 5574 -j DROP" 2>/dev/null
    
    echo -e "${G}[✓] Regular Bypass Activated${NC}"
    sleep 2
}

# --- INDIA FIX (Premium Only) ---
india_fix() {
    clear
    echo -e "${P}========================================${NC}"
    echo -e "${P}              INDIA FIX                 ${NC}"
    echo -e "${P}========================================${NC}"
    
    echo -e "${G}[*] Activating India Fix...${NC}"
    
    su -c "iptables -F OUTPUT" 2>/dev/null
    
    # All 8 India Fix rules
    su -c "iptables -A OUTPUT -d 34.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 35.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 142.250.0.0/15 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 172.217.0.0/16 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 216.58.0.0/15 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 13.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 104.0.0.0/8 -j DROP" 2>/dev/null
    su -c "iptables -A OUTPUT -d 150.0.0.0/8 -j DROP" 2>/dev/null
    
    echo -e "${G}[✓] India Fix Activated${NC}"
    sleep 2
}

# --- CHECK STATUS ---
check_status() {
    clear
    echo -e "${W}========================================${NC}"
    echo -e "${W}            SYSTEM STATUS              ${NC}"
    echo -e "${W}========================================${NC}"
    
    RULES=$(su -c "iptables -L OUTPUT -n 2>/dev/null | grep DROP | wc -l")
    
    if [ "$RULES" -eq 0 ]; then
        echo -e "${R}[✗] BYPASS: NOT ACTIVE${NC}"
    else
        echo -e "${G}[✓] BYPASS: ACTIVE${NC}"
    fi
    
    if [ "$IS_PREMIUM" -eq 1 ]; then
        echo -e "${G}[★] MODE: PREMIUM${NC}"
        echo -e "${W}Access: Verified Premium User${NC}"
    else
        echo -e "${Y}[★] MODE: REGULAR${NC}"
        echo -e "${W}Access: Contact Owner for Premium${NC}"
    fi
    
    echo ""
    echo -e "${W}Telegram Channels:${NC}"
    echo -e "${G}$OWNER_CHANNEL${NC}"
    echo -e "${G}$MAIN_CHANNEL1${NC}"
    echo -e "${G}$MAIN_CHANNEL2${NC}"
    echo -e "${G}$FILE_CHANNEL${NC}"
    
    echo -e "\n${Y}[!] Press Enter to continue...${NC}"
    read
}

# --- STOP BYPASS ---
stop_bypass() {
    clear
    echo -e "${R}========================================${NC}"
    echo -e "${R}            STOP BYPASS                ${NC}"
    echo -e "${R}========================================${NC}"
    
    echo -e "${G}[*] Stopping all bypass...${NC}"
    
    su -c "iptables -F OUTPUT" 2>/dev/null
    su -c "iptables -F" 2>/dev/null
    
    echo -e "${G}[✓] All Bypass Stopped${NC}"
    sleep 2
}

# --- MAIN MENU ---
show_menu() {
    while true; do
        clear
        echo -e "${W}========================================${NC}"
        echo -e "${W}        PARVEZ H4x BYPASS              ${NC}"
        echo -e "${W}       Free Fire Exclusive            ${NC}"
        echo -e "${W}========================================${NC}"
        
        if [ "$IS_PREMIUM" -eq 1 ]; then
            echo -e "${G}[★] PREMIUM MODE${NC}"
            echo -e "${G}Access: Verified Device${NC}"
        else
            echo -e "${Y}[★] REGULAR MODE${NC}"
            echo -e "${Y}Contact Owner for Premium Access${NC}"
        fi
        echo ""
        
        echo -e "${W}MAIN OPTIONS:${NC}"
        if [ "$IS_PREMIUM" -eq 1 ]; then
            echo -e " ${G}[1]${NC} DEVIL MODE"
            echo -e " ${G}[2]${NC} INDIA FIX"
            echo -e " ${G}[3]${NC} CHECK STATUS"
            echo -e " ${R}[4]${NC} STOP BYPASS"
            echo -e " ${R}[5]${NC} EXIT"
        else
            echo -e " ${G}[1]${NC} REGULAR BYPASS"
            echo -e " ${G}[2]${NC} CHECK STATUS"
            echo -e " ${R}[3]${NC} STOP BYPASS"
            echo -e " ${R}[4]${NC} EXIT"
        fi
        
        echo -ne "\n${W}[?] Select option: ${NC}"
        read choice
        
        if [ "$IS_PREMIUM" -eq 1 ]; then
            case $choice in
                1) devil_mode ;;
                2) india_fix ;;
                3) check_status ;;
                4) stop_bypass ;;
                5) 
                    su -c "iptables -F OUTPUT" 2>/dev/null
                    echo -e "${G}[✓] Exit${NC}"
                    exit 0
                    ;;
                *) 
                    echo -e "${R}[!] Invalid option${NC}"
                    sleep 1
                    ;;
            esac
        else
            case $choice in
                1) regular_bypass ;;
                2) check_status ;;
                3) stop_bypass ;;
                4) 
                    su -c "iptables -F OUTPUT" 2>/dev/null
                    echo -e "${G}[✓] Exit${NC}"
                    exit 0
                    ;;
                *) 
                    echo -e "${R}[!] Invalid option${NC}"
                    sleep 1
                    ;;
            esac
        fi
    done
}

# ============================================
#               START PROGRAM
# ============================================

# Show welcome message
clear
echo -e "${G}========================================${NC}"
echo -e "${G}     PARVEZ H4x BYPASS SYSTEM         ${NC}"
echo -e "${G}     Initializing...                  ${NC}"
echo -e "${G}========================================${NC}"

# Step 1: Install dependencies
install_dependencies

# Step 2: Auto update check
auto_update

# Step 3: Check root access
if ! su -c "id" | grep -q "uid=0"; then
    echo -e "${R}[✗] ROOT ACCESS REQUIRED${NC}"
    echo -e "${Y}[!] Please run with root permission${NC}"
    exit 1
fi

# Step 4: Check access
check_access

# Step 5: Start main menu
show_menu
