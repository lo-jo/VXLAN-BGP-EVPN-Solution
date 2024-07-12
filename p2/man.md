## Discovering VXLAN


### Configuring hosts
give some random ip addresses
eth 1 like the diagram on the subject shows

#### host 1
ip address add 1.1.1.1/24 dev eth1

Check if ok :

#### host 2
ip address add 1.1.1.2/24 dev eth1







### Configuring routers
# Static
>> auxiliary console :
#### Router 1
Give the router and Ip address to the eth0 interface 

```
ip address add 2.1.1.1/24 dev eth0
```

##### Create VLAN 
Configure this network using a VXLAN with :
- an ID of 10
- Eth 0 like the diagram
- dst port is 4789 as per default recommendation

```
ip link add name vxlan10 type vxlan id 10 dev eth0 local 2.1.1.1 remote 2.1.1.2 dstport 4789
ip link set dev vxlan10 up
```

##### Set up bridge `br0`
``` 
ip link add br0 type bridge
ip link set dev br0 up
ip link show br0 
```

Add eth1 and vxlan10 interfaces to br0:


```
brctl addif br0 eth1
brctl addif br0 vxlan10
brctl show br0
```

Check that eth1 and vxlan10 interfaces is part of bridge br0
``` 
ip link show eth1
ip link show vxlan10
```

#### Router 2
ip address add 2.1.1.2/24 dev eth0
Give the router and Ip address to the eth0 interface 

```
ip address add 2.1.1.2/24 dev eth0
```

##### Create VLAN 
Configure this network using a VXLAN with :
- an ID of 10
- Eth 0 like the diagram
- dst port is 4789 as per default recommendation

```
ip link add name vxlan10 type vxlan id 10 dev eth0 local 2.1.1.2 remote 2.1.1.1 dstport 4789
ip link set dev vxlan10 up
```

##### Set up bridge `br0`
``` 
ip link add br0 type bridge
ip link set dev br0 up
ip link show br0 
```

Add eth1 and vxlan10 interfaces to br0:


```
brctl addif br0 eth1
brctl addif br0 vxlan10
brctl show br0
```

Check that eth1 and vxlan10 interfaces is part of bridge br0
``` 
ip link show eth1
ip link show vxlan10
```


# Dynamic