# MFA Enrollment Process

## Overview
Multi-factor authentication is enforced via Conditional Access (see `conditional-access-policies.md`). This document covers how users enroll and how enrollment is managed.

## Enrollment Method
Users self-enroll via the **Microsoft Authenticator app**, chosen as the primary method because:
- Push notifications provide a low-friction user experience
- Supports passwordless sign-in as a future upgrade path
- No per-user hardware token cost

## User Enrollment Steps
1. User signs in to `myaccount.microsoft.com`
2. Prompted (on first sign-in after policy activation) to set up additional security verification
3. Selects **Microsoft Authenticator** → scans QR code with the app
4. Approves a test notification to confirm setup
5. Optionally registers a backup method (phone call or SMS) in case the device is unavailable

## Admin-Side Management
- **Security defaults vs Conditional Access:** This environment uses Conditional Access (not Security Defaults) for granular control over which policies apply to which groups.
- **Registration campaign:** Used Entra ID's built-in "Registration Campaign" feature to prompt users to enroll ahead of enforcement, reducing helpdesk friction on go-live day.
- **Reporting:** Authentication Methods → Registration report used to track enrollment completion percentage before switching enforcement policies from Report-only to On.

## Helpdesk Considerations
- Documented a break-glass account (excluded from Conditional Access, monitored closely) in case of full lockout scenarios
- Temporary Access Pass (TAP) used for account recovery instead of resetting MFA blindly, to avoid weakening security during recovery
