

### **DNS records**

- **A** - Resolve hostname to IPv4
- **AAAA** - Resolves hostname to IPv6
- **NS** - Ref. to domain name server
- **MX** - Resolves domain to mail server
- **CNAME** - Used for domain aliases
- **TXT** - Text records
- **HINFO** - Host info
- **SOA** - Domain authority
- **SRV** - Services records
- **PTR** - Resolve ip to hostname
    

~# _**dig**_ _**axfr @NS**_ -> for zone transfers

~# _**dnsenum**_ -> for enumerating dns records and zone transfers  

~# _**dirb**_  -> Scan the web server (`http://192.168.1.224/`) for directories using a dictionary file 
	        (`/usr/share/wordlists/dirb/common.txt`)

~# ***dirb buster*** -> GUI tool prebuilt in Kali very usefull.

---

**TCP 3-way Handshake**

1. **SYN**
2. **SYN-ACK**
3. **ACK**
    
    **SYN** : stands for synchronize
    
    **ACK**: stands for acknowledgement
    
    ![[Active recon_TCP 3 way handsha.jpg]]
    

* If the response from the server is RST, then the server is probably down unless there's a firewall blocking.

---

# ** #Host_discovery techniques**

- **Ping sweeps (ICMP echo requests) -** ==Can be easily detected==
- **ARP Scanning (Using ARP protocol) -** ==Only works in local network==

- **TCP SYN ping (Half-open scan)** _In nmap known as ==***stealth scan***== 
  -_ Some hosts may not respond, so you might need to change the port - 
  It work as the following: 
    
    - nmap sends a **SYN** packet to host
    
    - Host reply with **SYN-ACK**
    
    - nmap reply with **==RST packet==**
    
- **TCP ACK Ping** **-** It work as the following :
    
    - nmap sends a **ACK packet**
    
    - if host reply with **RST** ==> then it is ==alive==
    
- **TCP SYN-ACK Ping**
    
    - nmap sends a **SYN-ACK**
    
    - if host reply with **RST** ==> then it is ==alive
    

- **UDP ping** **-** Can be effective for hosts that don't respond to **ICMP** or **TCP** probes

**fping -a -g** 

is a great alternative of the standard ping command because we can ping a subnet in a more easy way

---

**Port scan techniques**

* **If you run nmap with no root privileges it will run as default a normal TCP connection scan,**

* **but if you run it as root it will run as default a TCP SYN stealth scan**

* **#** **Cool trick : if the port is filtered then the firewall is up, if it is closed then there is no firewall active or there is no specific rules for this port**


---