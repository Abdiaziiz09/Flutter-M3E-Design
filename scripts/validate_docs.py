"""Check documentation files and MkDocs navigation targets."""

from __future__ import annotations

import json
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parents[1]


def main() -> int:
    errors: list[str] = []
    docs = ROOT / "docs"
    markdown_files = sorted(docs.rglob("*.md"))
    if not markdown_files:
        errors.append("No documentation Markdown files found.")

    for path in markdown_files:
        content = path.read_text(encoding="utf-8")
        if not content.strip():
            errors.append(f"{path.relative_to(ROOT)} is empty.")
        elif not content.lstrip().startswith("# "):
            errors.append(f"{path.relative_to(ROOT)} must begin with a level-one title.")
        if sum(1 for line in content.splitlines() if line.startswith("```")) % 2:
            errors.append(f"{path.relative_to(ROOT)} has an unclosed fenced code block.")

    try:
        config = yaml.safe_load((ROOT / "mkdocs.yml").read_text(encoding="utf-8"))
        if not isinstance(config, dict) or not isinstance(config.get("nav"), list):
            errors.append("mkdocs.yml must contain a navigation list.")
        else:
            def check_nav(node: object) -> None:
                if isinstance(node, list):
                    for child in node:
                        check_nav(child)
                elif isinstance(node, dict):
                    for child in node.values():
                        check_nav(child)
                elif isinstance(node, str) and node.endswith(".md"):
                    if not (docs / node).is_file():
                        errors.append(f"Navigation target does not exist: docs/{node}")

            check_nav(config["nav"])
    except (OSError, yaml.YAMLError) as error:
        errors.append(f"Could not parse mkdocs.yml: {error}")

    yaml_files = list(ROOT.rglob("*.yaml")) + list(ROOT.rglob("*.yml"))
    yaml_files.append(ROOT / "CITATION.cff")
    for path in yaml_files:
        try:
            yaml.safe_load(path.read_text(encoding="utf-8"))
        except (OSError, yaml.YAMLError) as error:
            errors.append(f"Could not parse {path.relative_to(ROOT)}: {error}")

    for path in ROOT.rglob("*.json"):
        if any(part in {".dart_tool", "build", "site"} for part in path.parts):
            continue
        try:
            json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as error:
            errors.append(f"Could not parse {path.relative_to(ROOT)}: {error}")

    if errors:
        print("\n".join(errors))
        return 1
    print(f"Validated {len(markdown_files)} non-empty Markdown pages and MkDocs navigation.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
