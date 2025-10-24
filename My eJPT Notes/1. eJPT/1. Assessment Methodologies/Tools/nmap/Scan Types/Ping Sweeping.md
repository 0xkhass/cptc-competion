A Ping Sweep is a network scanning technique used to discover live hosts within a specific IP address range on a network.
1-Works by sending ore or more specially crafted ICMP packet (Type 8 - echo request) to a host.
2- if the destination host replies with an ICMP echo reply (Type 0) packet, then the host is alive/online.
in the context of ICMP (Internet Control Message Protocol), the ICMP Echo Request and Echo Reply messages are used for the purpose of ping. These messages have specific ICMP type and code values associated with them

* The thing about ping is by default Windows systems Block Ping Echo Request so we need to use other techniques as well to discover Windows systems.

nmap command:
- `nmap -sn 192.168.1.14`
