#!/usr/bin/env bash
set -euo pipefail

AGENT_DIR=".codex/agents"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --agent-dir) AGENT_DIR="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 [--agent-dir PATH]"
      exit 0
      ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

python3 - "$AGENT_DIR" <<'PY'
import sys
from pathlib import Path

try:
    import tomllib
except ModuleNotFoundError:
    print("FAIL: Python tomllib is required; use Python 3.11 or newer", file=sys.stderr)
    sys.exit(1)

agent_dir = Path(sys.argv[1])

expected_phases = {
    "speckit-slicer": "slicing",
    "speckit-scheduler": "scheduling",
    "speckit-specifier": "specify",
    "speckit-clarifier": "clarify",
    "speckit-checklister": "checklist",
    "speckit-planner": "plan",
    "speckit-tasker": "tasks",
    "speckit-analyzer": "analyze",
    "speckit-implementer": "implement",
    "speckit-reviewer": "review",
    "speckit-integrator": "integration",
    "speckit-committer": "commit",
    "speckit-pr-creator": "PR creation",
    "speckit-token-reporter": "token reporting",
}

required_string_fields = ("name", "description", "phase", "developer_instructions")
allowed_fields = set(required_string_fields)
required_instruction_sections = (
    "Inputs:",
    "Outputs:",
    "Responsibilities:",
    "Prohibited actions:",
    "Token analysis:",
    "Stop conditions:",
)

step_names = {
    "PR creation": "pr-creation",
    "token reporting": "token-reporting",
}

errors = []

if not agent_dir.is_dir():
    errors.append(f"{agent_dir}: agent directory is missing")
else:
    for role, phase in expected_phases.items():
        path = agent_dir / f"{role}.toml"
        if not path.is_file():
            errors.append(f"{path}: required agent definition is missing")
            continue

        try:
            data = tomllib.loads(path.read_text(encoding="utf-8"))
        except Exception as exc:
            errors.append(f"{path}: malformed TOML: {exc}")
            continue

        if not isinstance(data, dict):
            errors.append(f"{path}: definition must be a TOML table")
            continue

        unknown_fields = sorted(set(data) - allowed_fields)
        if unknown_fields:
            fields = ", ".join(f"`{field}`" for field in unknown_fields)
            errors.append(f"{path}: unsupported Codex agent role field(s): {fields}")

        for field in required_string_fields:
            value = data.get(field)
            if not isinstance(value, str) or not value.strip():
                errors.append(f"{path}: `{field}` must be a non-empty string")

        if data.get("name") != role:
            errors.append(f"{path}: `name` must be `{role}`")

        if data.get("phase") != phase:
            errors.append(f"{path}: `phase` must be `{phase}`")

        developer_instructions = data.get("developer_instructions", "")
        if isinstance(developer_instructions, str):
            for section in required_instruction_sections:
                if section not in developer_instructions:
                    errors.append(f"{path}: `developer_instructions` must include `{section}`")

        step_name = step_names.get(phase, phase)
        expected_step = f"steps/{step_name}.json"
        if isinstance(developer_instructions, str) and expected_step not in developer_instructions:
            errors.append(f"{path}: `developer_instructions` must reference `{expected_step}`")

    for path in sorted(agent_dir.glob("*.toml")):
        if path.stem not in expected_phases:
            errors.append(f"{path}: unexpected agent definition")

if errors:
    for error in errors:
        print(f"FAIL: {error}", file=sys.stderr)
    sys.exit(1)

print(f"PASS: validated {len(expected_phases)} Codex agent definitions")
PY
