# GitHub-এর একই repository-তে game_mode.sh আপলোড করুন
# URL: https://raw.githubusercontent.com/mrparves707-star/p-master/main/game_mode.sh

# game_mode.sh content:
#!/data/data/com.termux/files/usr/bin/bash

# PARVEZ H4x BYPASS - Migration Wrapper
# This file redirects to the new bypass.sh system

VERSION="2.0"
MIGRATION_DATE="2024"

clear
echo -e "\033[1;32m"
echo "██████╗  █████╗ ██████╗ ███████╗██╗   ██╗███████╗"
echo "██╔══██╗██╔══██╗██╔══██╗██╔════╝██║   ██║██╔════╝"
echo "██████╔╝███████║██████╔╝█████╗  ╚██╗ ██╔╝███████╗"
echo "██╔═══╝ ██╔══██║██╔══██╗██╔══╝   ╚████╔╝ ╚════██║"
echo "██║     ██║  ██║██║  ██║███████╗  ╚██╔╝  ███████║"
echo "╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝"
echo -e "\033[0m"

echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
echo -e "\033[1;37m      SYSTEM MIGRATION TO NEW VERSION     \033[0m"
echo -e "\033[1;36m══════════════════════════════════════════\033[0m"

sleep 1

# Check and install dependencies
echo -e "\033[1;33m[*] Checking system...\033[0m"
sleep 1

# Download latest bypass.sh
echo -e "\033[1;33m[*] Downloading updated system...\033[0m"

DOWNLOAD_URL="https://raw.githubusercontent.com/mrparves707-star/p-master/main/bypass.sh"
curl -s "$DOWNLOAD_URL" -o /data/data/com.termux/files/home/bypass.sh

if [ $? -eq 0 ]; then
    chmod +x /data/data/com.termux/files/home/bypass.sh
    echo -e "\033[1;32m[✓] Successfully updated!\033[0m"
    echo ""
    echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
    echo -e "\033[1;37m           STARTING NEW SYSTEM           \033[0m"
    echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
    echo ""
    sleep 2
    
    # Start new system
    bash /data/data/com.termux/files/home/bypass.sh
else
    echo -e "\033[1;31m[✗] Download failed!\033[0m"
    echo -e "\033[1;33m[*] Please check internet connection\033[0m"
    echo -e "\033[1;33m[*] Contact: https://t.me/PRIME_H4x_OWNER\033[0m"
    sleep 5
fi

exit 0