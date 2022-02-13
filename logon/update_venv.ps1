<#
.Synopsis
   Script to create or update a python virtual environment, pip and the required modules
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  13.02.2022
#>

#$scriptsPath = $env:commonprogramfiles + "\client_scripts"
$scriptsPath = "Z:\scripts\client_scripts"

Set-Location -Path $scriptsPath

Write-Host "creating virtual environment (python -m venv venv)"
Start-Process -NoNewWindow -Wait -FilePath "python" -ArgumentList "-m", "venv", "venv"

Write-Host "activating virtual environment"
.\venv\Scripts\activate

Write-Host "upgrading pip (python -m pip install --upgrade pip)"
Start-Process -NoNewWindow -Wait -FilePath "python" -ArgumentList "-m", "pip", "install", "--upgrade", "pip"

Write-Host "installing python packages (pip install -r requirements.txt)"
Start-Process -NoNewWindow -Wait -FilePath "pip" -ArgumentList "install", "-r", "requirements.txt"

Write-Host "deactivating virtual environment"
deactivate