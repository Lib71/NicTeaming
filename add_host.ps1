## Add to maine nicteam script 

Write-host "****************************************************************" -ForegroundColor Cyan
Write-host "Detta skript ändrar Nicteam från LACP till Swichindepependent and more. " -ForegroundColor Cyan
Write-host "****************************************************************" -ForegroundColor Cyan
$servernamn = Read-Host "Skriv in hostnamnet på servern (NTxxxxxx):" 

# ex
Invoke-Command -ComputerName $servernamn {Get-NetLbfoTeam}
Invoke-Command -ComputerName $servernamn {Get-ComputerInfo}

<#  Note
Get-NetLbfoTeam
  Get-NetLbfoTeamMember
   Get-NetLbfoTeamNic
Get-NetAdapterAdvancedProperty | Out-GridView
 
  
  #>

  
