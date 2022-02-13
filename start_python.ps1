<#
.Synopsis
   Starts a python script in a virtual environemnt
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  13.02.2022
#>

#$scriptsPath = $env:commonprogramfiles + "\client_scripts"
$scriptsPath = "Z:\scripts\client_scripts"

Set-Location -Path $scriptsPath

Write-Host $args

.\venv\Scripts\activate

Start-Process -NoNewWindow -Wait -FilePath "python" -ArgumentList "-m", $args[0]

deactivate