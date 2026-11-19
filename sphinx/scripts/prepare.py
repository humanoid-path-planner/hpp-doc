#!/usr/bin/env python3
"""Generate the pages of the website that come from the HPP packages.

Usage: prepare.py <site-packages> [ref]

<site-packages> is the Python installation directory of hpp-python, which
contains the pyhpp modules and their .pyi stubs. The packages are cloned at
<ref> (default devel) in _build/src, the tutorials always come from hpp_tutorial
devel. Generated:
- reference/<package>/index.md from the package READMEs,
- reference/hpp-tutorial from the tutorials,
- the Doxygen XML of the C++ packages in _build/xml, their pages in api/cpp and
  the documents they link in _build/extra,
- the pyhpp package read by sphinx-autoapi in _build/python.
"""

import re
import shutil
import subprocess
import sys
import xml.etree.ElementTree as ET
from collections import Counter
from html import escape
from pathlib import Path

CPP_PACKAGES = [
    "hpp-util",
    "hpp-statistics",
    "hpp-pinocchio",
    "hpp-constraints",
    "hpp-core",
    "hpp-manipulation",
    "hpp-manipulation-urdf",
]
README_PACKAGES = [
    "hpp-core",
    "hpp-constraints",
    "hpp-manipulation",
    "hpp-pinocchio",
    "hpp-python",
    "hpp-gepetto-viewer",
    "hpp-plot",
    "hpp-exec",
]
TUTORIALS = [f"tutorial_{i}" for i in range(1, 10)] + ["exercise_10"]
DOXYFILE = """
INPUT = {src}/include
IMAGE_PATH = {images}
RECURSIVE = YES
FILE_PATTERNS = *.hh *.hxx *.h
EXTRACT_ALL = YES
GENERATE_HTML = NO
GENERATE_LATEX = NO
GENERATE_XML = YES
HAVE_DOT = YES
INCLUDE_GRAPH = NO
INCLUDED_BY_GRAPH = NO
XML_OUTPUT = {xml}
QUIET = YES
WARNINGS = NO
WARN_IF_DOC_ERROR = NO
WARN_IF_INCOMPLETE_DOC = NO
MACRO_EXPANSION = YES
EXPAND_ONLY_PREDEF = YES
PREDEFINED = HPP_PINOCCHIO_PARSED_BY_DOXYGEN \
             HPP_UTIL_DLLAPI= HPP_STATISTICS_DLLAPI= HPP_PINOCCHIO_DLLAPI= \
             HPP_CONSTRAINTS_DLLAPI= HPP_CONSTRAINTS_LOCAL= HPP_CORE_DLLAPI= \
             HPP_MANIPULATION_DLLAPI= HPP_MANIPULATION_URDF_DLLAPI= \
             HPP_PINOCCHIO_DEPRECATED= HPP_MANIPULATION_DEPRECATED= \
             EIGEN_MAKE_ALIGNED_OPERATOR_NEW= EIGEN_STRONG_INLINE=inline \
             HPP_PREDEF_CLASS(x)= HPP_SERIALIZABLE()= HPP_SERIALIZABLE_SPLIT()=
"""
GRAPH = """```{{graphviz}}
:alt: Inheritance diagram of {name}
:align: center

digraph {{
  graph [rankdir={rankdir} bgcolor=transparent nodesep=0.2 ranksep=0.2]
  node [shape=box style="rounded,filled" fillcolor="#ffffff" color="#2980b9"
        fontname=Helvetica fontsize=11 fontcolor="#404040" margin="0.15,0.05"]
  edge [color="#8c8c8c" arrowhead=empty arrowsize=0.8]
{body}}}
```

"""
TEMPLATE = re.compile(r"<[^<>]*>")
LINK = re.compile(r"\]\(([^):#/][^):]*)\)")
BADGE = re.compile(r"^\[!\[.*\n", re.MULTILINE)
UNDOCUMENTED = re.compile(r'"""\s*Cannot find doxygen-xml[^\n]*\s*"""')
PLACEHOLDER = re.compile(r"^ *Cannot find doxygen-xml.*\n", re.MULTILINE)
# Invalid annotations from pybind11-stubgen: ClassVar[] or ClassVar[SplineB1.]
CLASSVAR = re.compile(r"typing\.ClassVar\[(?:[\w.]*\.)?\]")

