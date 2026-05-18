# Fixture: Critical Analyze Result

## Finding A1

Severity: CRITICAL

The implementation plan allows automated implementation before analysis passes,
which contradicts the workflow stop conditions.

Expected guard behavior:

- `guard-before-implement.sh --analyze-file <this-file>` exits non-zero.
- The implementer stops before editing implementation files.
