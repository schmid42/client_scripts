Set-Location -Path "$env:LOCALAPPDATA\Microsoft\Teams"
Start-Process -File .\Update.exe -ArgumentList '--processStart "Teams.exe"'
