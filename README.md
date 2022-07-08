# fdds-rosbot-demo

## Use ROSbot with FastRTPS midlware. 
1. Clone git repository:
   ```bash
    git clone https://github.com/pkowalsk1/fdds-rosbot-demo.git
   ```
   Complete the `dds-config.xml` file with `ipv4` addresses (you can use i.e. `ifconfig` command to get ip addresses). 

    > Tip:
    >
    > You can also use UDPv6 transport with ipv6. See [exapmle](https://fast-dds.docs.eprosima.com/en/latest/fastdds/xml_configuration/example.html) from Eprosima.

2. On your laptop and ROSbot execute:

```bash
cd fdds-rosbot-demo

export ROS_DOMAIN_ID=20
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp                     # Set RMW implementation

# Optional:
export FASTRTPS_DEFAULT_PROFILES_FILE=${PWD}/dds-config.xml    # Set DDS config file
```

3. Next: 

- On ROSbot:
    ```bash
    source /opt/ros/${ROS_DISTRO}/setup.bash
    ros2 run demo_nodes_cpp talker
    ```
- On Laptop:
    ```bash
    source /opt/ros/${ROS_DISTRO}/setup.bash
    ros2 run demo_nodes_cpp listener
    ```

## Use ROSbot with FastDDS Discovery Server 

1. Complete the `dds-config-discovery-server.xml` and `dds-config-discovery-client.xml` files with `ipv4` addresses. On your laptop and ROSbot execute:

```bash
export ROS_DOMAIN_ID=20
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp                     # Set RMW implementation
```

1. Next: 

- On Laptop:
    ```bash
    cd fdds-rosbot-demo

    export FASTRTPS_DEFAULT_PROFILES_FILE=${PWD}/dds-config-discovery-server.xml    # Set DDS config file

    source /opt/ros/${ROS_DISTRO}/setup.bash
    ros2 run demo_nodes_cpp listener
    ```

- On ROSbot:
    ```bash
    cd fdds-rosbot-demo

    export FASTRTPS_DEFAULT_PROFILES_FILE=${PWD}/dds-config-discovery-client.xml    # Set DDS config file


    source /opt/ros/${ROS_DISTRO}/setup.bash
    ros2 run demo_nodes_cpp talker
    ```

For more exampels visit https://fast-dds.docs.eprosima.com/en/latest/fastdds/use_cases/wifi/wifi.html