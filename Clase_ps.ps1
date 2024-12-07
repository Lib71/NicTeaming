
New-Item -Path "c:\temp\NICTeamLog.txt" -Force

$NICTeam = Get-Netlbfoteam | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append

Get-NetAdapter -Name $NICTeam.Name | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append
Get-NetAdapter -Name $NICTeam.Members[0] | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append
Get-NetAdapter -Name $NICTeam.Members[1] | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append

Set-NetLbfoTeam -Name $NICTeam -TeamingMode SwitchIndependent -LoadBalancingAlgorithm MacAddresses | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append

Set-NetLbfoTeamMember -Name $NICTeam.Members[1] -AdministrativeMode Standby | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append

Get-NetAdapter -Name $NICTeam.Name | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append
Get-NetAdapter -Name $NICTeam.Members[0] | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append
Get-NetAdapter -Name $NICTeam.Members[1] | out-file -FilePath "c:\temp\NICTeamLog.txt" -Append
