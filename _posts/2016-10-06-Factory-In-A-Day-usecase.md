---
layout: post
title: "Robot programming: Factory in a day use case"
date: 2016-10-06
disqus: no
excerpt_separator: <!--more-->
---

### Programming robots

Programming industrial robots to perform repetitive tasks is time-consuming. Based on our knowledge in manipulation planning, we have developed

- software that handle the manipulation constraints, and
- a graphical user interface that enable a programmer to define the manipulation constraints relative to a problem. 

<!--more-->

### Manipulation planning

When an robot manipulates objects, the motions of the objects are subject to constraints:
- objects grasped by the robot move with the robot,
- objects not grasped by the robot stay static in a stable position. 

These constraints raises scientific issues that we try to address by designing dedicated algorithms.

### The use case

Details on the Factory In A Day use case can be found [here](http://www.factory-in-a-day.eu/project-idea/use-cases/).

#### The full sequence

The robot grasp each of 8 parts, move them to the caroussel where they are processed, put them back to the initially empty tray, and finally stacks the empty tray on top of the full tray.

<video height="400px" controls>
<source src="http://projects.laas.fr/gepetto/uploads/Members/fiad-full-sequence.mp4" type="video/mp4"/>
</video>

#### Definition of a manipulation problem

<video height="400px" controls>
<source src="http://projects.laas.fr/gepetto/uploads/Members/philips-problem-definition.mp4" type="video/mp4"/>
</video>

#### Definition of grasps and resolution

<video height="400px" controls>
<source src="http://projects.laas.fr/gepetto/uploads/Members/philips-rules-and-resolution.mp4" type="video/mp4"/>
</video>

#### Pre-grasp position to ease motion planning

<video height="400px" controls>
<source src="http://projects.laas.fr/gepetto/uploads/Members/philips-pre-grasp.mp4" type="video/mp4"/>
</video>
