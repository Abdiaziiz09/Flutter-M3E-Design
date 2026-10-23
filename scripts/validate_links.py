"""Validate relative Markdown links and fragments within the documentation tree."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
MARKDOWN = re.compile(r"(?<!!)\[[^\]]*\]\((?:<([^>]+)>|([^)\s]+))(?:\s+[^)]*)?\)")
HEADING = re.compile(r"^\s{0,3}#{1,6}\s+(.+?)\s*#*\s*$")


def slugify(heading: str) -> str:
    heading = re.sub(r"`([^`]*)`", r"\1", heading)
    heading = re.sub(r"[^\w\- ]", "", heading.lower())
    return re.sub(r"\s+", "-", heading.strip())


def anchors(path: Path) -> set[str]:
    found: set[str] = set()
    counts: dict[str, int] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        match = HEADING.match(line)
        if match:
            base = slugify(match.group(1))
            count = counts.get(base, 0)
            counts[base] = count + 1
            found.add(base if count == 0 else f"{base}-{count}")
        found.update(re.findall(r"\bid=['\"]([^'\"]+)['\"]", line))
    return found


def main() -> int:
    errors: list[str] = []
    markdown_files = list((ROOT / "docs").rglob("*.md")) + [
        ROOT / "README.md",
        ROOT / "CONTRIBUTING.md",
        ROOT / "AGENTS.md",
        ROOT / "link_sources.md",
    ]
    for source in markdown_files:
        text = source.read_text(encoding="utf-8")
        for match in MARKDOWN.finditer(text):
            raw_target = match.group(1) or match.group(2) or ""
            parsed = urlsplit(raw_target)
            if parsed.scheme or raw_target.startswith("//") or not parsed.path:
                continue
            target_path = (source.parent / unquote(parsed.path)).resolve()
            if not target_path.exists():
                errors.append(f"{source.relative_to(ROOT)}: missing target {raw_target}")
                continue
            if parsed.fragment and target_path.suffix.lower() == ".md":
                if unquote(parsed.fragment) not in anchors(target_path):
                    errors.append(
                        f"{source.relative_to(ROOT)}: missing fragment #{parsed.fragment} "
                        f"in {target_path.relative_to(ROOT)}"
                    )
    if errors:
        print("\n".join(errors))
        return 1
    print(f"Validated relative Markdown links across {len(markdown_files)} files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
