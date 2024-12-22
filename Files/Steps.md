# Steps to Create a server

- Create compute instance
  - Name
  - Compartment
  - Placement
    - Nenhuma alteração
  - Security
    - Nenhuma alteração
  - Image and Shape
    - Oracle Linux 8
    - VM.Standard.A1.Flex|Always Free-eligible|Virtual machine, 3 core OCPU, 23 GB memory, 3 Gbps network bandwidth
  - Create Public Subnet
  - SSH Key pair

## Automatizing

- [Create instance CLI](https://docs.oracle.com/pt-br/iaas/Content/Compute/Tasks/launchinginstance.htm#:~:text=Console-,CLI,-API)
- [API Key](https://archive.ph/OjSqw)

## Errors and solutions

### Out of capacity

> Out of capacity for shape VM.Standard.A1.Flex in availability domain AD-1. Create the instance in a different availability domain or try again later. If you specified a fault domain, try creating the instance without specifying a fault domain. If that doesn’t work, please try again later. Learn more about host capacity.

- [Solution](https://bestofphp.com/repo/hitrov-oci-arm-host-capacity)

## Docker way on Windows

- Install via .exe (?)
  - Needs WSL2
