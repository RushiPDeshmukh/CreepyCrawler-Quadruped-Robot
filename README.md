# CreepyCrawler-Quadruped-Robot
Building a Quadruped robot to implement control techniques and robot dynamics 
# Creepy_Crawler

* Author: Rushikesh Deshmukh  <rdeshmukh@wpi.edu>
* License: GNU General Public License, version 3 (GPL-3.0)

Example robots and code for interfacing Gazebo with ROS

## Quick Start
One_Leg:

        Rviz:

            roslaunch creepy_crawler one_leg_rviz.launch

        Gazebo:

            roslaunch creepy_crawler one_leg_world.launch

        ROS Control:

            roslaunch creepy_crawler one_leg_control.launch

        Example of Moving Joints:

            rostopic pub /creepy_crawler/joint1_1_effort_controller/command std_msgs/Float64 "data: -0.9"

Creepy_Crawler:

        Rviz:

            roslaunch creepy_crawler creepy_crawler_rviz.launch

        Gazebo:

            roslaunch creepy_crawler creepy_crawler_world.launch

        ROS Control:

            roslaunch creepy_crawler creepy_crawler_effort_control.launch

        Example of Moving Joints:

            rostopic pub /creepy_crawler/joint1_1_effort_controller/command std_msgs/Float64 "data: -0.9"


Creepy_Spot:
        Gazebo:

            roslaunch creepy_crawler creepy_spot_world.launch

        ROS Control:

            roslaunch creepy_crawler creepy_spot_effort_control.launch

        Example of Moving Joints:

            rostopic pub /creepy_spots/joint1_1_effort_controller/command std_msgs/Float64 "data: -0.9"
            
            
src folder contains all the neccassary matlab codes for the project:

	Trajectory folder contains trajectpry generation
	controls contains code for feedback linearization control algo and lagrangian dynamics model
	dynamics_RNE contains RNE based dynamics model and matlab implementation of one leg movement.
	

