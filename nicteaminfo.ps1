

# Import the necessary module
Import-Module NetAdapter

# Get all NIC teams on the server
$nicTeams = Get-NetLbfoTeam

# Check if any NIC teams exist
if ($nicTeams.Count -gt 0) {
    # Use the first NIC team found
    $teamName = $nicTeams[0].Name
## Need to be step 2 

    # Display the name of the NIC team being updated
    Write-Host "Updating NIC Team: $teamName"

    # Set the Teaming Mode to Switch Independent
    Set-NetLbfoTeam -Name $teamName -TeamingMode SwitchIndependent

    # Set the Load Balancing Algorithm to IPAddresses (equivalent to Address Hash)
    #  List the -LoadBalancingAlgorithm IPAddresses vs Macadress  
    Set-NetLbfoTeam -Name $teamName -LoadBalancingAlgorithm IPAddresses

    Write-Host "NIC Team settings updated successfully."
} else {
    Write-Host "No NIC teams found on the server."
}
