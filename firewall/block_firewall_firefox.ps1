Set-NetFirewallRule -DisplayName "allow_firefox_inbound" -Enabled False
Set-NetFirewallRule -DisplayName "allow_firefox_outbound" -Enabled False

Set-NetFirewallRule -DisplayName "block_firefox_inbound" -Enabled True
Set-NetFirewallRule -DisplayName "block_firefox_outbound" -Enabled True
