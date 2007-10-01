/**
 \page hppDoc_development Developing in Hpp

This page explains some development rules applied in Hpp project. They are mostly common sense rules.

\section hppDoc_rules General rules to be followed in HPP developement

\subsection hppDoc_separate_algo_middleware Make clear distinction between algorithms, middleware and graphical interface

\image html archi.png "Architecture of HPP: the functionalities are distributed into separate software packages. The architecture is composed of Three types of packages: algorithms, CORBA interfaces and KPP-SDK interfaces."
\image latex archi.pdf "Architecture of HPP: the functionalities are distributed into separate software packages. The architecture is composed of Three types of packages: algorithms, CORBA interfaces and KPP-SDK interfaces."

HPP is composed of several software packages divided into three groups as explained in the above figure:
\li algorithms,
\li Corba server
\li KPP-interfaces

KPP-interface and Corba server should be considered as visualization and debugging-testing tools. 
It is mostly important that packages implementing path planning algorithms for humanoid robots are
independent from a given middleware (CORBA) and from a given GUI (KineoPathPlanner). As a consequence, 
no CORBA::xxx attribute should be in a class belonging to the algorithm part.

This simple principle will enable to easily insert the algorithmic software packages into different middlewares (GenoM, RT-middleware for instance).

\subsection hppDoc_small_packages Modularity

Try to avoid developing huge packages including many functions. Instead, build several small packages
with simple interfaces and easy to understand functionalities. 

\subsubsection hppDoc_example1 Example

Let us assume that you are developing a path planning algorithm and you want to use quaternions to represent the orientations of rigid-bodies. 
\li The first step consists in trying to find an existing implementation of quaternions that you can use.
\li Let us assume (this is very unlikeky) that you cannot find a good implementation of quaternions, then, instead of developing operations on quaternions in your path planning package, it is much more clever to create a package that will handle quaternion operations and to make your path planning package depend on it. Later, other users will be able to use your quaternion package.

\subsection hppDoc_level_generality Level of generality

When you implement an algorithm, always ask yourself the question: "Could my algorihtm be applied to applications more general than the one I am dealing with?"
If yes, try to make your algorithm take more general input than your practical problem of today. 

\subsubsection hppDoc_example2 Example

Let us assume that you want to implement Newton algoritm to find a root of a polynomial function. 
Your algorithm requires the derivative of the polynomial.
You can get an expression of a polynomial derivative using the polynomial coefficients. 

However, it would be more clever to develop the same algorithm taking as input a function that might not be a polynomial. 
For that you can define an abstract class 
\code
class Cmapping {
public:
virtual double value(double inParamter) = 0;
virtual double derivative(double inParamter) = 0;
};
\endcode
make your Newton implementation take as input an object \c Cmapping and then derive this class into a concrete polynomial class. 
Thus, your algorithm can be used by other people wanting to find the root of non-polynomial functions.

\subsubsection hppDoc_humanoid Humanoid robots

The algorithms we develop are mostly applied to one type of humanoid robot: HRP2.
It is therefore important to develop these algorithms in such a way that they can be
applied to any other humanoid robot. For that developers should avoid to make too strong asumptions
about the robot structure. The abstract CjrlHumanoidDynamicRobot interface for dynamic humanoid robots have been designed in this aim.

\section hppDoc_howto How to implement a new algorithm in HPP.

To implement a new algorithm in HPP, you need to create new software packages as described below.
To create new software packages, we advise developers to use perl script \c packageCreate.
\code
[~] cd devel/src
[src] cg-clone git+ssh://[git|softs].laas.fr/git/robots/scripts
\endcode

\subsection hppDoc_new_algo Create a new software package implementing your algorithm

  To create a new package depending on \c hppCore, type the following commands.
\code
[~] cd devel/src
[src] perl ./scripts/packageCreate hppNewAlgo -d hppCore HPPCORE
\endcode
If you want your package to depend on other packages add -d package PACKAGE for each dependence.

This operation creates a template of software package with all necessary files to compile. There are four subdirectories in this package:
\li \c doc: contains necessary files to generate doxygen documentation,
\li \c include contains headers files
\li \c src contains source code files
\li \c unitTesting contains files used to test the algorithm developed in the package.

Define in <tt>include/hppNewAlgo.h</tt> a class that derives from ChppPlanner.
\code
#include "hppPlanner.h"

class ChppNewAlgo : public ChppPlanner {
public:
...
ktStatus solve();
};
\endcode
Class ChppPlanner proposes an interface function to insert a robot:
\code
ktStatus ChppPlanner::addHppProblem(CkppDeviceComponentShPtr robot); 
\endcode
Independently from how the robot is inserted into the object, you can use 
  it as the input of your algorithm in your class ChppNewAlgo:
\code
CkppDeviceComponentShPtr robot = robotIthProblem(0);
\endcode

Write in <tt>src/hppNewAlgo.cpp</tt> function
\code
ktStatus ChppNewAlgo::solve()
{
  CkwsPath path = resultOfNewAlgo();

  ChppProblem& hppProblem = hppProblemVector[problemId];
  hppProblem.addPath(kwsPath);
}
\endcode
that runs your algorithm. The two last lines insert the result of your path in KPP interface if the interface is running.

To compile and install your package do the following step:
\code
[~] cd devel/src/hppNewAlgo
[hppNewAlgo] aclocal
[hppNewAlgo] libtoolize -c
[hppNewAlgo] autoconf
[hppNewAlgo] automake -ac
[hppNewAlgo] mkdir build
[hppNewAlgo] cd build
[hppNewAlgo] ../configure --prefix=${HOME}/devel
[hppNewAlgo] make
[hppNewAlgo] make install
\endcode

\subsection hppDoc_new_interface Create a new KPP-interface for your package

To be able to see the result of your algorithm, you need to create a new KPP-interface deriving from CkppInterface
\code 
[~] cd devel/src
[src] perl ./scripts/packageCreate kppInterfaceNewAlgo -d kppInterface KPPINTERFACE -d hppNewAlgo HPPNEWALGO
\endcode
and depending on your algorithm software package.

See package \c kppInterfaceTutorial for an example, and especially for managing Kineo license issue in <tt>src/Makefile.am</tt>
\code
[~] cd devel/src
[src] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/hppTutorialPlanner
[src] cg-clone git+ssh://[git|softs].laas.fr/git/jrl/kppInterfaceTutorial
\endcode


  To run your interface into KineoPathPlanner, do the following:
\code
[~] KineoPathPlanner -ModulePath ${HOME}/lib/modules/${HOST}/libkppInterfaceNewAlgo
\endcode
*/

