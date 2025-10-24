

# **Nmap scans filters:**

### **TCP Connect Scans**

`tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size > 1024`


### **SYN Scans**

The given filter shows the TCP SYN scan patterns in a capture file.

`tcp.flags.syn==1 and tcp.flags.ack==0 and tcp.window_size <= 1024`


### **UDP Scans**

The given filter shows the UDP scan patterns in a capture file.  

`icmp.type==3 and icmp.code==3`