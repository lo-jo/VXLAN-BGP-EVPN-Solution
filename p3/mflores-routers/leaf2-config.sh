#!/bin/bash

sleep 2

vtysh <<-EOF
configure terminal

# VXLAN Configuration
interface vxlan1000
  vxlan local-tunnelip 192.168.0.3    # Leaf 2 VTEP IP
  vxlan id 10002                      # VNI for this Leaf
  vxlan source-interface eth1         # Physical interface connected to RR

# BGP Configuration
router bgp 65000
  bgp router-id 192.168.0.3           # Unique Router ID for Leaf 2
  neighbor 192.168.0.1 remote-as 65000  # Route Reflector IP and AS
  update-source 192.168.0.3           # Source IP for BGP

  # Enable EVPN Address Family
  address-family l2vpn evpn
    neighbor 192.168.0.1 activate     # Activate EVPN
    advertise-all-vni                 # Advertise VNIs dynamically

exit
write memory
EOF