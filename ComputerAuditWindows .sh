#!/usr/bin/pwsh
#version 1.0
#Owner :Ron Mabulay
#Date : December 12,2025

$pc = hostname
$folderPath = "C:\December2025Audit-$pc"


#Create a directory named December2025Audit in the C: drive
New-Item -path "$folderPath" -type directory -force

#Export system information to a text file in the newly created directory

Get-Computerinfo | Out-File -FilePath "$folderPath\SystemInfo.txt"

#Get the hostname and save it to a text file
hostname | Out-File -FilePath "$folderPath\$pc.txt"
 
#Export user account information to a text file
net accounts | Out-File -FilePath "$folderPath\NetAccounts.txt"

#Export a list of installed programs to a text file

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*,
                 HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
Where-Object { $_.DisplayName } |
Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
Sort-Object DisplayName |
Format-Table -AutoSize |
Out-File -FilePath "$folderPath\InstalledPrograms.txt"

#Export a list of NEtwork adapters and their status to a text file

Get-Netadapter | 
Select-Object Name, Status, MacAddress, LinkSpeed |
Format-Table -AutoSize |
Out-File -FilePath "$folderPath\NetworkAdapters.txt"

#Export a list of IP addresses to a text file
Get-NetIPAddress |
Select-Object IPAddress, InterfaceAlias, AddressFamily, PrefixLength, Type |
Format-Table -AutoSize |
Out-File -FilePath "$folderPath\IPAddress.txt"

End of Script

