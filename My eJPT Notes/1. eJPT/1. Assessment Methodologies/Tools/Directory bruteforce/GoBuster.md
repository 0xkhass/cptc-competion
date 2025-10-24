# :LiOctagonAlert:
### **Available Commands:**
1. `dir`  ==>        Find hidden directories and files on a website.  
	`gobuster dir -u http://example.com -w /usr/share/wordlists/dirb/common.txt`

---

2. `dns`   ==>       Find valid subdomains using DNS resolution.  
	`gobuster dns -d example.com -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt`  
	
	-   OPTIONAL: To specify DNS server: `--dns-server 1.1.1.1`


---

3. `vhost`  ==>     Find virtual hosts configured on the server (host header bruteforce).
	`gobuster vhost -u http://10.10.10.10 -w /usr/share/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt`  


---

4. `fuzz`  ==>      Insert your payload **anywhere** in the URL (like params, headers, etc.)  
	`gobuster fuzz -u http://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt`  
OR  
	`gobuster fuzz -u "http://example.com/page.php?id=FUZZ" -w payloads.txt`



--- 

5. `s3`     ==>       Uses aws bucket enumeration mode
	


---

##### **We can also add:**


`-x php,html,txt,zip`

To guess file extensions.


`GoBuster <mode> -u <url> -w <path_to_wordlist.txt>`  
E.g: `gobuster dir -u http://google.com -w /usr/share/wordlists/rockyou.txt`


