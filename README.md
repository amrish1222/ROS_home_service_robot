# Home Service Robot Project

The goal of this project is to program a robot than can map an environment and autonomously navigate to pick up and drop off virtual objects. Steps:

- Design a simple environment with the Building Editor in Gazebo.
- Teleoperate your robot and manually test SLAM.
- Use the ROS navigation stack and manually commands your robot using the 2D Nav Goal tool in rviz to move to different positions and orientations.
- Write a pick_objects node to autonomously command the robot to travel to 2 specific zones: pickup and drop off.
- Write an add_markers node that subscribes to your robot odometry, keeps track of your robot pose, and creates virtual objects(markers) to rviz.

## Project setup 

Install the ROS navigation stack:
`sudo apt-get install ros-kinetic-navigation`

Create catkin workspace:
```
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src
$ catkin_init_workspace
$ cd ~/catkin_ws
$ catkin_make
```
Clone the following repositories to catkin_ws/src:
```
$ cd ~/catkin_ws/src
$ git clone https://github.com/ros-perception/slam_gmapping.git
$ git clone https://github.com/turtlebot/turtlebot.git
$ git clone https://github.com/turtlebot/turtlebot_interactions.git
$ git clone https://github.com/turtlebot/turtlebot_simulator.git
```
Install package dependencies with `rosdep install [package-name]`

Clone this repository and copy content of this repository to catkin_ws/src

```
git clone https://github.com/amrish1222/ROS_home_service_robot.git
```

Catkin workspace should look something like this:
```
catkin_ws/src
    ├──                                # Official ROS packages
    |
    ├── slam_gmapping                  # gmapping_demo.launch file                   
    │   ├── gmapping
    │   ├── ...
    ├── turtlebot                      # keyboard_teleop.launch file
    │   ├── turtlebot_teleop
    │   ├── ...
    ├── turtlebot_interactions         # view_navigation.launch file      
    │   ├── turtlebot_rviz_launchers
    │   ├── ...
    ├── turtlebot_simulator            # turtlebot_world.launch file 
    │   ├── turtlebot_gazebo
    │   ├── ...
    ├──                                # Your packages and direcotries
    |
    ├── map                          # map files
    │   ├── ...
    ├── scripts                   # shell scripts files
    │   ├── ...
    ├──rvizConfig                      # rviz configuration files
    │   ├── ...
    ├──pick_objects                    # pick_objects C++ node
    │   ├── src/pick_objects.cpp
    │   ├── ...
    ├──add_markers                     # add_marker C++ node
    │   ├── src/add_markers.cpp
    │   ├── ...
    └──
```


Source and build the project:
```
$ cd ~/catkin_ws
$ source devel/setup.bash
$ catkin_make
```
Run `./home_service.sh` in `scripts` directory to execute the home service robot.

## Mapping 

Is achieved using the gmapping ROS package.

## Localization

Is achieved using the AMCL ROS package. It uses Monte-Carlo localization techniques.

## Navigation

Is achieved using the ROS navigation stack.
