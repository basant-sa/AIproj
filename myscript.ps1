$task = Read-Host "What task do you want to be reminded of?"
$time = [int](Read-Host "Set reminder after how many minutes?")  
$repeat = [int] (Read-Host "Set reminder interval in minutes (Enter 0 for no recurrence")


$soundAlert = Read-Host "Would you like a sound alert? (yes/no)"
if ($soundAlert -eq "yes") {
    $sound = $true
} else {
    $sound = $false
}

function Set-Reminder {

Write-Host "Reminder: $task"

if ($sound) {
    [console]::beep(1000, 500)
	}

}

Start-Sleep -Seconds ($time * 60)  
Set-Reminder
while ($repeat -gt 0)
{
	Start-Sleep -Seconds ($time * 60)  
	Set-Reminder

}
  