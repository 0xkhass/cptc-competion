

# **ARP Filters:**



| **Notes**                                                                                                                                                                                                                                                      | **Wireshark filter**                                                                                                                                                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Global search                                                                                                                                                                                                                                                  | - `arp`                                                                                                                                                                                                                                                    |
| "ARP" options for grabbing the low-hanging fruits:<br><br>- Opcode 1: ARP requests.<br>- Opcode 2: ARP responses.<br><br>- **Hunt:** Arp scanning<br><br>- **Hunt:** Possible ARP poisoning detection<br><br>- **Hunt:** Possible ARP flooding from detection: | <br><br>- `arp.opcode == 1`<br>- `arp.opcode == 2`<br><br>- `arp.dst.hw_mac==00:00:00:00:00:00`<br><br>- `arp.duplicate-address-detected or arp.duplicate-address-frame`<br><br>- `((arp) && (arp.opcode == 1)) && (arp.src.hw_mac == target-mac-address)` |

