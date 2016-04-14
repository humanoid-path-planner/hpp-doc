---
layout: post
title: "Implement an RRT in Python"
date: 2016-04-14
disqus: no
excerpt_separator: <!--more-->
---

Thanks to the Python bindings of HPP, prototyping new motion planning algorithm
is very easy.

<!--more-->

## Write a function

{% highlight python linenos %}
def solveBiRRT (ps, robot, maxIter = float("inf")):
  ps.prepareSolveStepByStep ()
  finished = False

  # In the framework of the course, we restrict ourselves to 2 connected components.
  nbCC = ps.numberConnectedComponents ()
  if nbCC != 2:
    raise Exception ("There should be 2 connected components.")

  iter = 0
  while True:
    #### RRT begin
    qrand = robot.shootRandomConfig ()
    newConfigs = list ()

    for i in [0,1]:
      ## Extend connected components
      qnear, dist = ps.getNearestConfig (qrand, i)
      pathFullyValid, i_path = ps.directPath (qnear, qrand)
      l = ps.pathLength (i_path)
      qnew = ps.configAtParam (i_path, l)
      ps.addConfigToRoadmap (qnew)
      newConfigs.append (qnew)
      ps.addEdgeToRoadmap (qnear, qnew, i_path, True)

    ## Try connecting the new nodes together
    for i in range (len(newConfigs)):
      for j in range (i):
        pathFullyValid, i_path = ps.directPath (newConfigs[i], newConfigs[j])
        if pathFullyValid:
          ps.addEdgeToRoadmap (newConfigs[i], newConfigs[j], i_path, True)

    #### RRT end
    ## Check if the problem is solved.
    nbCC = ps.numberConnectedComponents ()
    if nbCC == 1:
      # Problem solved
      finished = True
      break
    iter = iter + 1
    if iter > maxIter:
      break
  if finished:
      ps.finishSolveStepByStep ()
{% endhighlight %}
