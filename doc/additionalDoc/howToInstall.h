/**

\page hppDoc_howToInstall How to install HPP

\section hppDoc_install_intro Introduction

HPP (Humanoid Path Planner) is composed of several software modules packaged by autotools.
These software modules are stored in a git repositories on git.laas.fr (or softs.laas.fr) for people working at LAAS.

There are mainly two types of packages in HPP:
\li packages under development that are not stable yet: each developer needs to download his own version using git and commit his modifications.
\li packages that are more stable and for which versions have already been released: these packages are automatically installed using a tool called \c robotpkg.

\section hppDoc_installing Installation procedure

\subsection hppDoc_preliminary Preliminary remarks

\subsubsection hppDoc_subsubsec_env Environment variables 

Along the installation procedure, some environment variables are defined. It is recommended to include these definitions into an initialization file like <tt>.tcshrc</tt> or <tt>.bashrc</tt> so that they will be defined at each new session.

\subsubsection hppDoc_subsubsec_kineo About KineoWorks

To install KineoWorks, you will be asked for two archives:
\li KPPSDK_2.04.300.tgz and
\li KPPSDK_2.04.301.tgz

You need to ask these archives to <a href="mailto:anthony.mallet@laas.fr">Anthony Mallet</a>.

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
All dependencies are automatically installed. For some packages, you will need to follow instructions to accept license agreement. For instance KineoWorks installation will output the following message:
\code
ERROR: kineo-pp-2.04.301r3 has an unacceptable license: kineocam-license.
ERROR:     To view the license, enter "make show-license".
ERROR:     To indicate acceptance, add this line to
ERROR:        ${HOME}/openrobots/etc/robotpkg.conf:
ERROR:     ACCEPTABLE_LICENSES+=kineocam-license
\endcode
Follow the instruction and type again:
\code
[hpp-core] make update
\endcode

Once modules managed by \c robotpkg have been installed, you can download working versions of packages under development or create your own package.

\subsection hppDoc_other_packages Packages under development or new packages.

To download, compile and install packages not managed by \c robotpkg, or packages that you want to modify or debug, create a development directory as follows:
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

\subsection hppDoc_omniORB Configuring CORBA and using hppCorbaServer

\c hppCorbaServer is a package that enables developers to run their algorithms from external application like python scripts for instance.
This package instanciates a Corba server that can handle requests trigerring actions in HPP. The main actions consist in
\li defining robots,
\li defining obstacles,
\li defining and solving path planning problems.
The package also implements an OpenHRP client that enables the user to download HRP2 model by a Corba request. 

   \c hppCorbaServer is based on omniORB4 (installed by robotpkg), an implementation of Corba. We will explain now how to configure omniORB4 in order to be able 
\li to load HRP2 model from OpenHRP
\li to instanciate a Corba server to control your program.

\subsubsection hppDoc_name_server The name server

Corba objects are defined by names. In order to communicate between objects, Corba needs to map names with objects, that can run on distant machines. This is the role of the name server. Before starting launching Corba objects, you thus need to start a name server. 

A name server is identified by the machine on which it runs and by a port id on this machine. You thus need to choose a port id on your machine. 
In order to avoid conflicts when several people work on the same machine, we usually use as port id: (user id + 1024). We strongly recommend that you follow this procedure.

Type then
\code 
[~] id -u
\endcode in a terminal and you get your user id on your machine. Add 1024 to this number, you get your port id.
Then create a directory to store omniORB information
\code
[~] mkdir ${HOME}/omniORB
[~] cd ${HOME}/omniORB
\endcode
In this directory, create a file <tt>omniORG.cfg</tt>
and copy the following line in this file:
\code 
# Configuration file for omniOrb
# environment variable OMNIORB_CONFIG must be set to name of the directory
# containing this file.

#   Alternatively, and more cleanly, specify the Naming service with a
#   corbaname URI:
InitRef = NameService=corbaloc:iiop:localhost:port-id/NameService
\endcode
replacing <tt>port-id</tt> by your port id computed above.

File <tt>omniORG.cfg</tt> contains the address of the name server. The name server and each Corba object you launch thus needs to access to this file. For that, define the following environment variable:
\code
setenv OMNIORB_CONFIG ${HOME}/omniORB/omniORB.cfg
\endcode
   You need also to define a directory where log messages will be saved:
\code
setenv OMNINAMES_LOGDIR ${HOME}/omniORB/log
\endcode

\section hppDoc_install_example Example: Intalling and running walk planner package and corresponding kpp Interface

\subsection hppDoc_install_example_subsec Installing necessary packages

Download, install <tt>robotpkg</tt> and type <tt>make update</tt> in <tt>graphics/kpp-interfacewalk</tt> on a machine with a Kineo license.


\subsection hppDoc_subsec_openhrp Starting OpenHRP

   To download the model of HRP2, you need to launch OpenHRP. 

\subsubsection hppDoc_subsubsec_nameServer Starting the name server

   The first step consists in starting the name server:
\code
[~] ${HOME}/openrobots/bin/omniNames -start port-id
\endcode
   where port-id is your port-id. If you run omniNames later, you will not need to specify again the port id. Simply type:
\code
[~] ${HOME}/openrobots/bin/omniNames
\endcode

\subsubsection hppDoc_subsubsec_modelloader Starting OpenHRP model loader

Type
\code
[~] ${HOME}/openrobots/bin/Modelloader.sh
ready
\endcode

\subsubsection hppDoc_subsubsec_run_kpp Running KineoPathPlanner with kppInterfaceWalk module

   You can now run KineoPathPlanner and load kppInterfaceWalk module:
\code
   ${HOME}/openrobots/bin/KineoPathPlanner -ModulePath ${HOME}/openrobots/lib/modules/${HOST}/libkppInterfaceWalk.so
\endcode
   where <tt>${HOST}</tt> is the name of your machine (or localhost.localdomain).

   You should get the following interface:

\image html "kppInterfaceWalk.png" KineoPathPlanner with module kppInterfaceWalk.

   To solve a simple problem without obstacles, do the following step:
\li Click in menu "HPP/WALK -> Load HRP2"

\li Click on button "Zoom All" and you should see the robot in a bounding box.

\li In the top left "Scene" tree, in the "Devices" node, select "Humanoid Box"

\li Click in menu "Insert -> Path -> New"

\li The background becomes grey. Move the box to the desired goal configuration.

  \li Click on the button "Done" (top right panel). The background becomes blue again.

\li Click in menu "HPP/WALK -> Set Init and Goal Configs"

\li Click in menu "HPP/WALK -> Solve Problem"

  \li In the "Scene" tree, in the "Paths" node, select the last path

\li Play the path in the path player that has appeared.




*/
