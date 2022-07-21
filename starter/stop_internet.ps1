<#
.Synopsis
   Closes all running instances of Firefox and repeats this every two seconds
.NOTES
   Version:        0.2
   Author:         Peter Schmid <schmidp@edith-stein-schule.net>
   Creation Date:  25.03.2022
#>

# create new timer object
$timer = New-Object timers.timer

# set interval to two seconds
$timer.Interval = 2000

# the action to repeat
$action = {
    #collect all processes of firefox
    try {
        $processes = Get-Process -Name "firefox" -ErrorAction Stop
        foreach ($process in $processes) {
            # and stop them
            Stop-Process $process.id
        }
    } catch [Exception] {
    }
}

# register the object as timer
Register-ObjectEvent -InputObject $timer -EventName elapsed -SourceIdentifier StopInternet -Action $action -ErrorAction SilentlyContinue

# start timer
$Timer.Start()
