/**

\page hppDoc_howToInstall How to install HPP

\section hppDoc_install_intro Introduction

HPP (Humanoid Path Planner) is composed of several software modules packaged by autotools.
These software modules are stored in a git repository on git.laas.fr (or soft.laas.fr) for people working at LAAS.

There are mainly two types of packages in HPP:
\li packages under development that are not stable yet: each developer needs to download his own version using git and commit his modifications.
\li packages that are more stable and for which versions have already been released: these packages are automatically installed using a yum-like tool called \c robotpkg.

\section hppDoc_installing Installation procedure

\subsection hppDoc_preliminary Preliminary remark

   Along the installation procedure, some environment variables are defined. It is recommended to include these definitions into an initialization file like <tt>.tcshrc</tt> or <tt>.bashrc</tt> so that they will be defined at each new session.

\subsection hppDoc_robotpkg Robotpkg

The first step consists in installing \c robotpkg on your account. For that, you need to create a directory where \c robotpkg will install all necessary packages:
\code
[~] mkdir ${HOME}/openrobots
[~] cd ${HOME}/openrobots
\endcode
Then download a working version of \c robotpkg
\code
[openrobots] cg-clone git+ssh://[git|softs].laas.fr/git/robots/robotpkg
\endcode
Note that from now on, <tt> [git|softs] </tt> should be replaced by
\li \c softs if you are working on a LAAS account,
\li \c git if you are working from a distant site.

   Set the following environment variable:
\code
[openrobots] setenv ROBOTPKG_BASE ${HOME}/openrobots
\endcode
   Install  \c robotpkg:
\code
[openrobots] cd robotpkg
[robotpkg] ./bootstrap/bootstrap --prefix=${HOME}/openrobots
\endcode
Then follow the instructions.

   To install a package, go into <tt>${HOME}/openrobots/robotpkg/path-to-package</tt> and type <tt>make update</tt>

For instance
\code
[robotpkg] cd path/hpp-core
[hpp-core] make update
\endcode
   All dependencies are automatically installed. For some packages, you will need to follow instructions to accept license agreement.

Once modules managed by \c robotpkg have been installed, you can download working versions of packages under development or create your own package.

\subsection hppDoc_other_packages Packages under development or new packages.

To download, compile and install packages not managed by \c robotpkg, create a development directory as follows:
\code
[~] mkdir ${HOME}/devel
[~] cd ${HOME}/devel
\endcode
Then download the packages you need
\code
[devel] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/name-of-package
\endcode

Each package (managed by \c robotpkg or not) installs a file with extension <tt>.pc</tt> in <tt>prefix/lib/pkgconfig</tt> where <tt>prefix</tt> is the installation prefix of the package. This file stores information about the package and its dependencies. 
This information is retrieved by \c pkg-config executable. \c pkg-config searches for <tt>.pc</tt> files in paths encoded in \c PKG_CONFIG_PATH environment variable.
You need therefore to set this variable correctly, for instance:
\code 
[devel] setenv PKG_CONFIG_PATH ${HOME}/devel/lib/pkgconfig:${HOME}/openrobots/lib/pkgconfig:/usr/local/lib/pkgconfig
\endcode

Compile and install the packages in your development directory
\code
[devel] cd package
[package] aclocal
[package] libtoolize -c
[package] autoconf
[package] automake -ac
[package] mkdir build
[package] cd build
[build] ../configure --prefix=${HOME}/devel
[build] make 
[build] make install
\endcode

\subsection hppDoc_install_example Example Intalling walk planner package and corresponding kpp Interface

First download and install <tt>robotpkg</tt> and type <tt>make update</tt> in <tt>path/hpp-core</tt>.

To install the walk planner package and the corresponding kppInterface, do the following:
\code
[devel] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/hppOpenHRP
[devel] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/hppCorbaServer
[devel] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/hppWalkPlanner
[devel] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/kppInterface
[devel] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/kppInterfaceWalk
\endcode

Then compile and install each of these packages as explained above. Note that configuration of hppOpenhRP and hppCorbaServer requires an option:
					\li in hppOpenHRP: 
\code 
[build] ../configure --prefix=${HOME}/devel --with-openhrp=${HOME}/openrobots/OpenHRP
\endcode

   \li in hppCorbaServer: 
\code
[build] ../configure --prefix=${HOME}/devel --with-openhrp
\endcode

\subsection hppDoc_omniORB Configuring CORBA



*/