root = Path(__file__).resolve().parent.parent
build = root / "_build"
site_packages = Path(sys.argv[1]).resolve()
ref = sys.argv[2] if len(sys.argv) > 2 else "devel"
# Address of the page of each class from the page of another class, by refid
# and by name.
class_pages = {}


def clone(repo, ref):
    path = build / "src" / repo
    if not path.exists():
        subprocess.run(
            [
                "git",
                "-c",
                "advice.detachedHead=false",
                "clone",
                "-q",
                "--depth",
                "1",
                "--branch",
                ref,
                f"https://github.com/humanoid-path-planner/{repo}",
                path,
            ],
            check=True,
        )
    return path


def page(text, url):
    """Make links to README.md files point to the pages of the website, the
    other relative links except figures to url, and remove the CI badges."""

    def link(match):
        path, sep, anchor = match.group(1).partition("#")
        if path.endswith(("README.md", "/")):
            path = path.removesuffix("README.md") + "index.md"
        elif not path.startswith("figures/"):
            path = f"{url}/{path}"
        return f"]({path}{sep}{anchor})"

    return BADGE.sub("", LINK.sub(link, text))


def readmes():
    for repo in README_PACKAGES:
        src = clone(repo, ref)
        dest = root / "reference" / repo
        dest.mkdir(parents=True, exist_ok=True)
        url = f"https://github.com/humanoid-path-planner/{repo}/blob/{ref}"
        (dest / "index.md").write_text(page((src / "README.md").read_text(), url))


def tutorials():
    src = clone("hpp_tutorial", "devel")
    dest = root / "reference" / "hpp-tutorial"
    url = "https://github.com/humanoid-path-planner/hpp_tutorial/blob/devel"
    dest.mkdir(parents=True, exist_ok=True)
    (dest / "index.md").write_text(page((src / "README.md").read_text(), url))
    for name in TUTORIALS:
        (dest / name).mkdir(exist_ok=True)
        text = (src / name / "README.md").read_text()
        (dest / name / "index.md").write_text(page(text, f"{url}/{name}"))
        if (src / name / "figures").exists():
            shutil.copytree(
                src / name / "figures", dest / name / "figures", dirs_exist_ok=True
            )


def inheritance_graph(name, path):
    """Inheritance graph of a class, with UML arrows from the derived classes to
    their bases and links to the pages of the other classes. Bases are above
    their derived classes, or on their left when they have many."""
    graph = ET.parse(path).find("compounddef/inheritancegraph")
    if graph is None or len(graph) < 2:
        return ""
    derived = Counter(
        base.get("refid") for node in graph for base in node.iter("childnode")
    )
    body = []
    for node in graph:
        label, n = node.findtext("label"), node.get("id")
        # The classes of other packages have no link.
        link = node.find("link")
        page = class_pages.get(label if link is None else link.get("refid"))
        namespace = label.partition("<")[0].rpartition("::")[0]
        short = escape(abbreviate(label).removeprefix(f"{namespace}::"))
        if n == "1":  # the class itself
            short, attributes = f"<b>{short}</b>", ' fillcolor="#e7f2fa" penwidth=1.5'
        elif page:
            attributes = f' URL="{page}" target="_top"'
        else:
            attributes = ' color="#c9c9c9" fontcolor="#808080"'
        if namespace:
            short = f'<font point-size="9" color="#808080">{escape(namespace)}</font><br/>{short}'
        body.append(f'  "{n}" [label=<{short}> tooltip="{label}"{attributes}]')
        for base in node.findall("childnode"):
            b = base.get("refid")
            # Several derived classes share the arrow to their base, as in UML.
            style = ["arrowhead=none"] * (derived[b] > 1)
            style += ["style=dashed"] * (base.get("relation") != "public-inheritance")
            body.append(f'  "{n}" -> "{b}{"-" * (derived[b] > 1)}" [{" ".join(style)}]')
    for b in (b for b, count in derived.items() if count > 1):
        body.append(f'  "{b}-" [shape=point width=0 height=0]\n  "{b}-" -> "{b}"')
    rankdir = "RL" if max(derived.values()) > 4 else "BT"
    return GRAPH.format(name=name, rankdir=rankdir, body="\n".join(body) + "\n")


