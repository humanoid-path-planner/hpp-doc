{
  lib,
  stdenv,
  cmake,
  doxygen,
  hpp-practicals,
  hpp-tutorial,
  libsForQt5,
  pkg-config,
  python3Packages,
}:

stdenv.mkDerivation {
  pname = "hpp-doc";
  version = "5.0.0";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./CMakeLists.txt
      ./doc
      ./package.xml
      ./scripts
    ];
  };

  prePatch = ''
    substituteInPlace scripts/auto-install-hpp.sh \
      --replace-fail /bin/bash ${stdenv.shell}
    substituteInPlace scripts/install-tar-on-remote \
      --replace-fail /bin/bash ${stdenv.shell}
    substituteInPlace scripts/generate-tar-doc \
      --replace-fail /bin/sh ${stdenv.shell}
    substituteInPlace scripts/packageDep \
      --replace-fail /usr/bin/python ${python3Packages.python.interpreter}
  '';

  strictDeps = true;

  nativeBuildInputs = [
    cmake
    doxygen
    libsForQt5.wrapQtAppsHook
    pkg-config
  ];
  buildInputs = [ libsForQt5.qtbase ];
  propagatedBuildInputs = [
    hpp-practicals
    hpp-tutorial
  ];

  meta = {
    description = "Documentation for project Humanoid Path Planner";
    homepage = "https://github.com/humanoid-path-planner/hpp-doc";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
