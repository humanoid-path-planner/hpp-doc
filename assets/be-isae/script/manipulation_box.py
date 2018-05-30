from math import sqrt
from hpp import Transform
from manipulation import robot, vf, ConstraintGraph, ps, Ground, Box, Pokeball, PathPlayer, gripperName, ballName

vf.loadEnvironmentModel (Ground, 'ground')
vf.loadEnvironmentModel (Box, 'box')
vf.moveObstacle ('box/base_link_0', [0.3+0.04, 0, 0.04, 1, 0, 0, 0])
vf.moveObstacle ('box/base_link_1', [0.3-0.04, 0, 0.04, 1, 0, 0, 0])
vf.moveObstacle ('box/base_link_2', [0.3, 0.04, 0.04, 1, 0, 0, 0])
vf.moveObstacle ('box/base_link_3', [0.3, -0.04, 0.04, 1, 0, 0, 0])

vf.loadObjectModel (Pokeball, 'pokeball')
robot.setJointBounds ('pokeball/base_joint_xyz', [-.4,.4,-.4,.4,-.1,1.])

r = vf.createViewer ()

q1 = [0, -1.57, 1.57, 0, 0, 0, .3, 0, 0.025, 1, 0, 0, 0]
r (q1)

## Create graph
graph = ConstraintGraph (robot, 'graph')

gripperAboveBall = (0, 0, 0.15, 0, -sqrt (2)/2, -sqrt (2)/2, 0)
ballAboveGround = [0, 0, 0.1, 1, 0, 0, 0]

## Create your own graph here
pp = PathPlayer (ps.client.basic, r)

