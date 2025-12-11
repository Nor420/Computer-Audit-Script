#!/bin/bash
#macOS System Audit Script
#Version 1.0
#Owner: Ron Mabulay
#Date: December 13, 2025

$Hostname=$(scutil --get ComputerName)

OUTPUT_DIR=~/Desktop/MacOSDecember2025Audit
mkdir -p "$OUTPUT_DIR"

touch "$OUTPUT_DIR/SystemInfo.txt"

system_profiler SPHardwareDataType SPSoftwareDataType SPNetworkDataType >> "$OUTPUT_DIR/SystemInfo.txt"

touch "$OUTPUT_DIR/Hostname.txt"

system_profiler SPHardwareDataType | grep "Computer Name" | awk -F: '{print $2}' | xargs >> "$OUTPUT_DIR/Hostname.txt"






