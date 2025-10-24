Same as nmap but useful when we discover <mark style="background: #88B04B;">TARGET 1</mark> and want to check if there's <mark style="background: #FF5582A6;">other TARGETS</mark> that's connected with the first target locally so we do a <mark style="background: #6A5ACD;">Host Discovery then a Port Scans</mark> form <mark style="background: #88B04B;">TARGET 1</mark> to check on other targets on the network. 
- ## **Some #Host_discovery #Aux_Modules:**
![[Aux_udp_Host_Discovey.png]]

- ## **Some #port_scan #Aux_Modules:**
![[Aux_portscan.png]]


- ## Bruteforce AUX module:
Used to bruteforce a given service:

	auxiliary/scanner/<service>/<service>_login
