<#
.Synopsis
   Closes all running instances of Firefox, cancles the timer and starts a fresh instance.
.NOTES
   Version:        0.2
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  25.03.2022
#>

# create new timer object
$timer = New-Object timers.timer

# stop the timer
$Timer.stop()

# unregister the StopInternet event
Unregister-Event StopInternet -ErrorAction Ignore

try {
    $processes = Get-Process -Name "firefox" -ErrorAction Stop
    foreach ($process in $processes) {
        Stop-Process $process.id
    }
} catch [Exception] {
}

$firefox = Join-Path $env:programfiles 'Mozilla Firefox'

$firefox = $firefox + [IO.Path]::DirectorySeparatorChar + 'firefox.exe'

Start-Process -NoNewWindow -FilePath  $firefox
