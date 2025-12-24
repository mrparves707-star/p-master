#!/data/data/com.termux/files/usr/bin/bash

echo "Stopping heavy background apps..."

# Auto Clicker
pkill -f automatictap.autoclicker

# Facebook / Messenger
pkill -f facebook
pkill -f messenger

# Community / Chat
pkill -f oneroom
pkill -f whatsapp
pkill -f imo

# System / Samsung
pkill -f shizuku
pkill -f calendar
pkill -f myfiles
pkill -f galaxystore

# Google Services
pkill -f gms
pkill -f youtube
pkill -f vending
pkill -f chrome
pkill -f googlequicksearchbox

echo "RAM optimized (non-root)"
