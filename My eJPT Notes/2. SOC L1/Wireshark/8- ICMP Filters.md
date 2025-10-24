

# **ICMP Filters:**

#### **ICMP analysis in a nutshell:**

Usually, ICMP tunnelling attacks are anomalies appearing/starting after a malware execution or vulnerability exploitation. As the ICMP packets can transfer an additional data payload, adversaries use this section to exfiltrate data and establish a C2 connection. It could be a TCP, HTTP or SSH data. As the ICMP protocols provide a great opportunity to carry extra data, it also has disadvantages. Most enterprise networks block custom packets or require administrator privileges to create custom ICMP packets.

A large volume of ICMP traffic or anomalous packet sizes are indicators of ICMP tunnelling. Still, the adversaries could create custom packets that match the regular ICMP packet size (64 bytes), so it is still cumbersome to detect these tunnelling activities. However, a security analyst should know the normal and the abnormal to spot the possible anomaly and escalate it for further analysis.

| **Notes**                                                                                                                                                                | **Wireshark filters**      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| Global search                                                                                                                                                            | - `icmp`                   |
| "ICMP" options for grabbing the low-hanging fruits:<br><br>- Packet length.<br>- ICMP destination addresses.  <br>    <br>- Encapsulated protocol signs in ICMP payload. | - `data.len > 64 and icmp` |
