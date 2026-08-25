# Hybrid AD Deployment

A hybrid identity setup connecting on-premises Windows Server Active Directory to Azure AD / Entra ID, with Conditional Access and MFA enforced for secure access.

## Purpose
Demonstrates a real-world hybrid identity architecture: on-prem AD as the source of truth, synced to the cloud via Entra Connect, with cloud-based security policies layered on top.

## Architecture
- **On-prem:** Windows Server Active Directory (Domain Controller)
- **Sync:** Microsoft Entra Connect (password hash sync)
- **Cloud identity:** Microsoft Entra ID (Azure AD)
- **Security layer:** Conditional Access policies + MFA enforcement

## Tech Stack
- Windows Server 2022
- Microsoft Entra Connect
- Microsoft Entra ID / Azure AD
- PowerShell

## Status
🚧 In progress — documentation and configs being added incrementally.

## Roadmap
- [ ] Entra Connect sync configuration notes
- [ ] Conditional Access policy export (sanitized)
- [ ] MFA enrollment documentation
- [ ] PowerShell health-check script for sync status
- [ ] Architecture diagram
