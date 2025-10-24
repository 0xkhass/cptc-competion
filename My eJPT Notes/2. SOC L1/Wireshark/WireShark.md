
# **Filters:**

### **IP Filters:**


| Filter                     | Description                                                                                                                                             |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ip`                       | Show all IP packets.                                                                                                                                    |
| `ip.addr == 10.10.10.111`  | Show all packets containing IP address 10.10.10.111.                                                                                                    |
| `ip.addr == 10.10.10.0/24` | Show all packets containing IP addresses from 10.10.10.0/24 subnet.                                                                                     |
| `ip.src == 10.10.10.111`   | Show all packets originated from 10.10.10.111                                                                                                           |
| `ip.dst == 10.10.10.111`   | Show all packets sent to 10.10.10.111                                                                                                                   |
| ip.addr vs ip.src/ip.dst   | Note: The ip.addr filters the traffic without considering the packet direction. The ip.src/ip.dst filters the packet depending on the packet direction. |

---
### **TCP and UDP Filters:**

| Filter                | Description                                     | Filter                | Expression                                      |
| --------------------- | ----------------------------------------------- | --------------------- | ----------------------------------------------- |
| `tcp.port == 80`      | Show all TCP packets with port 80               | `udp.port == 53`      | Show all UDP packets with port 53               |
| `tcp.srcport == 1234` | Show all TCP packets originating from port 1234 | `udp.srcport == 1234` | Show all UDP packets originating from port 1234 |
| `tcp.dstport == 80`   | Show all TCP packets sent to port 80            | `udp.dstport == 5353` | Show all UDP packets sent to port 5353          |

---

### **Application Level Protocol Filters | HTTP and DNS:**


| Filter                          | Description                                    | Filter                    | Description              |
| ------------------------------- | ---------------------------------------------- | ------------------------- | ------------------------ |
| `http`                          | Show all HTTP packets                          | `dns`                     | Show all DNS packets     |
| `http.response.code == 200`     | Show all packets with HTTP response code "200" | `dns.flags.response == 0` | Show all DNS requests    |
| `http.request.method == "GET"`  | Show all HTTP GET requests                     | `dns.flags.response == 1` | Show all DNS responses   |
| `http.request.method == "POST"` | Show all HTTP POST requests                    | `dns.qry.type == 1`       | Show all DNS "A" records |

---


### **Filter: "contains"**  


| Filter          | **contains**                                                                                                                                 |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| **Type**        | Comparison Operator                                                                                                                          |
| **Description** | Search a value inside packets. It is case-sensitive and provides similar functionality to the "Find" option by focusing on a specific field. |
| **Example**     | Find all "Apache" servers.                                                                                                                   |
| **Workflow**    | List all HTTP packets where packets' "server" field contains the "Apache" keyword.                                                           |
| **Usage**       | `http.server contains "Apache"`                                                                                                              |

---

### **Filter: "matches"**


| Filter      | **matches**                                                                                                   |
| ----------- | ------------------------------------------------------------------------------------------------------------- |
| Type        | Comparison Operator                                                                                           |
| Description | Search a pattern of a regular expression. It is case insensitive, and complex queries have a margin of error. |
| **Example** | Find all .php and .html pages.                                                                                |
| Workflow    | List all HTTP packets where packets' "host" fields match keywords ".php" or ".html".                          |
| **Usage**   | `http.host matches "\.(php\|html)"`                                                                           |

---

### **Filter: "in"**

| Filter      | **in**                                                                         |
| ----------- | ------------------------------------------------------------------------------ |
| Type        | Set Membership                                                                 |
| Description | Search a value or field inside of a specific scope/range.                      |
| Example     | Find all packets that use ports 80, 443 or 8080.                               |
| Workflow    | List all TCP packets where packets' "port" fields have values 80, 443 or 8080. |
| Usage       | `tcp.port in {80 443 8080}`                                                    |

### **Filter: "upper"**


| Filter      | **upper**                                                                                                  |
| ----------- | ---------------------------------------------------------------------------------------------------------- |
| Type        | Function                                                                                                   |
| Description | Convert a string value to uppercase.                                                                       |
| Example     | Find all "APACHE" servers.                                                                                 |
| Workflow    | Convert all HTTP packets' "server" fields to uppercase and list packets that contain the "APACHE" keyword. |
| Usage       | `upper(http.server) contains "APACHE"`                                                                     |

---

### **Filter: "lower"**


| Filter      | **lower**                                                                                                       |
| ----------- | --------------------------------------------------------------------------------------------------------------- |
| Type        | Function                                                                                                        |
| Description | Convert a string value to lowercase.                                                                            |
| Example     | Find all "apache" servers.                                                                                      |
| Workflow    | Convert all HTTP packets' "server" fields info to lowercase and list packets that contain the "apache" keyword. |
| **Usage**   | `lower(http.server) contains "apache"`                                                                          |

---

### **Filter: "string"**


| Filter      | **string**                                                                               |
| ----------- | ---------------------------------------------------------------------------------------- |
| Type        | Function                                                                                 |
| Description | Convert a non-string value to a string.                                                  |
| Example     | Find all frames with odd numbers.                                                        |
| Workflow    | Convert all "frame number" fields to string values, and list frames end with odd values. |
| Usage       | `string(frame.number) matches "[13579]$"`                                                |

---


# **Nmap scans filters:**

### **TCP Connect Scans**

`tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size > 1024`


### **SYN Scans**

The given filter shows the TCP SYN scan patterns in a capture file.

`tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size <= 1024`


### **UDP Scans**

The given filter shows the UDP scan patterns in a capture file.  

`icmp.type==3 and icmp.code==3`


---

# **ARP Filters:**



| **Notes**                                                                                                                                                                                                                                                      | **Wireshark filter**                                                                                                                                                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Global search                                                                                                                                                                                                                                                  | - `arp`                                                                                                                                                                                                                                                    |
| "ARP" options for grabbing the low-hanging fruits:<br><br>- Opcode 1: ARP requests.<br>- Opcode 2: ARP responses.<br><br>- **Hunt:** Arp scanning<br><br>- **Hunt:** Possible ARP poisoning detection<br><br>- **Hunt:** Possible ARP flooding from detection: | <br><br>- `arp.opcode == 1`<br>- `arp.opcode == 2`<br><br>- `arp.dst.hw_mac==00:00:00:00:00:00`<br><br>- `arp.duplicate-address-detected or arp.duplicate-address-frame`<br><br>- `((arp) && (arp.opcode == 1)) && (arp.src.hw_mac == target-mac-address)` |


---


# **DHCP Filters:**

| **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | **Wireshark Filter**                                                                                                                                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Global search.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | - `dhcp` or `bootp`                                                                                                                                                                                                                     |
| Filtering the proper DHCP packet options is vital to finding an event of interest.   <br>  <br><br>- **"DHCP Request"** packets contain the hostname information<br>- **"DHCP ACK"** packets represent the accepted requests<br>- **"DHCP NAK"** packets represent denied requests<br><br>Due to the nature of the protocol, only "Option 53" ( request type) has predefined static values. You should filter the packet type first, and then you can filter the rest of the options by "applying as column" or use the advanced filters like "contains" and "matches". | - Request: `dhcp.option.dhcp == 3`<br><br>- ACK: `dhcp.option.dhcp == 5`<br><br>- NAK: `dhcp.option.dhcp == 6`                                                                                                                          |
| **"DHCP Request"** options for grabbing the low-hanging fruits:<br><br>- **Option 12:** Hostname.<br>- **Option 50:** Requested IP address.<br>- **Option 51:** Requested IP lease time.<br>- **Option 61:** Client's MAC address.                                                                                                                                                                                                                                                                                                                                      | - `dhcp.option.hostname contains "keyword"`                                                                                                                                                                                             |
| **"DHCP ACK"** options for grabbing the low-hanging fruits:<br><br>- **Option 15:** Domain name.<br>- **Option 51:** Assigned IP lease time.                                                                                                                                                                                                                                                                                                                                                                                                                            | - `dhcp.option.domain_name contains "keyword"`                                                                                                                                                                                          |
| **"DHCP NAK"** options for grabbing the low-hanging fruits:<br><br>- **Option 56:** Message (rejection details/reason).                                                                                                                                                                                                                                                                                                                                                                                                                                                 | As the message could be unique according to the case/situation, It is suggested to read the message instead of filtering it. Thus, the analyst could create a more reliable hypothesis/result by understanding the event circumstances. |




---

# **NetBIOS Filters:**


| **Notes**                                                                                                                                                                       | **Wireshark Filter**             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| Global search.                                                                                                                                                                  | - `nbns`                         |
| "NBNS" options for grabbing the low-hanging fruits:<br><br>- **Queries:** Query details.<br>- Query details could contain **"name, Time to live (TTL) and IP address details"** | - `nbns.name contains "keyword"` |


---


# **Kerberos Analysis**  

**Kerberos** is the default authentication service for Microsoft Windows domains. It is responsible for authenticating service requests between two or more computers over the untrusted network. The ultimate aim is to prove identity securely.  

**Kerberos investigation in a nutshell:**


| **Notes**                                                                                                                                                                                                                                                                                                                                                                           | **Wireshark Filter**                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Global search.                                                                                                                                                                                                                                                                                                                                                                      | - `kerberos`                                                                                                       |
| User account search:<br><br>- **CNameString:** The username.<br><br>**Note:** Some packets could provide hostname information in this field. To avoid this confusion, filter the **"$"** value. The values end with **"$"** are hostnames, and the ones without it are user names.                                                                                                  | - `kerberos.CNameString contains "keyword"` <br>- `kerberos.CNameString and !(kerberos.CNameString contains "$" )` |
| "Kerberos" options for grabbing the low-hanging fruits:<br><br>- **pvno:** Protocol version.<br>- **realm:** Domain name for the generated ticket.  <br>    <br>- **sname:** Service and domain name for the generated ticket.<br>- **addresses:** Client IP address and NetBIOS name.  <br>    <br><br>**Note:** the "addresses" information is only available in request packets. | - `kerberos.pvno == 5`<br><br>- `kerberos.realm contains ".org"` <br><br>- `kerberos.SNameString == "krbtg"`       |



---

# **ICMP Filters:**

#### **ICMP analysis in a nutshell:**

Usually, ICMP tunnelling attacks are anomalies appearing/starting after a malware execution or vulnerability exploitation. As the ICMP packets can transfer an additional data payload, adversaries use this section to exfiltrate data and establish a C2 connection. It could be a TCP, HTTP or SSH data. As the ICMP protocols provide a great opportunity to carry extra data, it also has disadvantages. Most enterprise networks block custom packets or require administrator privileges to create custom ICMP packets.

A large volume of ICMP traffic or anomalous packet sizes are indicators of ICMP tunnelling. Still, the adversaries could create custom packets that match the regular ICMP packet size (64 bytes), so it is still cumbersome to detect these tunnelling activities. However, a security analyst should know the normal and the abnormal to spot the possible anomaly and escalate it for further analysis.

| **Notes**                                                                                                                                                                | **Wireshark filters**      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| Global search                                                                                                                                                            | - `icmp`                   |
| "ICMP" options for grabbing the low-hanging fruits:<br><br>- Packet length.<br>- ICMP destination addresses.  <br>    <br>- Encapsulated protocol signs in ICMP payload. | - `data.len > 64 and icmp` |


---

# **DNS Filters:**

#### **DNS analysis in a nutshell:**

Similar to ICMP tunnels, DNS attacks are anomalies appearing/starting after a malware execution or vulnerability exploitation. Adversary creates (or already has) a domain address and configures it as a C2 channel. The malware or the commands executed after exploitation sends DNS queries to the C2 server. However, these queries are longer than default DNS queries and crafted for subdomain addresses. Unfortunately, these subdomain addresses are not actual addresses; they are encoded commands as shown below:  

  

**"encoded-commands.maliciousdomain.com"**

  

When this query is routed to the C2 server, the server sends the actual malicious commands to the host. As the DNS queries are a natural part of the networking activity, these packets have the chance of not being detected by network perimeters. A security analyst should know how to investigate the DNS packet lengths and target addresses to spot these anomalies. 


| **Notes**                                                                                                                                                                                                                                                                                                                                                                                 | **Wireshark Filter**                       |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| Global search                                                                                                                                                                                                                                                                                                                                                                             | - `dns`                                    |
| "DNS" options for grabbing the low-hanging fruits:<br><br>- Query length.<br>- Anomalous and non-regular names in DNS addresses.<br>- Long DNS addresses with encoded subdomain addresses.<br>- Known patterns like dnscat and dns2tcp.<br>- Statistical analysis like the anomalous volume of DNS requests for a particular target.<br><br>**!mdns:** Disable local link device queries. | - `dns contains "dnscat"`<br><br>- `dns.q` |


---


# **FTP Filters:**



| **Notes**                                                                                                                                                                                                                                               | **Wireshark Filter**                                                                                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Global search                                                                                                                                                                                                                                           | - `ftp`                                                                                                                                                                                       |
| **"FTP"** options for grabbing the low-hanging fruits:<br><br>- **x1x series:** Information request responses.<br>- **x2x series:** Connection messages.<br>- **x3x series:** Authentication messages.<br><br>**Note:** "200" means command successful. | **---**                                                                                                                                                                                       |
| "x1x" series options for grabbing the low-hanging fruits:<br><br>- **211:** System status.<br>- **212:** Directory status.<br>- **213:** File status                                                                                                    | - `ftp.response.code == 211`                                                                                                                                                                  |
| "x2x" series options for grabbing the low-hanging fruits:<br><br>- **220:** Service ready.<br>- **226**: Transfer complete.<br>- **227:** Entering passive mode.<br>- **228:** Long passive mode.<br>- **229:** Extended passive mode.                  | - `ftp.response.code == 227`                                                                                                                                                                  |
| "x3x" series options for grabbing the low-hanging fruits:<br><br>- **230:** User login.<br>- **231:** User logout.<br>- **331:** Valid username.<br>- **430:** Invalid username or password<br>- **530:** No login, invalid password.                   | - `ftp.response.code == 230`                                                                                                                                                                  |
| "FTP" commands for grabbing the low-hanging fruits:<br><br>- **USER:** Username.<br>- **PASS:** Password.<br>- **CWD:** Current work directory.<br>- **LIST:** List.                                                                                    | - `ftp.request.command == "USER"`<br><br>- `ftp.request.command == "PASS"`<br><br>- `ftp.request.arg == "password"`                                                                           |
| Advanced usages examples for grabbing low-hanging fruits:<br><br>- **Bruteforce signal:** List failed login attempts.<br>- **Bruteforce signal:** List target username.<br>- **Password spray signal:** List targets for a static password.             | - `ftp.response.code == 530`<br><br>- `(ftp.response.code == 530) and (ftp.response.arg contains "username")`<br><br>- `(ftp.request.command == "PASS" ) and (ftp.request.arg == "password")` |



---



# HTTP Filters:


Following attacks could be detected with the help of HTTP analysis:

  

- Phishing pages
- Web attacks
- Data exfiltration
- Command and control traffic (C2)

HTTP analysis in a nutshell:

|   |   |
|---|---|
|**Notes**|**Wireshark Filter**|
|Global search<br><br>**Note:** HTTP2 is a revision of the HTTP protocol for better performance and security. It supports binary data transfer and request&response multiplexing.|- `http`<br><br>- `http2`|
|"HTTP **Request Methods"** for grabbing the low-hanging fruits:<br><br>- GET<br>- POST<br>- Request: Listing all requests|- `http.request.method == "GET"`<br><br>- `http.request.method == "POST"`<br><br>- `http.request`|
|"HTTP Response Status Codes" for grabbing the low-hanging fruits:<br><br>- **200 OK:** Request successful.<br>- **301 Moved Permanently:** Resource is moved to a new URL/path (permanently).<br>- **302 Moved Temporarily:** Resource is moved to a new URL/path (temporarily).<br>- **400 Bad Request:** Server didn't understand the request.<br>- **401 Unauthorised:** URL needs authorisation (login, etc.).<br>- **403 Forbidden:** No access to the requested URL. <br>- **404 Not Found:** Server can't find the requested URL.<br>- **405 Method Not Allowed:** Used method is not suitable or blocked.<br>- **408 Request Timeout:**  Request look longer than server wait time.<br>- **500 Internal Server Error:** Request not completed, unexpected error.<br>- **503 Service Unavailable:** Request not completed server or service is down.|- `http.response.code == 200`<br><br>- `http.response.code == 401`<br><br>- `http.response.code == 403`<br><br>- `http.response.code == 404`<br><br>- `http.response.code == 405`<br><br>- `http.response.code == 503`|
|"HTTP Parameters" for grabbing the low-hanging fruits:<br><br>- **User agent:** Browser and operating system identification to a web server application.<br>- **Request URI:** Points the requested resource from the server.  <br>    <br>- **Full *URI:** Complete URI information.<br><br>***URI:** Uniform Resource Identifier.|- `http.user_agent contains "nmap"`<br><br>- `http.request.uri contains "admin"`<br><br>- `http.request.full_uri contains "admin"`|
|"HTTP Parameters" for grabbing the low-hanging fruits:<br><br>- **Server:** Server service name.  <br>    <br>- **Host:** Hostname of the server<br>- **Connection:** Connection status.  <br>    <br>- **Line-based text data:** Cleartext data provided by the server.<br>- **HTML Form URL Encoded:** Web form information.|- `http.server contains "apache"`<br><br>- `http.host contains "keyword"`<br><br>- `http.host == "keyword"`<br><br>- `http.connection == "Keep-Alive"`<br><br>- `data-text-lines contains "keyword"`|
