# Documentation

## Introduction

This shell script is designed to help developers working with MicroK8s on Windows WSL2 to easily add or remove a route on the host that allows access to resources within a Kubernetes cluster managed by MicroK8s.

## Prerequisites

- Windows 10 with WSL2 installed
- MicroK8s installed and running on WSL2
- The `kubectl` command-line tool installed and configured to work with MicroK8s
- Access to a terminal or command prompt with administrative privileges on the Windows host

## How the Script Works

The script takes a single parameter, either `route` or `remove`, and generates the appropriate `route` command or `route delete` command based on the parameter value.

When the parameter value is `route`, the script generates a `route` command that adds a route to the network associated with a service in the MicroK8s cluster via the IP address of the WSL2 instance. The network information is obtained from the `sudo microk8s kubectl get svc` command, which returns information about the services in the cluster.

When the parameter value is `remove`, the script generates a `route delete` command that removes the previously added route.

## Running the Script

1. Save the script to a file with a `.sh` extension.
2. Make the script executable with the following command:
3. Run the script with the following command, replacing `[route|remove]` with either `route` or `remove` as appropriate:
4. The script will generate the appropriate `route` or `route delete` command.
5. To run the generated command on Windows with administrative privileges, open a PowerShell window as an administrator.
6. Copy and paste the generated command into the PowerShell window and press Enter.
7. To remove the route, repeat steps 4-6 with the parameter value `remove`.
8. To check the active routes, run the following command in a PowerShell window with administrative privileges:

## Conclusion

This script can simplify the process of adding or removing a route on the Windows host that allows access to resources within a MicroK8s cluster, making it easier for developers to work with MicroK8s on Windows WSL2. By automating the process of generating the `route` or `route delete` command, the script reduces the risk of errors and ensures that the correct network information is used.

