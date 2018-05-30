from hpp import Transform
from manipulation import robot, vf, ConstraintGraph, ps, Ground, Box, Pokeball, PathPlayer, gripperName, ballName

vf.loadEnvironmentModel (Ground, 'ground')
vf.loadObjectModel (Pokeball, 'pokeball')
robot.setJointBounds ('pokeball/base_joint_xyz', [-.4,.4,-.4,.4,-.1,1.])

r = vf.createViewer ()

q1 = [0, -1.57, 1.57, 0, 0, 0, .3, 0, 0.025, 1, 0, 0, 0]
r (q1)

## Create constraint graph
graph = ConstraintGraph (robot, 'graph')

## Create constraint of relative position of the ball in the gripper when ball
## is grasped
graph.createGrasp ('grasp', 'ur5/gripper', 'pokeball/handle')

## Create nodes and edges
graph.createNode (['grasp', 'placement'])
graph.createEdge ('placement', 'placement', 'transit', 1, 'placement')
graph.createEdge ('grasp', 'grasp', 'transfer', 1, 'grasp')
graph.createEdge ('placement', 'grasp', 'grasp-ball', 1, 'placement')
graph.createEdge ('grasp', 'placement', 'release-ball', 1, 'placement')

## Create transformation constraint : ball is in horizontal plane with free
## rotation around z
ps.createTransformationConstraint ('placement', 'pokeball/base_joint_SO3', '', [0,0,0.025,1,0,0,0], [False, False, True, True, True, False,])
#  Create complement constraint
ps.createTransformationConstraint ('placement/complement', 'pokeball/base_joint_SO3', '', [0,0,0.025,1,0,0,0], [True, True, False, False, False, True,])

ps.setConstantRightHandSide ('placement', True)
ps.setConstantRightHandSide ('placement/complement', False)

## Set constraints of nodes and edges
graph.setConstraints (node='placement', numConstraints = ['placement'])
graph.setConstraints (node='grasp', numConstraints = ['grasp'])
graph.setConstraints (edge='transit',
                      numConstraints = ['placement', 'placement/complement'])
graph.setConstraints (edge='transfer', numConstraints = ['grasp'])
graph.setConstraints (edge='grasp-ball',
                      numConstraints = ['placement', 'placement/complement'])
graph.setConstraints (edge='release-ball',
                      numConstraints = ['placement', 'placement/complement'])

## Project initial configuration on state 'placement'
res, q_init, error = ps.client.manipulation.problem.applyConstraints \
                     (graph.nodes ['placement'], q1)
q2 = q1 [::]
q2 [7] = .2

## Project goal configuration on state 'placement'
res, q_goal, error = ps.client.manipulation.problem.applyConstraints \
                     (graph.nodes ['placement'], q2)

## Define manipulation planning problem
ps.setInitialConfig (q_init)
ps.addGoalConfig (q_goal)
ps.selectPathValidation ("Dichotomy", 0)

pp = PathPlayer (ps.client.basic, r)

## Build relative position of the ball with respect to the gripper
for i in range (100):
  q = robot.shootRandomConfig ()
  res,q3,err = graph.generateTargetConfig ('grasp-ball', q_init, q)
  if res and robot.isConfigValid (q3): break;

if res:
  robot.setCurrentConfig (q3)
  gripperPose = Transform (robot.getLinkPosition (gripperName))
  ballPose = Transform (robot.getLinkPosition (ballName))
  gripperAboveBall = gripperPose.inverse () * ballPose
  gripperAboveBall.translation [2] += .1
