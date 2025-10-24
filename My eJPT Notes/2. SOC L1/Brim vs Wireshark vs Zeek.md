
---
# **Brim vs Wireshark vs Zeek**

While each of them is powerful and useful, it is good to know the strengths and weaknesses of each tool and which one to use for the best outcome. As a traffic capture analyser, some overlapping functionalities exist, but each one has a unique value for different situations.

The common best practice is handling medium-sized pcaps with Wireshark, creating logs and correlating events with Zeek, and processing multiple logs in Brim.  


|                          | Brim                                                 | Wireshark                                                           | Zeek                                                 |
| ------------------------ | ---------------------------------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------- |
| Purpose                  | Pcap processing; event/stream and log investigation. | Traffic sniffing. Pcap processing; packet and stream investigation. | Pcap processing; event/stream and log investigation. |
| GUI                      | ✔                                                    | ✔                                                                   | ✖                                                    |
| Sniffing                 | ✖                                                    | ✔                                                                   | ✔                                                    |
| Pcap processing          | ✔                                                    | ✔                                                                   | ✔                                                    |
| Log processing           | ✔                                                    | ✖                                                                   | ✔                                                    |
| Packet decoding          | ✖                                                    | ✔                                                                   | ✔                                                    |
| Filtering                | ✔                                                    | ✔                                                                   | ✔                                                    |
| Scripting                | ✖                                                    | ✖                                                                   | ✔                                                    |
| Signature Support        | ✔                                                    | ✖                                                                   | ✔                                                    |
| Statistics               | ✔                                                    | ✔                                                                   | ✔                                                    |
| File Extraction          | ✖                                                    | ✔                                                                   | ✔                                                    |
| Handling  pcaps over 1GB | Medium performance                                   | Low performance                                                     | Good performance                                     |
| Ease of Management       | 4/5                                                  | 4/5                                                                 | 3/5                                                  |

---