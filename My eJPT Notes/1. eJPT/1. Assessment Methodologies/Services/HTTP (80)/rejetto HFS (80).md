### **An HTTP File Server (HFS) is a web server that is designed for file & document  sharing.**

### **Rejetto HFS is a popular free and open source HTTP file server that can be setup on both Windows and Linux.**

---

#  Rejetto HttpFileServer is a hosting service.

### **If nmap port 80 is this:**
	80/tcp   open  http           HttpFileServer httpd 2.3
	|_http-title: HFS /
	|_http-server-header: HFS 2.3


## **<mark style="background: #FF5582A6;">Use this MSF Module:**</mark>


`exploit/windows/http/rejetto_hfs_exec`  

- Ez Exploit just define the RHOSTS