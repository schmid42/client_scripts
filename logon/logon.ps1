$server     = "ESAUSRV01.unterrichtsnetz.local"
$scriptsDir = "\NETLOGON\logon\"
$script     = "logon.py"
$scriptPath = "\\" + $server + $scriptsDir + $script
$params = @()

$params += $scriptPath
$params += $args

#Start-Process -FilePath "python" -ArgumentList $params -WindowStyle Hidden 

#Start-Process -FilePath "choco" -ArgumentList "install","C:\chocolatey\packages-lehrer\packages.config" -Verb RunAs

# [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
# [System.Windows.Forms.MessageBox]::Show("Hallo Lehrer","Dein Titel",0)