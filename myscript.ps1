# Ask for the task and time before the first reminder
$task = Read-Host "What task do you want to be reminded of?"
$time = [int](Read-Host "Set reminder after how many minutes?")  # Convert time input to an integer

# Ask for sound alert preference
$soundAlert = Read-Host "Would you like a sound alert? (yes/no)"
$sound = $soundAlert -eq "yes"

# Ask if the reminder should repeat and how often
$repeat = [int](Read-Host "Set reminder interval in minutes (Enter 0 for no recurrence): ")

# Function to set reminder and save it to a file
function Set-Reminder {
    Write-Host "Reminder: $task"
    if ($sound) {
        [console]::beep(1000, 500)  # Play a beep sound if the user selected yes
    }

    # Save the reminder to a file
    $reminderFilePath = "reminders.txt"
    Add-Content -Path $reminderFilePath -Value "$task"
}

# Function to load reminders from a file and schedule them
function Load-Reminders {
    $reminderFilePath = "reminders.txt"
    if (Test-Path $reminderFilePath) {
        Get-Content $reminderFilePath | ForEach-Object {
            $task = $_
            # Schedule the reminder (adjust the delay and recurrence as needed)
            Start-Sleep -Seconds ($time * 60)
            Set-Reminder
            while ($repeat -gt 0) {
                Start-Sleep -Seconds ($repeat * 60)
                Set-Reminder
            }
        }
    }
}

# Load reminders on system start
Load-Reminders

# Initial reminder after the first specified time
Start-Sleep -Seconds ($time * 60)
Set-Reminder

# Recurring reminder based on user input for interval
while ($repeat -gt 0) {
    Start-Sleep -Seconds ($repeat * 60)
    Set-Reminder
}
