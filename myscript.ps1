$task = Read-Host "What task do you want to be reminded of?"
$time = Read-Host "Set reminder after how many minutes?"

 
$soundAlert = Read-Host "Would you like a sound alert? (y/n)"
if ($soundAlert -eq "yes") {
    $sound = $true
} else {
    $sound = $false
}

 
Start-Sleep -Seconds ($time * 60)


Write-Host "Reminder: $task"


if ($sound) {
    [console]::beep(1000, 500) # Frequency 1000 Hz, duration 500 ms
}