<#
.Synopsis
   Closes all running instances of Firefox and starts a fresh instance.
.NOTES
   Version:        0.1
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  25.03.2022
#>

try {
    $processes = Get-Process -Name "firefox" -ErrorAction Stop
    #Write-Host "Firefox running"
    foreach ($process in $processes) {
        Stop-Process $process.id
    }
    #Write-Host "Firefox stopped."
} catch [Exception] {
    #write-host $_.Exception.message
    #Write-Host "Firefox not running "
}

$firefox = Join-Path $env:programfiles 'Mozilla Firefox'

$firefox = $firefox + [IO.Path]::DirectorySeparatorChar + 'firefox.exe'

#Write-Host $firefox

Start-Process -NoNewWindow -FilePath  $firefox
