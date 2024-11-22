
# better

# Import the necessary module
Import-Module NetAdapter

# Get all NIC teams on the server
$nicTeams = Get-NetLbfoTeam

# Check if any NIC teams exist
if ($nicTeams.Count -gt 0) {
    foreach ($team in $nicTeams) {
        # Store the team name in a variable
        $teamName = $team.Name

        # Get all NIC team members for the retrieved team
        $teamMembers = Get-NetLbfoTeamMember -Team $teamName

        # Store NIC names in an array
        $nicNames = $teamMembers | Select-Object -ExpandProperty Name

        # Display the team name and NIC names
        Write-Host "`nNIC Team Name: $teamName" -ForegroundColor Yellow
        Write-Host "NIC Names: $($nicNames -join ', ')" -ForegroundColor DarkYellow
    }
} else {
    Write-Host "No NIC teams found on the server." -ForegroundColor Red
}
