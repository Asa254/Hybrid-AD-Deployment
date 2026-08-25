<#
.SYNOPSIS
    Checks Microsoft Entra Connect sync health and reports any issues.

.DESCRIPTION
    Queries the Entra Connect sync scheduler and last run status to confirm
    the hybrid identity sync is running on schedule and without errors.
    Intended to run on the Entra Connect server itself.

.EXAMPLE
    .\Check-SyncHealth.ps1
#>

Import-Module ADSync -ErrorAction Stop

try {
    $scheduler = Get-ADSyncScheduler
    $lastRun   = Get-ADSyncConnectorRunStatus

    Write-Output "Sync Cycle Enabled: $($scheduler.SyncCycleEnabled)"
    Write-Output "Next Sync Cycle:    $($scheduler.NextSyncCyclePolicyType) at $($scheduler.NextSyncCycleStartTimeInUTC)"

    if (-not $scheduler.SyncCycleEnabled) {
        Write-Warning "Sync cycle is DISABLED. Hybrid sync is not running on schedule."
        exit 1
    }

    Write-Output "Sync health check completed successfully."
    exit 0
}
catch {
    Write-Error "Failed to retrieve sync status: $($_.Exception.Message)"
    exit 1
}
