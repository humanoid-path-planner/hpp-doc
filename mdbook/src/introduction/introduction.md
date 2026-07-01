# Humanoid Path Planner Documentation

*A motion planning toolkit for kinematic chains evolving among obstacles — from industrial robot arms to full humanoids.*

## Introduction
HPP is a C++ Software Developement Kit implementing path planning for kinematic chains in environments cluttered with obstacles. Collision checking is performed by a modified version of the Flexible Collision Library developed at University of North Carolina. Robots can be loaded from URDF model. It is a collection of software packages handled by cmake and pkg-config.

## Why HPP?
HPP is not a toy planner: it is built to handle the kind of complex, contact-rich motion planning problems found in real robotics applications.

- **Built for complex kinematic chains** — from single manipulator arms to full humanoids and multi-robot systems.
- **Manipulation planning out of the box** — [hpp-manipulation](/reference/hpp-manipulation/) handles grasping, regrasping, and multi-contact scenarios, not just collision-free transit paths.
- **Fast, reliable collision checking** — powered by a modified Flexible Collision Library (coal) under [hpp-pinocchio](/reference/hpp-pinocchio/).
- **Python-first workflow** — define scenes, robots, and planning problems from simple Python scripts via [hpp-python](/reference/hpp-python/), with the heavy algorithmic lifting handled in C++.
- **Flexible visualization** — watch your robot plan and move in a web browser with [viser](https://viser.studio/main), or plug into your existing ROS/ROS2 setup with [rviz2](https://wiki.ros.org/rviz2) or [gazebo](https://gazebosim.org/home).
- **Battle-tested on real industrial use cases** — surface treatment, welding, and assembly tasks, as shown below.

## Applications
HPP is already used to plan motions for real industrial robotic tasks — here are a few examples in action.

### Surface treatment
Planning a tool path to sweep and abrade the surface of a cylinder, while avoiding self-collisions and obstacles in the workspace.
<p align="center">

<iframe title="Sweeping a surface on a cylinder with an abrasion tool" width="560" height="315" src="https://peertube.laas.fr/videos/embed/hSHX1HZ2icsVMgwuw95jYk" style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
</p>

### Welding
Planning collision-free trajectories for a welding tool around complex parts.

<p align="center">
<iframe title="welding" width="560" height="315" src="https://peertube.laas.fr/videos/embed/2vHankanje9jfRRXTGXyXA" style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
</p>

### Assembly / construction
Planning manipulation sequences to assemble a structure piece by piece, combining grasping, regrasping, and placement.

<p align="center">
<iframe width="560" height="315"
title="construction set"
src="https://www.youtube.com/embed/ZVvePCl6qP0"
style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms">
</iframe>
</p>

## Overview of the architecture
```mermaid
flowchart TB
    HPPY["hpp-python"]
    subgraph HPP_STACK["HPP stack"]
        direction TB
        HM["hpp-manipulation"]
        HC["hpp-core"]
        HCONS["hpp-constraints"]
        HPIN["hpp-pinocchio"]
        HM --> HC
        HM --> HCONS
        HC --> HPIN
        HCONS --> HPIN
    end
    PIN["pinocchio"]
    COAL["coal"]
    HPIN --> PIN
    HPIN --> COAL
    HPPY --> HPP_STACK
   subgraph HPP_VIZ["HPP Visualization"]
        direction TB
        VW["Viewer"]
        GPV["Gepetto Viewer"]
        GV["Graph Viewer"]
        VW --> GPV
        VW --> GV
   end
   HPPY -->  |import| VW
classDef external fill:#C8E6C9,stroke:#2E7D32;
class PIN,COAL external
```
The software is composed of C++ libraries implementing the algorithms. Python bindings built on Boost.Python are provided to help users easily define and solve problems. Visualization of the scene can be done in a web browser using [viser](https://viser.studio/main), or using ROS/ROS2 with [rviz2](https://wiki.ros.org/rviz2) or [gazebo](https://gazebosim.org/home).

![Rviz Viewer](./introduction/figures/viewer_demo.gif)
The algorithmic part, built on [hpp-manipulation](/reference/hpp-manipulation/) is embedded in several Python modules by [hpp-python](/reference/hpp-python/).
From a Python script, users can define scenes containing robots and environments, they can also define and solve motion planning problems.
Results of path planning requests as well as individual configurations can be displayed in a web browser via package [hpp-gepetto-viewer](@hpp-gepetto-viewer_LINK@).

## Getting started
Package [hpp_tutorial](https://github.com/humanoid-path-planner/hpp_tutorial/tree/devel/README.md) provides some examples of how to use this project. Lets start now ! [Tutorial](/reference/hpp-tutorial/)

## Acknowledgement


<img src="./introduction/assets/logo_romeo.jpg" alt="Logo projet ROMEO" title="Projet ROMEO 2" height="70">
<img src="./introduction/assets/logo_euroc.png" alt="Logo EUROC project" title="EUROC project" height="70">
<img src="./introduction/assets/logo-FP7.jpg" alt="Framework Program 7" title="Framework Program 7" height="110">
<img src="./introduction/assets/LOGO_ERC.jpg" alt="Logo ERC" title="ERC Actanthrope" height="110">
<img src="./introduction/assets/logo_fiad.jpg" alt="EU Project: Factory-in-a-day" title="Factory in a Day" height="110">
<a href="http://www.agence-nationale-recherche.fr"><img src="./introduction/assets/logo_anr.gif" alt="Logo ANR project" title="ANR project" height="70"></a>
<img src="./introduction/assets/logo_rob4fam.png" alt="Logo ROB4FAM" title="ROB4FAM" height="60">
<img src="./introduction/assets/logo_robocom_def_png.png" alt="RoboCom++" title="RoboCom++" height="110">

## Contributors

Thanks to all the contributors of the HPP project:


<p align="center">
<a href="https://github.com/jmirabel">
  <img src="https://github.com/jmirabel.png" width="80" title="jmirabel (5669 contributions)"/>
</a>
<a href="https://github.com/nim65s">
  <img src="https://github.com/nim65s.png" width="80" title="nim65s (4998 contributions)"/>
</a>
<a href="https://github.com/florent-lamiraux">
  <img src="https://github.com/florent-lamiraux.png" width="80" title="florent-lamiraux (3764 contributions)"/>
</a>
<a href="https://github.com/pFernbach">
  <img src="https://github.com/pFernbach.png" width="80" title="pFernbach (2076 contributions)"/>
</a>
<a href="https://github.com/hungpham2511">
  <img src="https://github.com/hungpham2511.png" width="80" title="hungpham2511 (848 contributions)"/>
</a>
<a href="https://github.com/psardin001">
  <img src="https://github.com/psardin001.png" width="80" title="psardin001 (345 contributions)"/>
</a>
<a href="https://github.com/fmessmer">
  <img src="https://github.com/fmessmer.png" width="80" title="fmessmer (218 contributions)"/>
</a>
<a href="https://github.com/stonneau">
  <img src="https://github.com/stonneau.png" width="80" title="stonneau (141 contributions)"/>
</a>
<a href="https://github.com/laastp">
  <img src="https://github.com/laastp.png" width="80" title="laastp (140 contributions)"/>
</a>
<a href="https://github.com/isucan">
  <img src="https://github.com/isucan.png" width="80" title="isucan (130 contributions)"/>
</a>
<a href="https://github.com/thomas-moulard">
  <img src="https://github.com/thomas-moulard.png" width="80" title="thomas-moulard (125 contributions)"/>
</a>
<a href="https://github.com/hrp2-14">
  <img src="https://github.com/hrp2-14.png" width="80" title="hrp2-14 (115 contributions)"/>
</a>
<a href="https://github.com/Toefinder">
  <img src="https://github.com/Toefinder.png" width="80" title="Toefinder (89 contributions)"/>
</a>
<a href="https://github.com/wxmerkt">
  <img src="https://github.com/wxmerkt.png" width="80" title="wxmerkt (60 contributions)"/>
</a>
<a href="https://github.com/eacousineau">
  <img src="https://github.com/eacousineau.png" width="80" title="eacousineau (59 contributions)"/>
</a>
<a href="https://github.com/DiegoP-G">
  <img src="https://github.com/DiegoP-G.png" width="80" title="DiegoP-G (59 contributions)"/>
</a>
<a href="https://github.com/tfoote">
  <img src="https://github.com/tfoote.png" width="80" title="tfoote (57 contributions)"/>
</a>
<a href="https://github.com/scpeters">
  <img src="https://github.com/scpeters.png" width="80" title="scpeters (47 contributions)"/>
</a>
<a href="https://github.com/shaun-edwards">
  <img src="https://github.com/shaun-edwards.png" width="80" title="shaun-edwards (43 contributions)"/>
</a>
<a href="https://github.com/nmansard">
  <img src="https://github.com/nmansard.png" width="80" title="nmansard (38 contributions)"/>
</a>
<a href="https://github.com/gavanderhoorn">
  <img src="https://github.com/gavanderhoorn.png" width="80" title="gavanderhoorn (38 contributions)"/>
</a>
<a href="https://github.com/wjwwood">
  <img src="https://github.com/wjwwood.png" width="80" title="wjwwood (37 contributions)"/>
</a>
<a href="https://github.com/andreadelprete">
  <img src="https://github.com/andreadelprete.png" width="80" title="andreadelprete (33 contributions)"/>
</a>
<a href="https://github.com/DianeBury">
  <img src="https://github.com/DianeBury.png" width="80" title="DianeBury (32 contributions)"/>
</a>
<a href="https://github.com/ymontmarin">
  <img src="https://github.com/ymontmarin.png" width="80" title="ymontmarin (26 contributions)"/>
</a>
<a href="https://github.com/jcarpent">
  <img src="https://github.com/jcarpent.png" width="80" title="jcarpent (26 contributions)"/>
</a>
<a href="https://github.com/jackieokay">
  <img src="https://github.com/jackieokay.png" width="80" title="jackieokay (26 contributions)"/>
</a>
<a href="https://github.com/EdsterG">
  <img src="https://github.com/EdsterG.png" width="80" title="EdsterG (23 contributions)"/>
</a>
<a href="https://github.com/davetcoleman">
  <img src="https://github.com/davetcoleman.png" width="80" title="davetcoleman (21 contributions)"/>
</a>
<a href="https://github.com/kphawkins">
  <img src="https://github.com/kphawkins.png" width="80" title="kphawkins (20 contributions)"/>
</a>
<a href="https://github.com/Kotochleb">
  <img src="https://github.com/Kotochleb.png" width="80" title="Kotochleb (20 contributions)"/>
</a>
<a href="https://github.com/fairlight1337">
  <img src="https://github.com/fairlight1337.png" width="80" title="fairlight1337 (20 contributions)"/>
</a>
<a href="https://github.com/traversaro">
  <img src="https://github.com/traversaro.png" width="80" title="traversaro (19 contributions)"/>
</a>
<a href="https://github.com/YoheiKakiuchi">
  <img src="https://github.com/YoheiKakiuchi.png" width="80" title="YoheiKakiuchi (18 contributions)"/>
</a>
<a href="https://github.com/jordi-pages">
  <img src="https://github.com/jordi-pages.png" width="80" title="jordi-pages (17 contributions)"/>
</a>
<a href="https://github.com/Equanox">
  <img src="https://github.com/Equanox.png" width="80" title="Equanox (16 contributions)"/>
</a>
<a href="https://github.com/leonardoedgar">
  <img src="https://github.com/leonardoedgar.png" width="80" title="leonardoedgar (12 contributions)"/>
</a>
<a href="https://github.com/vrabaud">
  <img src="https://github.com/vrabaud.png" width="80" title="vrabaud (11 contributions)"/>
</a>
<a href="https://github.com/dirk-thomas">
  <img src="https://github.com/dirk-thomas.png" width="80" title="dirk-thomas (11 contributions)"/>
</a>
<a href="https://github.com/rhaschke">
  <img src="https://github.com/rhaschke.png" width="80" title="rhaschke (10 contributions)"/>
</a>
<a href="https://github.com/130s">
  <img src="https://github.com/130s.png" width="80" title="130s (10 contributions)"/>
</a>
<a href="https://github.com/mtenorth">
  <img src="https://github.com/mtenorth.png" width="80" title="mtenorth (9 contributions)"/>
</a>
<a href="https://github.com/mathias-luedtke">
  <img src="https://github.com/mathias-luedtke.png" width="80" title="mathias-luedtke (9 contributions)"/>
</a>
<a href="https://github.com/loanBRNT">
  <img src="https://github.com/loanBRNT.png" width="80" title="loanBRNT (9 contributions)"/>
</a>
<a href="https://github.com/bmagyar">
  <img src="https://github.com/bmagyar.png" width="80" title="bmagyar (9 contributions)"/>
</a>
<a href="https://github.com/k-okada">
  <img src="https://github.com/k-okada.png" width="80" title="k-okada (8 contributions)"/>
</a>
<a href="https://github.com/JasonChmn">
  <img src="https://github.com/JasonChmn.png" width="80" title="JasonChmn (8 contributions)"/>
</a>
<a href="https://github.com/hsu">
  <img src="https://github.com/hsu.png" width="80" title="hsu (8 contributions)"/>
</a>
<a href="https://github.com/airplanesrule">
  <img src="https://github.com/airplanesrule.png" width="80" title="airplanesrule (8 contributions)"/>
</a>
<a href="https://github.com/stevegolton">
  <img src="https://github.com/stevegolton.png" width="80" title="stevegolton (6 contributions)"/>
</a>
<a href="https://github.com/sebastiendalibard">
  <img src="https://github.com/sebastiendalibard.png" width="80" title="sebastiendalibard (6 contributions)"/>
</a>
<a href="https://github.com/quangounet">
  <img src="https://github.com/quangounet.png" width="80" title="quangounet (6 contributions)"/>
</a>
<a href="https://github.com/ipr-sr2">
  <img src="https://github.com/ipr-sr2.png" width="80" title="ipr-sr2 (6 contributions)"/>
</a>
<a href="https://github.com/guihomework">
  <img src="https://github.com/guihomework.png" width="80" title="guihomework (6 contributions)"/>
</a>
<a href="https://github.com/DLu">
  <img src="https://github.com/DLu.png" width="80" title="DLu (6 contributions)"/>
</a>
<a href="https://github.com/cottsay">
  <img src="https://github.com/cottsay.png" width="80" title="cottsay (6 contributions)"/>
</a>
<a href="https://github.com/aorthey">
  <img src="https://github.com/aorthey.png" width="80" title="aorthey (6 contributions)"/>
</a>
<a href="https://github.com/RenaudViry">
  <img src="https://github.com/RenaudViry.png" width="80" title="RenaudViry (5 contributions)"/>
</a>
<a href="https://github.com/MaximilienNaveau">
  <img src="https://github.com/MaximilienNaveau.png" width="80" title="MaximilienNaveau (5 contributions)"/>
</a>
<a href="https://github.com/ksyy">
  <img src="https://github.com/ksyy.png" width="80" title="ksyy (5 contributions)"/>
</a>
<a href="https://github.com/alexandrethiault">
  <img src="https://github.com/alexandrethiault.png" width="80" title="alexandrethiault (5 contributions)"/>
</a>
<a href="https://github.com/aclodic">
  <img src="https://github.com/aclodic.png" width="80" title="aclodic (5 contributions)"/>
</a>
<a href="https://github.com/timtmit">
  <img src="https://github.com/timtmit.png" width="80" title="timtmit (4 contributions)"/>
</a>
<a href="https://github.com/sea-bass">
  <img src="https://github.com/sea-bass.png" width="80" title="sea-bass (4 contributions)"/>
</a>
<a href="https://github.com/ndehio">
  <img src="https://github.com/ndehio.png" width="80" title="ndehio (4 contributions)"/>
</a>
<a href="https://github.com/mttamtam">
  <img src="https://github.com/mttamtam.png" width="80" title="mttamtam (4 contributions)"/>
</a>
<a href="https://github.com/karlyeurl">
  <img src="https://github.com/karlyeurl.png" width="80" title="karlyeurl (4 contributions)"/>
</a>
<a href="https://github.com/jbohren">
  <img src="https://github.com/jbohren.png" width="80" title="jbohren (4 contributions)"/>
</a>
<a href="https://github.com/jakob-ludwiger">
  <img src="https://github.com/jakob-ludwiger.png" width="80" title="jakob-ludwiger (4 contributions)"/>
</a>
<a href="https://github.com/ThomasTimm">
  <img src="https://github.com/ThomasTimm.png" width="80" title="ThomasTimm (3 contributions)"/>
</a>
<a href="https://github.com/rlefevre1">
  <img src="https://github.com/rlefevre1.png" width="80" title="rlefevre1 (3 contributions)"/>
</a>
<a href="https://github.com/ipa-robotino">
  <img src="https://github.com/ipa-robotino.png" width="80" title="ipa-robotino (3 contributions)"/>
</a>
<a href="https://github.com/IliasHar">
  <img src="https://github.com/IliasHar.png" width="80" title="IliasHar (3 contributions)"/>
</a>
<a href="https://github.com/de-vri-es">
  <img src="https://github.com/de-vri-es.png" width="80" title="de-vri-es (3 contributions)"/>
</a>
<a href="https://github.com/bulwahn">
  <img src="https://github.com/bulwahn.png" width="80" title="bulwahn (3 contributions)"/>
</a>
<a href="https://github.com/airballking">
  <img src="https://github.com/airballking.png" width="80" title="airballking (3 contributions)"/>
</a>
<a href="https://github.com/tnl-woi">
  <img src="https://github.com/tnl-woi.png" width="80" title="tnl-woi (2 contributions)"/>
</a>
<a href="https://github.com/teguhSL">
  <img src="https://github.com/teguhSL.png" width="80" title="teguhSL (2 contributions)"/>
</a>
<a href="https://github.com/ompugao">
  <img src="https://github.com/ompugao.png" width="80" title="ompugao (2 contributions)"/>
</a>
<a href="https://github.com/olivier-stasse">
  <img src="https://github.com/olivier-stasse.png" width="80" title="olivier-stasse (2 contributions)"/>
</a>
<a href="https://github.com/mylene-campana">
  <img src="https://github.com/mylene-campana.png" width="80" title="mylene-campana (2 contributions)"/>
</a>
<a href="https://github.com/johnwason">
  <img src="https://github.com/johnwason.png" width="80" title="johnwason (2 contributions)"/>
</a>
<a href="https://github.com/gaya-">
  <img src="https://github.com/gaya-.png" width="80" title="gaya- (2 contributions)"/>
</a>
<a href="https://github.com/doudou">
  <img src="https://github.com/doudou.png" width="80" title="doudou (2 contributions)"/>
</a>
<a href="https://github.com/ahoarau">
  <img src="https://github.com/ahoarau.png" width="80" title="ahoarau (2 contributions)"/>
</a>
<a href="https://github.com/zkingston">
  <img src="https://github.com/zkingston.png" width="80" title="zkingston (1 contributions)"/>
</a>
<a href="https://github.com/vincentrou">
  <img src="https://github.com/vincentrou.png" width="80" title="vincentrou (1 contributions)"/>
</a>
<a href="https://github.com/velveteenrobot">
  <img src="https://github.com/velveteenrobot.png" width="80" title="velveteenrobot (1 contributions)"/>
</a>
<a href="https://github.com/v4hn">
  <img src="https://github.com/v4hn.png" width="80" title="v4hn (1 contributions)"/>
</a>
<a href="https://github.com/tykurtz">
  <img src="https://github.com/tykurtz.png" width="80" title="tykurtz (1 contributions)"/>
</a>
<a href="https://github.com/tlind">
  <img src="https://github.com/tlind.png" width="80" title="tlind (1 contributions)"/>
</a>
<a href="https://github.com/thanhndv212">
  <img src="https://github.com/thanhndv212.png" width="80" title="thanhndv212 (1 contributions)"/>
</a>
<a href="https://github.com/shintarokkk">
  <img src="https://github.com/shintarokkk.png" width="80" title="shintarokkk (1 contributions)"/>
</a>
<a href="https://github.com/scottpaulin">
  <img src="https://github.com/scottpaulin.png" width="80" title="scottpaulin (1 contributions)"/>
</a>
<a href="https://github.com/piyushk">
  <img src="https://github.com/piyushk.png" width="80" title="piyushk (1 contributions)"/>
</a>
<a href="https://github.com/phyrog">
  <img src="https://github.com/phyrog.png" width="80" title="phyrog (1 contributions)"/>
</a>
<a href="https://github.com/petroselo">
  <img src="https://github.com/petroselo.png" width="80" title="petroselo (1 contributions)"/>
</a>
<a href="https://github.com/petrikvladimir">
  <img src="https://github.com/petrikvladimir.png" width="80" title="petrikvladimir (1 contributions)"/>
</a>
<a href="https://github.com/otamachan">
  <img src="https://github.com/otamachan.png" width="80" title="otamachan (1 contributions)"/>
</a>
<a href="https://github.com/mskripnik">
  <img src="https://github.com/mskripnik.png" width="80" title="mskripnik (1 contributions)"/>
</a>
<a href="https://github.com/mikepurvis">
  <img src="https://github.com/mikepurvis.png" width="80" title="mikepurvis (1 contributions)"/>
</a>
<a href="https://github.com/mikeferguson">
  <img src="https://github.com/mikeferguson.png" width="80" title="mikeferguson (1 contributions)"/>
</a>
<a href="https://github.com/miguelprada">
  <img src="https://github.com/miguelprada.png" width="80" title="miguelprada (1 contributions)"/>
</a>
<a href="https://github.com/marcoesposito1988">
  <img src="https://github.com/marcoesposito1988.png" width="80" title="marcoesposito1988 (1 contributions)"/>
</a>
<a href="https://github.com/lvhao54">
  <img src="https://github.com/lvhao54.png" width="80" title="lvhao54 (1 contributions)"/>
</a>
<a href="https://github.com/Linjackffy">
  <img src="https://github.com/Linjackffy.png" width="80" title="Linjackffy (1 contributions)"/>
</a>
<a href="https://github.com/jspricke">
  <img src="https://github.com/jspricke.png" width="80" title="jspricke (1 contributions)"/>
</a>
<a href="https://github.com/jslee02">
  <img src="https://github.com/jslee02.png" width="80" title="jslee02 (1 contributions)"/>
</a>
<a href="https://github.com/jsbyysheng">
  <img src="https://github.com/jsbyysheng.png" width="80" title="jsbyysheng (1 contributions)"/>
</a>
<a href="https://github.com/jrgnicho">
  <img src="https://github.com/jrgnicho.png" width="80" title="jrgnicho (1 contributions)"/>
</a>
<a href="https://github.com/jonbinney">
  <img src="https://github.com/jonbinney.png" width="80" title="jonbinney (1 contributions)"/>
</a>
<a href="https://github.com/jihoonl">
  <img src="https://github.com/jihoonl.png" width="80" title="jihoonl (1 contributions)"/>
</a>
<a href="https://github.com/JeremyZoss">
  <img src="https://github.com/JeremyZoss.png" width="80" title="JeremyZoss (1 contributions)"/>
</a>
<a href="https://github.com/jeppewalther">
  <img src="https://github.com/jeppewalther.png" width="80" title="jeppewalther (1 contributions)"/>
</a>
<a href="https://github.com/jensenb">
  <img src="https://github.com/jensenb.png" width="80" title="jensenb (1 contributions)"/>
</a>
<a href="https://github.com/hersh">
  <img src="https://github.com/hersh.png" width="80" title="hersh (1 contributions)"/>
</a>
<a href="https://github.com/goretkin">
  <img src="https://github.com/goretkin.png" width="80" title="goretkin (1 contributions)"/>
</a>
<a href="https://github.com/garyservin">
  <img src="https://github.com/garyservin.png" width="80" title="garyservin (1 contributions)"/>
</a>
<a href="https://github.com/fvalenza">
  <img src="https://github.com/fvalenza.png" width="80" title="fvalenza (1 contributions)"/>
</a>
<a href="https://github.com/francois-keith">
  <img src="https://github.com/francois-keith.png" width="80" title="francois-keith (1 contributions)"/>
</a>
<a href="https://github.com/eholum">
  <img src="https://github.com/eholum.png" width="80" title="eholum (1 contributions)"/>
</a>
<a href="https://github.com/DorianScholz">
  <img src="https://github.com/DorianScholz.png" width="80" title="DorianScholz (1 contributions)"/>
</a>
<a href="https://github.com/destogl">
  <img src="https://github.com/destogl.png" width="80" title="destogl (1 contributions)"/>
</a>
<a href="https://github.com/daeunSong">
  <img src="https://github.com/daeunSong.png" width="80" title="daeunSong (1 contributions)"/>
</a>
<a href="https://github.com/compscidr">
  <img src="https://github.com/compscidr.png" width="80" title="compscidr (1 contributions)"/>
</a>
<a href="https://github.com/codacy-badger">
  <img src="https://github.com/codacy-badger.png" width="80" title="codacy-badger (1 contributions)"/>
</a>
<a href="https://github.com/bcoudrin">
  <img src="https://github.com/bcoudrin.png" width="80" title="bcoudrin (1 contributions)"/>
</a>
<a href="https://github.com/airobert">
  <img src="https://github.com/airobert.png" width="80" title="airobert (1 contributions)"/>
</a>
<a href="https://github.com/achim-k">
  <img src="https://github.com/achim-k.png" width="80" title="achim-k (1 contributions)"/>
</a>
<a href="https://github.com/abubeck">
  <img src="https://github.com/abubeck.png" width="80" title="abubeck (1 contributions)"/>
</a>
<a href="https://github.com/ablasdel">
  <img src="https://github.com/ablasdel.png" width="80" title="ablasdel (1 contributions)"/>
</a>
<a href="https://github.com/0">
  <img src="https://github.com/0.png" width="80" title="0 ( contributions)"/>
</a>
</p>
