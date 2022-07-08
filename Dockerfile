FROM ros:foxy

RUN apt-get update && apt-get install -y \
        ros-${ROS_DISTRO}-demo-nodes-cpp \
        ros-${ROS_DISTRO}-rmw-fastrtps-cpp 

COPY ./ros_entrypoint.sh /

ENTRYPOINT [ "/ros_entrypoint.sh" ]