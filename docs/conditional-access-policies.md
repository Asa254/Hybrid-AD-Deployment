# Conditional Access Policy Design

## Overview
Conditional Access policies enforce security controls at sign-in time based on user, location, device, and risk signals. This document outlines the policy set applied in this hybrid environment.

> Note: Policy names and values below are illustrative/sanitized — no tenant-specific IDs, secrets, or real user data are included.

## Policy 1: Require MFA for All Users
- **Assignment:** All users
- **Conditions:** Any cloud app
- **Access controls:** Grant access, require multi-factor authentication
- **Rationale:** Baseline protection against credential compromise, regardless of network location.

## Policy 2: Block Legacy Authentication
- **Assignment:** All users
- **Conditions:** Client apps → Exchange ActiveSync, other legacy clients
- **Access controls:** Block access
- **Rationale:** Legacy auth protocols don't support MFA and are a common attack vector for password spray attacks.

## Policy 3: Require Compliant Device for Admin Roles
- **Assignment:** Directory roles (Global Admin, User Admin, etc.)
- **Conditions:** Any cloud app
- **Access controls:** Grant access, require device to be marked as compliant
- **Rationale:** Privileged accounts should only be usable from managed, compliant devices.

## Policy 4: Sign-in Risk-Based Policy
- **Assignment:** All users
- **Conditions:** Sign-in risk = Medium or High
- **Access controls:** Require MFA and password change
- **Rationale:** Leverages Entra ID Protection risk signals to respond automatically to suspicious sign-ins.

## Testing Approach
All policies were first deployed in **Report-only mode** for 1–2 weeks to review impact via the Sign-in logs before switching to **On**, to avoid accidentally locking out legitimate users.
