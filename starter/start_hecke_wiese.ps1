<#
.Synopsis
   Starts software on client computers
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  25.03.2022
#>

Start-Process -FilePath "MD8RNTM.EXE" -WorkingDirectory "C:\Program Files (x86)\Hecke-Wiese" -ArgumentList "C:\Program Files (x86)\Hecke-Wiese\DATA\Hecke-Wiese.md8"
