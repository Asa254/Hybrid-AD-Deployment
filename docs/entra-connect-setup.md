# Microsoft Entra Connect — Sync Configuration Notes

## Overview
Microsoft Entra Connect (formerly Azure AD Connect) synchronizes on-premises Active Directory objects (users, groups, contacts) to Microsoft Entra ID, enabling a hybrid identity model.

## Sync Method
**Password Hash Synchronization (PHS)** was chosen over Pass-through Authentication (PTA) or Federation (ADFS) for this deployment because:
- Lowest infrastructure overhead (no additional on-prem auth agents required)
- Cloud authentication continues to work even if on-prem AD is temporarily unavailable
- Sufficient for the security requirements of this environment (MFA/Conditional Access handled at the Entra ID layer)

## Setup Steps
1. Install Microsoft Entra Connect on a domain-joined server (not the DC itself, in production)
2. Sign in with Entra ID Global Administrator credentials
3. Select **Customize** installation → choose **Password Hash Synchronization**
4. Connect to on-prem AD forest with Enterprise Admin credentials
5. Select OUs to sync (scope to relevant OUs only — avoid syncing service/admin accounts unnecessarily)
6. Configure **Uniqueness/UPN matching** (typically `userPrincipalName`)
7. Enable **password writeback** if self-service password reset from the cloud is required
8. Run initial sync and verify objects appear in Entra ID (`portal.azure.com` → Entra ID → Users)

## Verifying Sync Health
Run on the Entra Connect server:

```powershell
Get-ADSyncConnectorRunStatus
Get-ADSyncScheduler
```

Check that `SyncCycleEnabled` is `True` and the last run completed with no errors.

## Common Issues
- **Duplicate attribute errors:** usually caused by matching UPN/proxyAddress conflicts between on-prem and existing cloud-only accounts — resolve by soft-matching or cleaning up cloud-only duplicates first.
- **Sync delays:** default cycle is 30 minutes; force a manual sync with `Start-ADSyncSyncCycle -PolicyType Delta`.
