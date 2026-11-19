import os

project = "Humanoid Path Planner"
release = os.environ.get("HPP_VERSION", "devel")
html_title = f"{project} {release}"

extensions = [
    "myst_parser",
    "breathe",
    "sphinx.ext.graphviz",
    "autoapi.extension",
    "sphinxcontrib.mermaid",
    "sphinx_reredirects",
]
exclude_patterns = ["_build"]

myst_fence_as_directive = ["mermaid"]
myst_heading_anchors = 3

html_theme = "sphinx_rtd_theme"
html_copy_source = False
html_static_path = ["_static"]
html_css_files = ["custom.css"]
# Files linked from raw HTML.
html_extra_path = ["_extra", "_build/extra"]

cpp_packages = [
    "hpp-util",
    "hpp-statistics",
    "hpp-pinocchio",
    "hpp-constraints",
    "hpp-core",
    "hpp-manipulation",
    "hpp-manipulation-urdf",
]
breathe_projects = {p: os.path.abspath(f"_build/xml/{p}") for p in cpp_packages}
graphviz_output_format = "svg"

autoapi_dirs = ["_build/python"]
autoapi_file_patterns = ["*.pyi", "*.py"]
autoapi_root = "api/python"
autoapi_add_toctree_entry = False
autoapi_options = [
    "members",
    "undoc-members",
    "show-inheritance",
    "show-module-summary",
    "imported-members",
]

# Duplicates: namespace hpp is in several packages, Device is in several modules.
suppress_warnings = [
    "autoapi.python_import_resolution",
    "duplicate_declaration.cpp",
    "myst.header",
    "ref.python",
]

# Addresses of the former mdBook website and of the former website before it.
redirects = {
    "introduction/introduction": "../index.html",
    "reference/cpp-api": "../api/cpp/index.html",
    "reference/hpp-python/api/index": "../../../api/python/pyhpp/index.html",
    "download": "installation/installation.html",
    "documentation": "api/cpp/index.html",
    "tutorials": "reference/hpp-tutorial/index.html",
    "contributing": "introduction/contributing.html",
    "support": "introduction/contributing.html",
    "authors": "index.html#contributors",
    "showcase": "index.html#applications",
}
for page, module in [
    ("core", "core"),
    ("core-path", "core/path"),
    ("core-path_optimization", "core/path_optimization"),
    ("core-problem_target", "core/problem_target"),
    ("constraints", "constraints"),
    ("manipulation", "manipulation"),
    ("manipulation-urdf", "manipulation/urdf"),
    ("manipulation-steering_method", "manipulation/steering_method"),
    ("pinocchio", "pinocchio"),
    ("pinocchio-urdf", "pinocchio/urdf"),
]:
    redirects[f"reference/hpp-python/api/{page}"] = (
        f"../../../api/python/pyhpp/{module}/index.html"
    )


def skip_bindings(app, what, name, obj, skip, options):
    # The content of the bindings modules is documented in their parent module.
    return skip or (what == "module" and name.endswith(".bindings"))


def setup(app):
    app.connect("autoapi-skip-member", skip_bindings)
