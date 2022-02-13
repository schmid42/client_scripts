New-NetFirewallRule -DisplayName "allow_firefox_inbound" -Direction Inbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Allow
New-NetFirewallRule -DisplayName "allow_firefox_outbound" -Direction Outbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Allow

New-NetFirewallRule -DisplayName "block_firefox_inbound" -Direction Inbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Block
New-NetFirewallRule -DisplayName "block_firefox_outbound" -Direction Outbound -Program "C:\Program Files\Mozilla Firefox\firefox.exe" -Action Block
