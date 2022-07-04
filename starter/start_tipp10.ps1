<#
.Synopsis
   Creates a hidden directory for the tipp10 database and starts the application with this directory as parameter.
   Users are able the change the machine and keep their progress.
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  29.06.2022
#>

# Get the redirected documents path from Registry
$documentsReg = Get-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Personal
$documentsPath = $documentsReg.Personal

# set the path for the tipp10 database
$tipp10Path = Join-Path -Path $documentsPath -ChildPath "tipp10"

#Write-Host $tipp10Path

# create the directory if it doesn't exist
$tipp10Directory = New-Item -ItemType Directory -Force -Path $tipp10Path

# hide the directory
Get-Item $tipp10Directory -Force | foreach { $_.Attributes = $_.Attributes -bor "Hidden" }

# start tipp10 with the path as parameter
Set-Location -Path "C:\Program Files (x86)\Tipp10\"
.\tipp10.exe $tipp10Directory