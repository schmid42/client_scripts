<#
.Synopsis
   Starts software on client computers
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  25.03.2022
#>

Set-Location -Path "$env:LOCALAPPDATA\Microsoft\Teams"
Start-Process -File .\Update.exe -ArgumentList '--processStart "Teams.exe"'
