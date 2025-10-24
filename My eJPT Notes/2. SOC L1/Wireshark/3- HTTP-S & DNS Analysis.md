
# **Application Level Protocol Filters:**

## **1. HTTP**

| Filter                          | Description                                    |
| ------------------------------- | ---------------------------------------------- |
| `http`                          | Show all HTTP packets                          |
| `http.response.code == 200`     | Show all packets with HTTP response code "200" |
| `http.request.method == "GET"`  | Show all HTTP GET requests                     |
| `http.request.method == "POST"` | Show all HTTP POST requests                    |


### **<mark style="background: #ED7506;">HTTP Filters:</mark>**


Following attacks could be detected with the help of HTTP analysis:

  

- Phishing pages
- Web attacks
- Data exfiltration
- Command and control traffic (C2)

HTTP analysis in a nutshell:


| **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | **Wireshark Filter**                                                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Global search<br><br>**Note:** HTTP2 is a revision of the HTTP protocol for better performance and security. It supports binary data transfer and request&response multiplexing.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | - `http`<br><br>- `http2`                                                                                                                                                                                              |
| "HTTP **Request Methods"** for grabbing the low-hanging fruits:<br><br>- GET<br>- POST<br>- Request: Listing all requests                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | - `http.request.method == "GET"`<br><br>- `http.request.method == "POST"`<br><br>- `http.request`                                                                                                                      |
| "HTTP Response Status Codes" for grabbing the low-hanging fruits:<br><br>- **200 OK:** Request successful.<br>- **301 Moved Permanently:** Resource is moved to a new URL/path (permanently).<br>- **302 Moved Temporarily:** Resource is moved to a new URL/path (temporarily).<br>- **400 Bad Request:** Server didn't understand the request.<br>- **401 Unauthorised:** URL needs authorisation (login, etc.).<br>- **403 Forbidden:** No access to the requested URL. <br>- **404 Not Found:** Server can't find the requested URL.<br>- **405 Method Not Allowed:** Used method is not suitable or blocked.<br>- **408 Request Timeout:**  Request look longer than server wait time.<br>- **500 Internal Server Error:** Request not completed, unexpected error.<br>- **503 Service Unavailable:** Request not completed server or service is down. | - `http.response.code == 200`<br><br>- `http.response.code == 401`<br><br>- `http.response.code == 403`<br><br>- `http.response.code == 404`<br><br>- `http.response.code == 405`<br><br>- `http.response.code == 503` |
| "HTTP Parameters" for grabbing the low-hanging fruits:<br><br>- **User agent:** Browser and operating system identification to a web server application.<br>- **Request URI:** Points the requested resource from the server.  <br>    <br>- **Full *URI:** Complete URI information.<br><br>***URI:** Uniform Resource Identifier.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | - `http.user_agent contains "nmap"`<br><br>- `http.request.uri contains "admin"`<br><br>- `http.request.full_uri contains "admin"`                                                                                     |
| "HTTP Parameters" for grabbing the low-hanging fruits:<br><br>- **Server:** Server service name.  <br>    <br>- **Host:** Hostname of the server<br>- **Connection:** Connection status.  <br>    <br>- **Line-based text data:** Cleartext data provided by the server.<br>- **HTML Form URL Encoded:** Web form information.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | - `http.server contains "apache"`<br><br>- `http.host contains "keyword"`<br><br>- `http.host == "keyword"`<br><br>- `http.connection == "Keep-Alive"`<br><br>- `data-text-lines contains "keyword"`                   |


### **<mark style="background: #FF5582A6;">User Agent Analysis</mark>**   

