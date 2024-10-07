#!/bin/bash

sleep 2

vtysh <<-EOF
configure terminal

# BGP Configuration
router bgp 65000
  bgp router-id 1.1.1.1           # RR's router ID
  neighbor 192.168.0.2 remote-as 65000
  neighbor 192.168.0.3 remote-as 65000
  neighbor 192.168.0.4 remote-as 65000

  # Enable EVPN Address Family
  address-family l2vpn evpn
    neighbor 192.168.0.2 activate
    neighbor 192.168.0.3 activate
    neighbor 192.168.0.4 activate

    # Route Reflector Configuration
    neighbor 192.168.0.2 route-reflector-client
    neighbor 192.168.0.3 route-reflector-client
    neighbor 192.168.0.4 route-reflector-client

exit
write memory
EOF
