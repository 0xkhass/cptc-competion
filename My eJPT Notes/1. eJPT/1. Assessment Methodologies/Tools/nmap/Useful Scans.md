# **#Host_discovery Scans:**

- Checks which hosts are up by probing the specified TCP & UDP Ports:
`nmap -sn -PS21,22,23,25,53,80,135,139,443,445,3389,8080 -PU53,67,68,123,137,161,500,1900 -T4  -O <target>`
Use `-O` or `--osscan-guess` to show OS.


# **Best method to scan ports:**



### **Open Prorts scan:**


	nmap --open -p0- -n -Pn -vvv --min-rate 5000 <TARGET> -oG nmap/port_scan


### **Then Service versions scan for each port:**


	nmap -p<discoverd_ports> -n -Pn -vvv -sCV --min-rate 5000 <TARGET> -oN nmap/open_port


# **#port_scan Scans:**

### **<mark style="background: #00CDFF82;">TCP</mark> scan:**
- Scans all TCP ports and their versions and guess OS 

		nmap -sS -sV -O -p- -T4 <target>

### **<mark style="background: #62BE6A;">UDP</mark> Scan:**
- Scans all UDP ports and their versions and guess OS


		nmap -sU -sV -O -p- -T4 <ip>

# **Stealth Scans:**
- This scans ports on the specified network and <mark style="background: #FF5582A6;">delays 10s</mark> and <mark style="background: #FF5582A6;">fake the source IP as the Gateway</mark> (Because it ends with 1) and also <mark style="background: #FF5582A6;">fragment packets</mark>. 
`nmap -sS -sV --scan-delay 10s -d 192.168.1.1 -f 192.168.1.0/24` 

