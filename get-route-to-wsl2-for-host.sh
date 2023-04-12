#!/bin/bash

# make it executable with chmod +x [script_name].sh, and then run it with ./[script_name].sh [route|remove].
# The script will generate either a route command or a route delete command based on the value of the parameter.

# Get the action (route or remove)
ACTION=$1

# Get the IP address of the WSL2 instance
WSL2_IP=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

# Get the network information from the `sudo microk8s kubectl get svc` command
NETWORK=$(sudo microk8s kubectl get svc | grep nginx | awk '{print $3}')
NETWORK_ADDRESS=$(echo $NETWORK | cut -d"." -f1-3).0
NETWORK_MASK=255.255.255.0

# Generate the appropriate command
if [ "$ACTION" == "route" ]; then
  echo "route add $NETWORK_ADDRESS mask $NETWORK_MASK $WSL2_IP"
elif [ "$ACTION" == "remove" ]; then
  echo "route delete $NETWORK_ADDRESS"
else
  echo "Error: Invalid action. Use either 'route' or 'remove'."
fi
