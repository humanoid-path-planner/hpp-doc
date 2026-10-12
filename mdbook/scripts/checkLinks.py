#!/usr/bin/env python3
"""Check that the internal links of the built book point to existing files.

Usage: checkLinks.py <book directory>

Links starting with /hpp-doc/ are resolved from the book directory, as on
https://humanoid-path-planner.github.io/hpp-doc/.
"""

import html
import os
import re
import sys
from urllib.parse import unquote, urlsplit

root = sys.argv[1]
broken = set()
for directory, _, files in os.walk(root):
    for name in files:
        if not name.endswith(".html") or name == "print.html":
            continue
        page = os.path.join(directory, name)
        with open(page, errors="ignore") as f:
            text = f.read()
        for link in re.findall(r'(?:href|src)="([^"]+)"', text):
            link = html.unescape(link)
            path = unquote(urlsplit(link).path)
            if urlsplit(link).scheme or link.startswith(("#", "//")) or not path:
                continue
            if path.startswith("/hpp-doc/"):
                target = os.path.join(root, path[len("/hpp-doc/") :])
            elif path.startswith("/"):
                target = os.path.join(root, path[1:])
            else:
                target = os.path.normpath(os.path.join(directory, path))
            if path.endswith("/"):
                target = os.path.join(target, "index.html")
            if not os.path.exists(target):
                broken.add((os.path.relpath(page, root), link))

for page, link in sorted(broken):
    print(f"{page}: {link}")
if broken:
    print(f"{len(broken)} broken internal links")
    sys.exit(1)
