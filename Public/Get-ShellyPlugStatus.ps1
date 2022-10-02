<#
    .SYNOPSIS
    The purpose of this function is to check the status of a Shelly v2 API plug.
    .DESCRIPTION
    The purpose of this function is to interact with a Shelly v2 API plug. 
    .NOTES
    Author: W. Kyle Setchel
    .PARAMETER ShellyIP
    This is the Shelly's IP address or DNS name.
    .EXAMPLE
    Get-ShellyPlugStatus -ShellyIP x.x.x.x
    This function will return a Powershell Object
#>
function Get-ShellyPlugStatus () {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string[]]$ShellyIP        
    )
    $method = "Get"
    
    #Build URL
    $shellybaseURI = "http://" + $shellyIP + "/rpc/" + "Shelly.GetStatus"

    $response = invoke-webrequest -uri $shellybaseURI -method $method

    $response = $response.content | Convertfrom-json

    $Object = [PSCustomObject]@{
        id = $response."switch:0".id
        IsOn = $response."switch:0".output
        Voltage = $response."switch:0".voltage
        Current = $response."switch:0".current
        Temp = $response."switch:0".temperature
    }
    
    return $Object
}