<#
    .SYNOPSIS 
    Check if ESP is running

    .DESCRIPTION
    Install:   C:\Windows\SysNative\WindowsPowershell\v1.0\PowerShell.exe -ExecutionPolicy Bypass -Command .\Get-ESPState.ps1
    
    .ENVIRONMENT
    PowerShell 5.0
    
    .AUTHOR
    Niklas Rast
#>

#ESP check
$ExplorerProcesses = @(Get-CimInstance -ClassName 'Win32_Process' -Filter "Name like 'explorer.exe'" -ErrorAction 'Ignore')
foreach ($TargetProcess in $ExplorerProcesses) {
    $Username = (Invoke-CimMethod -InputObject $TargetProcess -MethodName GetOwner).User
}
if ($UserName -ne 'defaultuser0') {
    Write-Host "ESP off"
}
else {
    Write-Host "ESP on"
}
