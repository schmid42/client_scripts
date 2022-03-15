try {
    $processes = Get-Process -Name "firefox" -ErrorAction Stop
    Write-Host "Firefox running"
    foreach ($process in $processes) {
        Stop-Process $process.id
    }
    Write-Host "Firefox stopped."
} catch [Exception] {
    #write-host $_.Exception.message
    Write-Host "Firefox not running "
}

$firefox = Join-Path $env:programfiles 'Mozilla Firefox'

$firefox = $firefox + [IO.Path]::DirectorySeparatorChar + 'firefox.exe'

Write-Host $firefox

Start-Process -NoNewWindow -FilePath  $firefox
