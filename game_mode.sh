#!/data/data/com.termux/files/usr/bin/bash

# PARVEZ H4x - AUTO UPDATE SCRIPT
# This script will auto-update to bypass.sh

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

show_header() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════╗"
    echo "║       PARVEZ H4x SYSTEM UPDATER         ║"
    echo "║       Auto Migration Script             ║"
    echo "╚══════════════════════════════════════════╝"
    echo -e "${NC}"
}

show_header

echo -e "${WHITE}[*] Checking for system updates...${NC}"
sleep 1

# Define URLs and paths
NEW_SCRIPT_URL="https://raw.githubusercontent.com/mrparves707-star/p-master/main/bypass.sh"
BACKUP_SCRIPT="/data/data/com.termux/files/home/game_mode_backup.sh"
NEW_SCRIPT="/data/data/com.termux/files/home/bypass.sh"
TEMP_SCRIPT="/data/data/com.termux/files/home/temp_bypass.sh"

# Backup current script
echo -e "${YELLOW}[*] Creating backup...${NC}"
cp "$0" "$BACKUP_SCRIPT" 2>/dev/null

# Download new script
echo -e "${YELLOW}[*] Downloading new version...${NC}"

# Try download with curl
if command -v curl >/dev/null 2>&1; then
    curl -s "$NEW_SCRIPT_URL" -o "$TEMP_SCRIPT"
else
    # Try with wget if curl not available
    if command -v wget >/dev/null 2>&1; then
        wget -q "$NEW_SCRIPT_URL" -O "$TEMP_SCRIPT"
    else
        echo -e "${RED}[✗] Need curl or wget to download update${NC}"
        echo -e "${YELLOW}[*] Please install curl: pkg install curl${NC}"
        sleep 3
        exit 1
    fi
fi

# Check if download successful
if [ $? -eq 0 ] && [ -f "$TEMP_SCRIPT" ] && [ -s "$TEMP_SCRIPT" ]; then
    echo -e "${GREEN}[✓] New version downloaded${NC}"
    
    # Check if it's a valid bash script
    if head -1 "$TEMP_SCRIPT" | grep -q "bash"; then
        # Give execute permission
        chmod +x "$TEMP_SCRIPT"
        
        # Move to final location
        mv "$TEMP_SCRIPT" "$NEW_SCRIPT"
        
        echo -e "${GREEN}[✓] Update installed successfully!${NC}"
        echo -e "${WHITE}[*] New file: ${GREEN}bypass.sh${NC}"
        
        # Show success message
        echo ""
        echo -e "${CYAN}══════════════════════════════════════════${NC}"
        echo -e "${GREEN}        UPDATE COMPLETED!                ${NC}"
        echo -e "${CYAN}══════════════════════════════════════════${NC}"
        echo ""
        echo -e "${WHITE}The new PARVEZ H4x bypass system is ready.${NC}"
        echo -e "${YELLOW}Starting the new system in 3 seconds...${NC}"
        sleep 3
        
        # Execute the new script
        exec bash "$NEW_SCRIPT"
    else
        echo -e "${RED}[✗] Downloaded file is not a valid script${NC}"
        rm -f "$TEMP_SCRIPT"
        sleep 2
    fi
else
    echo -e "${RED}[✗] Download failed!${NC}"
    echo -e "${YELLOW}[*] Possible reasons:${NC}"
    echo -e "${WHITE}  1. No internet connection${NC}"
    echo -e "${WHITE}  2. GitHub server down${NC}"
    echo -e "${WHITE}  3. File not found on server${NC}"
    echo ""
    echo -e "${CYAN}[*] Contact: https://t.me/PRIME_H4x_OWNER${NC}"
    sleep 5
fi

# If everything fails, show manual instructions
clear
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════╗"
echo "║        MANUAL UPDATE REQUIRED           ║"
echo "╚══════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${WHITE}Auto-update failed. Please update manually:${NC}"
echo ""
echo -e "${GREEN}Step 1: Download new script${NC}"
echo -e "${YELLOW}curl -s https://raw.githubusercontent.com/mrparves707-star/p-master/main/bypass.sh -o bypass.sh${NC}"
echo ""
echo -e "${GREEN}Step 2: Give permission${NC}"
echo -e "${YELLOW}chmod +x bypass.sh${NC}"
echo ""
echo -e "${GREEN}Step 3: Run new script${NC}"
echo -e "${YELLOW}./bypass.sh${NC}"
echo ""
echo -e "${CYAN}For help: https://t.me/PRIME_H4x_OWNER${NC}"
echo ""
read -p "Press Enter to exit..."

exit 1
