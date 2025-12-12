#!/bin/bash
#macOS System Audit Script
#Version 1.0
#Owner: Ron Mabulay
#Date: December 13, 2025


OUTPUT_DIR=~/Desktop/MacOSDecember2025Audit
mkdir -p "$OUTPUT_DIR"

hostname=$(scutil --get ComputerName)

echo "$hostname" > "$OUTPUT_DIR/hostname.txt"

SYSTEMINFO_FILE="OUTPUT_DIR/systeminfo.txt"

{
    echo "===== System Information ====="
    system_profiler SPSoftwareDataType SPHardwareDataType SPStorageDataType SPAudioDataType SPNetworkDataType SPDisplaysDataType
    echo ""

    echo "===== Installed Applications ====="
    ls /Applications
    echo ""

    echo "===== User Accounts ====="
    dscl . list /Users
    echo ""

    echo "===== Running Processes ====="
    ps aux
    echo ""

    echo "===== Network Configuration ====="
    ifconfig
    echo ""

    echo "===== Firewall Status ====="
    /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
    echo ""

    echo "===== Security Settings ====="
    spctl --status
    echo ""

    echo "===== Recent System Logs ====="
    log show --last 1d
} > "$SYSTEMINFO_FILE"





