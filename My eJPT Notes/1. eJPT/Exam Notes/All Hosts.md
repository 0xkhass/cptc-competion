Scan for open ports:

	nmap --open -p0- -n -Pn -vvv --min-rate 3000 192.168.100.50 -oN 50_port_scan

Scan for Services on open ports:

	nmap -p<discoverd_ports> -n -Pn -vvv -sCV -O --min-rate 3000 <TARGET> -oN 50host_services


---


My host machine is: 192.168.100.5


Nmap scan report for ip-192-168-100-1.me-south-1.compute.internal (192.168.100.1)
Nmap scan report for ip-192-168-100-5

Other:
Nmap scan report for ip-192-168-100-50
Nmap scan report for ip-192-168-100-51
Nmap scan report for ip-192-168-100-52
Nmap scan report for ip-192-168-100-55
Nmap scan report for ip-192-168-100-63
Nmap scan report for ip-192-168-100-67

