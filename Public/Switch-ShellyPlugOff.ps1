<#
    .SYNOPSIS
    The purpose of this function is to switch the state of the Shelly Plug to off for a Shelly v2 API plug.
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
function Switch-ShellyPlugOff () {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string[]]$ShellyIP        
    )
    $method = "Get"
    
    $response = invoke-webrequest -uri ("http://" + $shellyIP + "/rpc/Switch.Set?id=0&on=false") -method $method
    
    $responsecontent = $response.content | Convertfrom-json

    $Object = [PSCustomObject]@{
        StatusDescription  = $response.StatusCode
        WasOn = $responsecontent.was_on        
    }
    
    return $Object
}
