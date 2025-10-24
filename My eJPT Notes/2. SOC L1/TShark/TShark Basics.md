

## **Command line tools:**

| **Tool/Utility** | **Purpose and Benefit**                                                                                                                                |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **capinfos**     | A program that provides details of a specified capture file. It is suggested to view the summary of the capture file before starting an investigation. |
| **grep**         | Helps search plain-text data.                                                                                                                          |
| **cut**          | Helps cut parts of lines from a specified data source.                                                                                                 |
| **uniq**         | Filters repeated lines/values.                                                                                                                         |
| **nl**           | Views the number of shown lines.                                                                                                                       |
| **sed**          | A stream editor.                                                                                                                                       |
| **awk**          | Scripting language that helps pattern search and processing.                                                                                           |


---

## **TShark Parameters:**


| **Parameter**    | **Purpose**                                                                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| -h               | - Display the help page with the most common features.<br>- `tshark -h`                                                                                           |
| -v               | - Show version info.<br>- `tshark -v`                                                                                                                             |
| -D               | - List available sniffing interfaces.<br>- `tshark -D`                                                                                                            |
| -i               | - Choose an interface to capture live traffic.<br>- `tshark -i 1`<br>- `tshark -i ens55`                                                                          |
| **No Parameter** | - Sniff the traffic like tcpdump.<br>- `tshark`                                                                                                                   |
| -r               | - Read/input function. Read a capture file.<br>- `tshark -r demo.pcapng`                                                                                          |
| -c               | - Packet count. Stop after capturing a specified number of packets.<br>- E.g. stop after capturing/filtering/reading 10 packets.<br>- `tshark -c 10`              |
| -w               | - Write/output function. Write the sniffed traffic to a file.<br>- `tshark -w sample-capture.pcap`                                                                |
| -V               | - Verbose.<br>- Provide detailed information **for each packet**. This option will provide details similar to Wireshark's "Packet Details Pane".<br>- `tshark -V` |
| -q               | - Silent mode.<br>- Suspress the packet outputs on the terminal.<br>- `tshark -q`                                                                                 |
| -x               | - Display packet bytes.<br>- Show packet details in hex and ASCII dump for each packet.<br>- `tshark -x`                                                          |


---

## **Capture Condition Parameters**

As a network sniffer and packet analyser, TShark can be configured to count packets and stop at a specific point or run in a loop structure. The most common parameters are explained below.


| **Parameter** | **Purpose**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Autostop      | Define capture conditions for a single run/loop. STOP after completing the condition. Also known as "Autostop".                                                                                                                                                                                                                                                                                                                                                                                                      |
| -a            | - **Duration:** Sniff the traffic and stop after X seconds. Create a new file and write output to it.  <br>    <br><br>- `tshark -w test.pcap -a duration:1`<br><br>- **Filesize:** Define the maximum capture file size. Stop after reaching X file size (KB).<br><br>- `tshark -w test.pcap -a filesize:10`<br><br>- **Files:** Define the maximum number of output files. Stop after X files.<br><br>- `tshark -w test.pcap -a filesize:10 -a files:3`                                                            |
| INFINITE LOOP | Ring buffer control options. Define capture conditions for multiple runs/loops. (INFINITE LOOP).                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -b            | - **Duration:** Sniff the traffic for X seconds, create a new file and write output to it.   <br>    <br><br>- `tshark -w test.pcap -b duration:1`<br><br>- **Filesize:** Define the maximum capture file size. Create a new file and write output to it after reaching filesize X (KB).<br><br>- `tshark -w test.pcap -b filesize:10`<br><br>- **Files:** Define the maximum number of output files. Rewrite the first/oldest file after creating X files.<br><br>- `tshark -w test.pcap -b filesize:10 -b files:3` |


---

## **Capture & Display Filters**


| **Capture Filters** | Live filtering options. The purpose is to **save** only a specific part of the traffic. It is set before capturing traffic and is not changeable during live capture. |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Display Filters** | Post-capture filtering options. The purpose is to investigate packets by **reducing the number of visible packets**, which is changeable during the investigation.    |


| **Parameter** | **Purpose**                                                          |
| ------------- | -------------------------------------------------------------------- |
| -f            | Capture filters. Same as BPF syntax and Wireshark's capture filters. |
| -Y            | Display filters. Same as **Wireshark's display filters.**            |

###  **Capture Filters**  

Wireshark's capture filter syntax is used here. The basic syntax for the Capture/BPF filter is shown below. You can read more on capture filter syntax [here](https://www.wireshark.org/docs/man-pages/pcap-filter.html) and [here](https://gitlab.com/wireshark/wireshark/-/wikis/CaptureFilters#useful-filters). Boolean operators can also be used in both types of filters. 


