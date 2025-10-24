
#  For #Host_discovery:

| Switch | Description                                                                                                                                                                                                                                                                         |
| ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-sn`  | For no port scanning, only ping scan for host discovery consists of :  ICMP echo requests, **TCP SYN, TCP ACK, ICMP** timestamp request, ( and will run only **ARP** scan if you are connected physically to that particular network and can override **that by using --send-ip** ) |
| `-PS`  | **<mark style="background: #4A707A;">TCP SYN</mark> stealth scan** for host discovery, **use with -sn**. We can send this packet to specific ports like this: `-PS22` or `-PS1-1000`                                                                                                |
| `-PA`  | **<mark style="background: #4A707A;">TCP ACK </mark>scan** **use with -sn to override all other host discovery techniques**                                                                                                                                                         |
| `-PU`  | **<mark style="background: #88B04B;">UDP scan</mark> for host discovery, use with -sn**                                                                                                                                                                                             |
| `-PE`  | **ICMP echo requests**  **use with -sn to override all other host discovery techniques and maybe you need to specify --send-ip** <mark style="background: #5E4B56;">BASICLY A PING SCAN</mark>                                                                                      |



---

# For #port_scan :

| Switch               | Description                                                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `-Pn`                | Skip host discovery <mark style="background: #6B5B95;">"Treats all hosts as Online"</mark>                                                             |
| `-p-`                | scan all ports                                                                                                                                         |
| `-p1-1000`           | scan ports in range 1-1000                                                                                                                             |
| `-F`                 | fast scan for 100 common ports                                                                                                                         |
| `-sT`                | <mark style="background: #4A707A;">TCP Connect Scan</mark> (Default) Establishes a 3 Way Handshake.                                                    |
| `-sS`                | <mark style="background: #4A707A;">TCP SYN</mark> stealth port scan (Sends SYN packet and after receiving SYN/ACK sends a RST packet)                  |
| `-sA`                | <mark style="background: #4A707A;">TCP ACK</mark> port scan <mark style="background: #FFB86CA6;">to check for firewall presence</mark> ( very useful ) |
| `-sU`                | <mark style="background: #88B04B;">UDP port</mark> scan                                                                                                |
| `-sN`                | TCP null scan # good for firewall evasion                                                                                                              |
| `-sF`                | TCP FIN scan # good for firewall evasion                                                                                                               |
| `-sX `( Xmas scan )  | send a malformed TCP packet   # good for firewall evasion                                                                                              |
| `--top-ports <num> ` | self explaintory                                                                                                                                       |


---
# **For #Services & #OS_detection & #NSE:**

| Switch                           | Description                                                                                                                                                                                                    |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-sV`                            | Service version detection scan. If not work use: `nc <target_IP> <service_port>`                                                                                                                               |
| `--version-intensity <level>`    | Service version detection scan                                                                                                                                                                                 |
| `-sC`                            | Script scan                                                                                                                                                                                                    |
| `--script help=script_file_name` | gives info about a particular script                                                                                                                                                                           |
| `--script=script_file_name`      | Execute a particular script, tip: use wild card `*` to use all the scripts of certain category like ftp*   <mark style="background: #5E4B56;">we can choose a script without giving the .nse extension.</mark> |
| `--script-args`                  | you can pass the arguments in this way : `--script-args= <script arg>=<arg value>`                                                                                                                             |
| `-O`                             | OS detection. Must use with any Port scanning switch: uch as -sS, -sT, -sF, etc instead of -sn.                                                                                                                |
| `--osscan-guess`                 | Guess OS more aggressively                                                                                                                                                                                     |
| `-A`                             | runs -sV -sC -O, named as aggerssive scan                                                                                                                                                                      |
| `<service>-brute`                | For Bruteforcing given service. Usage: `nmap --script=<servic>-brute <ip>`                                                                                                                                     |
- All scripts are located here: **/usr/share/nmap/scripts** : for NSE files
>This searches for nmap scripts to use for a given service:👇

		ls -la /usr/share/nmap/scripts/ | grep -e "smb-*"


- To search for scripts related to a specific service:
`ls -la /usr/share/nmap/scripts/ | grep -e "mongodb"`
![[nmap scripts seach.png]]

---

# **For Firewall Detection & IDS Evasion :**
MTU: Stands for Maximum Transmitted Unit 
and it's optional
`-f` : designed for firewall evasion by splitting large packets into smaller fragments

| Switch                   | Description                                                                                           | Purpose                                                                                                                                                                                                 |
| ------------------------ | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-f --mtu <number>`      | for packet fragmentation.  --mtu is optional                                                          |                                                                                                                                                                                                         |
| `--data-length <number>` | Adds random data to the packets sent by Nmap, increasing their size to the specified number of bytes. | Used to evade simple packet filtering or detection mechanisms that might be triggered by default packet sizes. Also tests how a target handles unusual packet sizes.                                    |
| `-D <ip>`                | Specify a decoy or fake IP for the scan.                                                              | We can add multiple IPs. Example: 192.168.0.1 to act as a router.                                                                                                                                       |
| `--badsum`               | Sends packets with invalid TCP/UDP checksums to the target.                                           | Used to detect firewalls or IDS that <mark style="background: #4A707A;">do not validate checksums properly.</mark> which <mark style="background: #6B5B95;">reveal the presence of such devices.</mark> |
| `-g <source port>`       | specify a source port                                                                                 |                                                                                                                                                                                                         |


---

# **Timing and performance :**

| Switch                          | Description                                                                                     | Purpose                                                                                                                     |
| ------------------------------- | ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `--host-timeout <sec,min,hour>` | Speeds up scans by limiting time spent on unresponsive hosts.                                   | Prevents Nmap from getting stuck on a single host and speeds up the overall scan. Example: <br>`--host-timeout 10m30s` <br> |
| `--scan-delay <ms,sec>`         | adjust delay between probes                                                                     | ***good for stealth or if you're afraid to perform a DOS attack on the target***😂                                          |
| `-T #`                          | timing option, the less is it; the slower and sneaky it where # refers to a number in range 1-5 | same as previous switch.                                                                                                    |
| `-n`                            | disables DNS resolution.                                                                        | Saves time.                                                                                                                 |

* **0 paranoid | 1 sneaky | 2 polite | 3 normal | 4 aggresive | 5 insane**

---

# **Output Options :** 

| Switch                           | Description                                                                     |                      |
| -------------------------------- | ------------------------------------------------------------------------------- | -------------------- |
| `-oN`<br>`-oX`<br>`-oG`<br>`-oA` | normal output<br>XML output<br>Grepable format<br>Combine the 3 formats at once | <br>To import to MSF |
|                                  |                                                                                 |                      |
| `-iL`                            | Input file of list of hosts/networks                                            |                      |