As the adversaries use sophisticated technics to accomplish attacks, they try to leave traces similar to natural traffic through the known and trusted protocols. For a security analyst, it is important to spot the anomaly signs on the bits and pieces of the packets. The "user-agent" field is one of the great resources for spotting anomalies in HTTP traffic. In some cases, adversaries successfully modify the user-agent data, which could look super natural. A security analyst cannot rely only on the user-agent field to spot an anomaly. Never whitelist a user agent, even if it looks natural. User agent-based anomaly/threat detection/hunting is an additional data source to check and is useful when there is an obvious anomaly. If you are unsure about a value, you can conduct a web search to validate your findings with the default and normal user-agent info ([**example site**](https://developers.whatismybrowser.com/useragents/explore/)).

  

User Agent analysis in a nutshell:  


| **Notes**                                                                                                                                                                                                                                                                                                                                                                                                            | **Wireshark Filter**                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Global search.                                                                                                                                                                                                                                                                                                                                                                                                       | - `http.user_agent`                                                                                                                 |
| Research outcomes for grabbing the low-hanging fruits:<br><br>- Different user agent information from the same host in a short time notice.<br>- Non-standard and custom user agent info.<br>- Subtle spelling differences. **("Mozilla" is not the same as  "Mozlilla" or "Mozlila")**<br>- Audit tools info like Nmap, Nikto, Wfuzz and sqlmap in the user agent field.<br>- Payload data in the user agent field. | - `(http.user_agent contains "sqlmap") or (http.user_agent contains "Nmap") or (http.user_agent contains "Wfuzz") or (http.user_ag` |

### **<mark style="background: #e74c3c;">Log4j Analysis</mark>**   

A proper investigation starts with prior research on threats and anomalies going to be hunted. Let's review the knowns on the "Log4j" attack before launching Wireshark.  
  

Log4j vulnerability analysis in a nutshell:  

| **Notes**                                                                                                                                                                                     | **Wireshark Filters**                                                                                                                                                                                                                |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Research outcomes** for grabbing the low-hanging fruits:<br><br>- The attack starts with a "POST" request<br>- There are known cleartext patterns: "**jndi:ldap**" and "**Exploit.class**". | `http.request.method == "POST"`<br><br>`(ip contains "jndi") or ( ip contains "Exploit")`<br><br>`(frame contains "jndi") or ( frame contains "Exploit")`<br><br>`(http.user_agent contains "$") or (http.user_agent contains "==")` |

---







---




## **2. HTTPS**

Additional information for HTTPS :  


| Notes                                                                                                                                                                                                                                                                                                                                                        | Wireshark Filter                                                                                                      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| "HTTPS Parameters" for grabbing the low-hanging fruits:<br><br>- **Request:** Listing all requests  <br>    <br>- **TLS:** Global TLS search<br>- TLS Client Request<br>- TLS Server response<br>- Local Simple Service Discovery Protocol (SSDP)<br><br>**Note:** SSDP is a network protocol that provides advertisement and discovery of network services. | - `http.request`<br><br>- `tls`<br><br>- `tls.handshake.type == 1`<br><br>- `tls.handshake.type == 2`<br><br>- `ssdp` |


Similar to the TCP three-way handshake process, the TLS protocol has its handshake process. The first two steps contain "Client Hello" and "Server Hello" messages. The given filters show the initial hello packets in a capture file. These filters are helpful to spot which IP addresses are involved in the TLS handshake.  

- Client Hello: `(http.request or tls.handshake.type == 1) and !(ssdp)` 
- Server Hello: `(http.request or tls.handshake.type == 2) and !(ssdp)`

![[Pasted image 20250708144650.png | 800]]


####  ⬇️⬇️⬇️⬇️

#### Choosing the **KeyLogFile:**

![[Pasted image 20250708144738.png ]]



The above image shows that the traffic details are visible after using the key log file. Note that the packet details and bytes pane provides the data in different formats for investigation. Decompressed header info and HTTP2 packet details are available after decrypting the traffic. Depending on the packet details, you can also have the following data formats:

- Frame
- Decrypted TLS
- Decompressed Header
- Reassembled TCP
- Reassembled SSL

Detecting suspicious activities in chunked files is easy and a great way to learn how to focus on the details.


---

## **3. DNS**

#### **DNS analysis in a nutshell:**

Similar to ICMP tunnels, DNS attacks are anomalies appearing/starting after a malware execution or vulnerability exploitation. Adversary creates (or already has) a domain address and configures it as a C2 channel. The malware or the commands executed after exploitation sends DNS queries to the C2 server. However, these queries are longer than default DNS queries and crafted for subdomain addresses. Unfortunately, these subdomain addresses are not actual addresses; they are encoded commands as shown below:  

  

> **"encoded-commands.maliciousdomain.com"**

  

When this query is routed to the C2 server, the server sends the actual malicious commands to the host. As the DNS queries are a natural part of the networking activity, these packets have the chance of not being detected by network perimeters. A security analyst should know how to investigate the DNS packet lengths and target addresses to spot these anomalies. 


| **Notes**                                                                                                                                                                                                                                                                                                                                                                                 | **Wireshark Filter**                                                      |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| Global search                                                                                                                                                                                                                                                                                                                                                                             | - `dns`                                                                   |
| "DNS" options for grabbing the low-hanging fruits:<br><br>- Query length.<br>- Anomalous and non-regular names in DNS addresses.<br>- Long DNS addresses with encoded subdomain addresses.<br>- Known patterns like dnscat and dns2tcp.<br>- Statistical analysis like the anomalous volume of DNS requests for a particular target.<br><br>**!mdns:** Disable local link device queries. | - `dns contains "dnscat"`<br><br>- `dns.q`<br><br><br>- `dns.a` shows IPs |
| Filter                                                                                                                                                                                                                                                                                                                                                                                    | Description                                                               |
| `dns`                                                                                                                                                                                                                                                                                                                                                                                     | Show all DNS packets                                                      |
| `dns.flags.response == 0`                                                                                                                                                                                                                                                                                                                                                                 | Show all DNS requests                                                     |
| `dns.flags.response == 1`                                                                                                                                                                                                                                                                                                                                                                 | Show all DNS responses                                                    |
| `dns.qry.type == 1`                                                                                                                                                                                                                                                                                                                                                                       | Show all DNS "A" records                                                  |
