# Fixture: Large Feature Request

Build a customer administration backoffice that includes account search,
customer profile review, role-based staff permissions, audit log export,
notification preferences, and billing status visibility.

Expected slicing candidates:

- account search and profile review
- staff permissions
- audit export
- notification preferences
- billing status visibility

Expected scheduling notes:

- Staff permissions are foundational for protected admin actions.
- Audit export and notification preferences can run after account/profile
  contracts are stable.
- Billing status visibility may share profile surfaces and must be checked for
  file and contract conflicts.