| **Qualifier** | **Details and Available Options**                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Type**      | Target match type. You can filter IP addresses, hostnames, IP ranges, and port numbers. Note that if you don't set a qualifier, the "host" qualifier will be used by default.<br><br>- host \| net \| port \| portrange<br>- Filtering a host<br><br>- `tshark -f "host 10.10.10.10"`<br><br>- Filtering a network range <br><br>- `tshark -f "net 10.10.10.0/24"`<br><br>- Filtering a Port<br><br>- `tshark -f "port 80"`<br><br>- Filtering a port range<br><br>- `tshark -f "portrange 80-100"` |
| **Direction** | Target direction/flow. Note that if you don't use the direction operator, it will be equal to "either" and cover both directions.<br><br>- src \| dst<br>- Filtering source address<br><br>- `tshark -f "src host 10.10.10.10"`<br><br>- Filtering destination address<br><br>- `tshark -f "dst host 10.10.10.10"`                                                                                                                                                                                  |
| **Protocol**  | Target protocol.<br><br>- arp \| ether \| icmp \| ip \| ip6 \| tcp \| udp<br>- Filtering TCP<br><br>- `tshark -f "tcp"`<br><br>- Filtering MAC address<br><br>- `tshark -f "ether host F8:DB:C5:A2:5D:81"`<br><br>- You can also filter protocols with IP Protocol numbers assigned by IANA.<br>- Filtering IP Protocols 1 (ICMP)<br><br>- `tshark -f "ip proto 1"`<br>- [**Assigned Internet Protocol Numbers**](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)         |




| **Capture Filter Category** | **Details**                                                                                                                                                                                                                                                                                                                                                                          |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Host Filtering**          | Capturing traffic to or from a specific host.<br><br>- Traffic generation with cURL. This command sends a default HTTP query to a specified address.<br><br>- `curl tryhackme.com`<br><br>- TShark capture filter for a host<br><br>- `tshark -f "host tryhackme.com"`                                                                                                               |
| **IP Filtering**            | Capturing traffic to or from a specific port. We will use the Netcat tool to create noise on specific ports.<br><br>- Traffic generation with Netcat. Here Netcat is instructed to provide details (verbosity), and timeout is set to 5 seconds.<br><br>- `nc 10.10.10.10 4444 -vw 5`<br><br>- TShark capture filter for specific IP address<br><br>- `tshark -f "host 10.10.10.10"` |
| **Port Filtering**          | Capturing traffic to or from a specific port. We will use the Netcat tool to create noise on specific ports.<br><br>- Traffic generation with Netcat. Here Netcat is instructed to provide details (verbosity), and timeout is set to 5 seconds.<br><br>- `nc 10.10.10.10 4444 -vw 5`<br><br>- TShark capture filter for port 4444<br><br>- `tshark -f "port 4444"`                  |
| **Protocol Filtering**      | Capturing traffic to or from a specific protocol. We will use the Netcat tool to create noise on specific ports.<br><br>- Traffic generation with Netcat. Here Netcat is instructed to use UDP, provide details (verbosity), and timeout is set to 5 seconds.<br><br>- `nc -u 10.10.10.10 4444 -vw 5`<br><br>- TShark capture filter for<br><br>- `tshark -f "udp"`                  |

### **Display Filters:**

Wireshark's display filter syntax is used here. You can use the official [**Display Filter Reference**](https://www.wireshark.org/docs/dfref/) to find the protocol breakdown for filtering. Additionally, you can use Wireshark's build-in "Display Filter Expression" menu to break down protocols for filters. Note that Boolean operators can also be used in both types of filters. Common filtering options are shown in the given table below.

**Note:** Using single quotes for capture filters is recommended to avoid space and bash expansion problems. Once again, you can check the [Wireshark: Packet Operations](https://tryhackme.com/room/wiresharkpacketoperations) room (Task 4 & 5) if you want to review the principles of packet filtering.


| **Display Filter Category** | **Details and Available Options**                                                                                                                                                                                                                                                                                                                          |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Protocol: IP**            | - Filtering an IP without specifying a direction.  <br>    <br><br>- `tshark -Y 'ip.addr == 10.10.10.10'`<br><br>- Filtering a network range <br><br>- `tshark -Y 'ip.addr == 10.10.10.0/24'`<br><br>- Filtering a source IP<br><br>- `tshark -Y 'ip.src == 10.10.10.10'`<br><br>- Filtering a destination IP<br><br>- `tshark -Y 'ip.dst == 10.10.10.10'` |
| **Protocol: TCP**           | - Filtering TCP port  <br>    <br><br>- `tshark -Y 'tcp.port == 80'`<br><br>- Filtering source TCP port<br><br>- `tshark -Y 'tcp.srcport == 80'`                                                                                                                                                                                                           |
| **Protocol: HTTP**          | - Filtering HTTP packets  <br>    <br><br>- `tshark -Y 'http'`<br><br>- Filtering HTTP packets with response code "200"<br><br>- `tshark -Y "http.response.code == 200"`                                                                                                                                                                                   |
| **Protocol: DNS**           | - Filtering DNS packets  <br>    <br><br>- `tshark -Y 'dns'`<br><br>- Filtering all DNS "A" packets<br><br>- `tshark -Y 'dns.qry.type == 1'`                                                                                                                                                                                                               |




---


