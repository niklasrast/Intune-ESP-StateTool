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
$processesExplorer = @(Get-CimInstance -ClassName 'Win32_Process' -Filter "Name like 'explorer.exe'" -ErrorAction 'Ignore')
$esp = $false
foreach ($processExplorer in $processesExplorer) {
    $user = (Invoke-CimMethod -InputObject $processExplorer -MethodName GetOwner).User
    if ($user -eq 'defaultuser0' -or $user -eq 'defaultuser1') {$esp = $true}
}
Write-Host $esp 
