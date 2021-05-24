# AliveOS-ROS

Here is a ROS-based implementation of AliveOS. The OS implements structures of animal brains such as: reflexes, instincts, hormones, etc.

This is a metapackage for ROS Noetic

## Dependencies

- [ROS Noetic](http://wiki.ros.org/noetic/Installation)
- [Python 3](https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python)
- [vcstools](https://github.com/dirk-thomas/vcstool#how-to-install-vcstool)

## ROS packages

The operating system consists of following packages:

- [aliveos_ros_meta](https://github.com/an-dr/aliveos_ros_meta)
- [aliveos_app](https://github.com/an-dr/aliveos_app)
- [aliveos_demo](https://github.com/an-dr/aliveos_demo)
- [aliveos_hw](https://github.com/an-dr/aliveos_hw)
- [aliveos_launch](https://github.com/an-dr/aliveos_launch)
- [aliveos_middle](https://github.com/an-dr/aliveos_middle)
- [aliveos_msgs](https://github.com/an-dr/aliveos_msgs)
- [aliveos_py](https://github.com/an-dr/aliveos_py)

## Installation

### 1. Create a catkin workspace

```bash
mkdir -p ./robot_ws/src
cd ./robot_ws
catkin_make
```

### 2. Download the meta-package

Clone the repository

```bash
git clone https://github.com/an-dr/aliveos_ros_meta.git ./src/aliveos_ros_meta
```

or add it as a submodule

```bash
git add submodule https://github.com/an-dr/aliveos_ros_meta.git ./src/aliveos_ros_meta
```

### 3. Download the AlivaOS package stack

Execute the command bellow to download all packages. For the stable version:

```bash
vcs import --recursive --input ./src/aliveos_ros_meta/aliveos_release.rosinstall ./src
```

Or for the latest version:

```bash
vcs import --recursive --input ./src/aliveos_ros_meta/aliveos_latest.rosinstall ./src
```

### 4. (Optionally) add all packages to the `.gitignore` file

```txt
# aliveos deps
src/aliveos_app
src/aliveos_demo
src/aliveos_hw
src/aliveos_launch
src/aliveos_middle
src/aliveos_msgs
src/aliveos_py
```

## Start demo

### 1. Build the workspace

```bash
catkin_make
```

### 2. Source the environment

```bash
. ./devel/setup.bash
```

### 3. Launch the demo package

```bash
roslaunch aliveos_demo simple_demo.launch
```

## Structure

<img src="nodes.svg" width="800">

## Support

You can support the project

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/4ndr/1eur)

Any amount will be highly appreciated.
