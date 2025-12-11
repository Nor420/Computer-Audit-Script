#!/usr/bin/pwsh
#version 1.0
#Owner :Ron Mabulay
#Date : December 12,2025

#Create a directory named December2025Audit in the C: drive
New-Item -path "C:\December2025Audit" -type directory -force

$pc = hostname

#Export system information to a text file in the newly created directory

Get-Computerinfo | Out-File -FilePath "C:\December2025Audit\SystemInfo.txt"

#Get the hostname and save it to a text file
hostname | Out-File -FilePath "C:\December2025Audit\$pc.txt"

#Export user account information to a text file
net accounts | Out-File -FilePath "C:\December2025Audit\NetAccounts.txt"

#Export a list of installed programs to a text file
Get-CimInstance -ClassName Win32_Product |
Select-Object Name, Version, Vendor |
Out-File -FilePath "C:\December2025Audit\InstalledPrograms.txt"

#Export a list of NEtwork adapters and their status to a text file
Get-Netadapter | 
Select-Object Name, Status, MacAddress, LinkSpeed |
Format-Table -AutoSize |
Out-File -FilePath "C:\December2025Audit\NetworkAdapters.txt"

#Export a list of IP addresses to a text file
Get-NetIPAddress |
Select-Object IPAddress, InterfaceAlias, AddressFamily, PrefixLength, Type |
Format-Table -AutoSize |
Out-File -FilePath "C:\December2025Audit\IPAddress.txt"

End of Script
