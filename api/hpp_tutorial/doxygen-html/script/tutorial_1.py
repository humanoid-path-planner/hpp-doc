from hpp.corbaserver.pr2 import Robot
robot = Robot ('pr2')
robot.setJointBounds ("base_joint_xy", [-4, -3, -5, -3])

from hpp.corbaserver import ProblemSolver
ps = ProblemSolver (robot)

from hpp.gepetto import ViewerFactory
r = ViewerFactory (ps)

q_init = robot.getCurrentConfig ()
q_goal = q_init [::]
q_init [0:2] = [-3.2, -4]
rank = robot.rankInConfiguration ['torso_lift_joint']
q_init [rank] = 0.2
r (q_init)

q_goal [0:2] = [-3.2, -4]
rank = robot.rankInConfiguration ['l_shoulder_lift_joint']
q_goal [rank] = 0.5
rank = robot.rankInConfiguration ['l_elbow_flex_joint']
q_goal [rank] = -0.5
rank = robot.rankInConfiguration ['r_shoulder_lift_joint']
q_goal [rank] = 0.5
rank = robot.rankInConfiguration ['r_elbow_flex_joint']
q_goal [rank] = -0.5
r (q_goal)

r.loadObstacleModel ("iai_maps", "kitchen_area", "kitchen")

ps.setInitialConfig (q_init)
# ps.addGoalConfig (q_goal)

# ps.addPathOptimizer ("RandomShortcut")

# ps.solve ()

from hpp.gepetto import PathPlayer
pp = PathPlayer (robot.client, r)

# pp (0)
# pp (1)

# test
jp = [-4.016784835909555, -4.671737012514295, 0.9493205942691932, -0.19838422293030356, 0.17672477884262752, -0.35476407311266434, 0.8964120174695772]
ps.createPositionConstraint ("l_gripper", "l_gripper_tool_joint", "", [0,0,0], jp[:3], [1,1,1])
ps.client.problem.setGoalNumericalConstraints ("test",["l_gripper",], [0,])

# qq = [-3.2736323380281704, -4.919012557067956, -0.5645503720485425, 0.8253986172873397, 0.31, 2.4756472106318212, -0.10231121294734401, 0.5832544388135313, 0.9877368674476137, 0.351352194158052, -1.1240948972856866, 0.9832501749355624, -0.1822610586197337, -0.8650504112999698, 0.6602954608097523, -0.7510059283614456, 0.28134369878719734, 0.5218218893957427, 0.5020748972660279, 0.34837002692202573, 0.39307871732911037, 0.012744229982022303, 0.33261894418886817, -0.7484151440244099, -1.5567378515100605, -0.2601290957285226, -0.1203692551331449, -1.9576008301144934, 0.8124905337042794, -0.5829743842064892, -1.8222188044396315, -0.7752624281039475, -0.63163927013001, 0.5474106358659504, 0.11960478411037699, 0.2810869521336104, 0.45983350461154876, 0.3357266282624224, 0.026642845592760873, 0.34937864270125457]
# ps.addGoalConfig (qq)

time = list()
nbNode = list()
nbIter = 1
for i in range(nbIter):
    ps.clearRoadmap ()
    time.append (ps.solve ())
    nbNode.append(len(ps.nodes()))
    print i, time[-1], nbNode[-1]

i = -1
indexes=[]
while True:
    try:
        i = nbNode.index(2, i+1)
    except ValueError:
        break
    indexes.append (i)

import numpy as np
m = np.mean(np.array(time)[indexes],0)
print (m[2]*1000 + m[3]) / 1000., "sec."
