<#
.Synopsis
   Checks if Firefox firewall rules are existent and creates rules if not. Activates allow rules.
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  13.02.2022
#>

try {
    Get-NetFirewallRule -DisplayName "allow_firefox_inbound" -ErrorAction Stop | Out-Null
    Write-Host "Rule 'allow_firefox_inbound' found."
} catch [Exception] {
    #write-host $_.Exception.message
    Write-Host "Rule 'allow_firefox_inbound' not found. Creating rule."
    New-NetFirewallRule -DisplayName "allow_firefox_inbound" -Direction Inbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Allow
}

try {
    Get-NetFirewallRule -DisplayName "allow_firefox_outbound" -ErrorAction Stop | Out-Null
    Write-Host "Rule 'allow_firefox_outbound' found."
} catch [Exception] {
    #write-host $_.Exception.message
    Write-Host "Rule 'allow_firefox_outbound' not found. Creating rule."
    New-NetFirewallRule -DisplayName "allow_firefox_outbound" -Direction Outbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Allow
}

try {
    Get-NetFirewallRule -DisplayName "block_firefox_inbound" -ErrorAction Stop | Out-Null
    Write-Host "Rule 'block_firefox_inbound' found."
} catch [Exception] {
    #write-host $_.Exception.
    Write-Host "Rule 'block_firefox_inbound' not found. Creating rule."
    New-NetFirewallRule -DisplayName "block_firefox_inbound" -Direction Inbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Block
}

try {
    Get-NetFirewallRule -DisplayName "block_firefox_outbound" -ErrorAction Stop | Out-Null
    Write-Host "Rule 'block_firefox_outbound' found."
} catch [Exception] {
    #write-host $_.Exception.message
    Write-Host "Rule 'block_firefox_outbound' not found. Creating rule."
    New-NetFirewallRule -DisplayName "block_firefox_outbound" -Direction Outbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Block
}

Set-NetFirewallRule -DisplayName "allow_firefox_inbound" -Enabled True
Set-NetFirewallRule -DisplayName "allow_firefox_outbound" -Enabled True

Set-NetFirewallRule -DisplayName "block_firefox_inbound" -Enabled False
Set-NetFirewallRule -DisplayName "block_firefox_outbound" -Enabled False