def abbreviate(name):
    """Class name with only the first template argument, e.g. A< B<…>, … >."""
    head, bracket, arguments = name.partition("<")
    if not bracket:
        return name
    arguments = arguments.removesuffix(">")
    while (nested := TEMPLATE.sub("‹…›", arguments)) != arguments:
        arguments = nested
    first, more, _ = arguments.replace("‹…›", "<…>").partition(",")
    return f"{head}< {first.strip()}{', …' * bool(more)} >"


def cpp_api(package):
    src = clone(package, ref)
    xml = build / "xml" / package
    shutil.rmtree(xml, ignore_errors=True)
    xml.mkdir(parents=True)
    subprocess.run(
        ["doxygen", "-"],
        check=True,
        text=True,
        input=DOXYFILE.format(
            src=src,
            xml=xml,
            images=" ".join(
                str(d) for d in (src / "doc", src / "doc" / "figures") if d.exists()
            ),
        ),
    )
    dest = root / "api" / "cpp" / package
    shutil.rmtree(dest, ignore_errors=True)
    dest.mkdir(parents=True)
    # Documents linked from the documentation, as Doxygen HTML_EXTRA_FILES.
    extra = build / "extra" / "api" / "cpp" / package
    extra.mkdir(parents=True, exist_ok=True)
    for pdf in src.glob("doc/*.pdf"):
        shutil.copy(pdf, extra)

    compounds = ET.parse(xml / "index.xml").getroot()
    classes = {
        c.findtext("name") for c in compounds if c.get("kind") in ("class", "struct")
    }
    pages = []
    namespaces = {}
    for c in compounds:
        name, refid = c.findtext("name"), c.get("refid")
        if "<" in name or "internal" in name.split("::") or name.startswith("boost"):
            continue
        if c.get("kind") == "namespace":
            # The classes and inner namespaces have their own pages.
            tree = ET.parse(xml / f"{refid}.xml")
            definition = tree.find("compounddef")
            for inner in definition.findall("innerclass") + definition.findall(
                "innernamespace"
            ):
                definition.remove(inner)
            tree.write(xml / f"{refid}.xml")
            if any(m.get("kind") != "enumvalue" for m in c.findall("member")):
                namespaces.setdefault(name, []).insert(
                    0, ("Types and functions", refid)
                )
                (dest / f"{refid}.md").write_text(
                    f"# Namespace {name}\n\n"
                    f"```{{doxygennamespace}} {name}\n:project: {package}\n"
                    ":members:\n:undoc-members:\n```\n"
                )
        elif name in classes and name.rpartition("::")[0] not in classes:
            namespace, _, short = name.rpartition("::")
            namespaces.setdefault(namespace, []).append((short, refid))
            class_pages[name] = class_pages[refid] = f"../{package}/{refid}.html"
            pages.append((name, refid, c.get("kind")))
    # Written once the pages of the package are known, for the inheritance graphs.
    for name, refid, kind in pages:
        (dest / f"{refid}.md").write_text(
            f"# {name}\n\n{inheritance_graph(name, xml / f'{refid}.xml')}"
            f"```{{doxygen{kind}}} {name}\n:project: {package}\n"
            ":members:\n:protected-members:\n:undoc-members:\n```\n"
        )

    index = [
        f"# {package}\n",
        f"C++ API of [{package}](https://github.com/humanoid-path-planner/{package}).\n",
    ]
    for namespace, entries in sorted(namespaces.items()):
        index.append(f"## {namespace}\n\n```{{toctree}}\n:maxdepth: 1\n")
        index += [f"{short} <{refid}>" for short, refid in entries]
        index.append("```\n")
    (dest / "index.md").write_text("\n".join(index))


def python_api():
    dest = build / "python" / "pyhpp"
    shutil.rmtree(dest, ignore_errors=True)
    for src in (site_packages / "pyhpp").rglob("*.py*"):
        if src.suffix not in (".py", ".pyi"):
            continue
        target = dest / src.relative_to(site_packages / "pyhpp")
        target.parent.mkdir(parents=True, exist_ok=True)
        text = src.read_text()
        if src.suffix == ".pyi":
            text = CLASSVAR.sub("typing.ClassVar[typing.Any]", text)
            text = PLACEHOLDER.sub("", UNDOCUMENTED.sub("...", text))
        target.write_text(text)


readmes()
tutorials()
for package in CPP_PACKAGES:
    cpp_api(package)
python_api()
