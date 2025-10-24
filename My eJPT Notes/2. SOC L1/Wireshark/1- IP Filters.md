
### **IP Filters:**


| Filter                     | Description                                                                                                                                             |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ip`                       | Show all IP packets.                                                                                                                                    |
| `ip.addr == 10.10.10.111`  | Show all packets containing IP address 10.10.10.111.                                                                                                    |
| `ip.addr == 10.10.10.0/24` | Show all packets containing IP addresses from 10.10.10.0/24 subnet.                                                                                     |
| `ip.src == 10.10.10.111`   | Show all packets originated from 10.10.10.111                                                                                                           |
| `ip.dst == 10.10.10.111`   | Show all packets sent to 10.10.10.111                                                                                                                   |
| ip.addr vs ip.src/ip.dst   | Note: The ip.addr filters the traffic without considering the packet direction. The ip.src/ip.dst filters the packet depending on the packet direction. |
