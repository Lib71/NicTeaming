
# The vendor is requesting specift settings on the NIC cards. 
# This is a Draft of a script to check settings. 
# Step 2 . Add the option to adjust the settings as well. 

# Import the necessary module
Import-Module NetAdapter

# Get the first NIC team on the server
# Do we need to check for more the one Team  ??
$nicTeam = Get-NetLbfoTeam | Select-Object -First 1

# Check if a NIC team was found
if ($nicTeam) {
    # Store the team name in a variable
    $teamName = $nicTeam.Name

    # Get all NIC team members for the retrieved team
    $teamMembers = Get-NetLbfoTeamMember -Team $teamName

    # Display the team name
    Write-Host "NIC Team Name: $teamName" -ForegroundColor Yellow

    # Check Jumbo Frame settings for each NIC in the team
    foreach ($member in $teamMembers) {
        $nicName = $member.Name
        $jumboFrameSetting = Get-NetAdapterAdvancedProperty -Name $nicName -DisplayName "Jumbo Packet"
        Write-Host "`nNIC Name: $nicName" -ForegroundColor Green
        $jumboFrameSetting | Format-Table DisplayName, DisplayValue
    }
} else {
    Write-Host "No NIC teams found on the server."
}
