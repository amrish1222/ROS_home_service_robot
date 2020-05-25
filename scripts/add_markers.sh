#!/bin/sh
xterm -e " roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=/home/workspace/catkin_ws/src/map/my_world.world " &
sleep 5
xterm -e " roslaunch turtlebot_gazebo amcl_demo.launch map_file:=/home/workspace/catkin_ws/src/map/my_world.yaml " &
sleep 5
xterm -e " rosrun rviz rviz -d /home/workspace/catkin_ws/src/rvizConfig/home_service.rviz " &
sleep 15
xterm -e "rosrun add_markers add_markers"
