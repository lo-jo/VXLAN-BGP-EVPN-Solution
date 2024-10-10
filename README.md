# Bgp At Doors of Autonomous Systems is Simple

Simulation of VXLAN networks in GNS3 in a virtual machine.

# Usage
#### VIRTUAL MACHINE
Launch the VN and ssh into it with X11 forwarding

``` 
vagrant up
vagrant ssh -- -X
```
### Network simulations
For any of the network simulations, launching /vagrant/p1/build_devices beforehand is mandatory.

# Part 1
Configure GNS3 and Docker to create a Host and a Router from docker images.

# Part 2
VXLAN Network topology with 2 hosts, 2 routers and one switch.

# Part 3
BGP EVPN (Ethernet VPN) over VXLAN setup with:
- one router acting as a RR (route reflector)
- three routers for VXLAN (VTEPs-VXLAN tunnel endpoints)
- three hosts connected to the routers 


