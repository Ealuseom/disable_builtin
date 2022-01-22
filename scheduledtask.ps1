$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'Get-LocalUser -Name "Administrator" | Disable-LocalUser; Get-ScheduledTask -TaskName "DisableBuiltIn" | Unregister-ScheduledTask -TaskName "DisableBuiltIn" -Confirm:$false'
#$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'Write-Host "test"; Write-Host "test"; Start-Sleep -Seconds 5'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserID 'AdminLokal' -RunLevel Highest
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger
Register-ScheduledTask 'DisableBuiltIn' -InputObject $task
