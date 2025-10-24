# **FLAG: **


C:\Users\mike\Documents>type flag.txt
type flag.txt
f45dfae1f4b047c383b75881ffc0cbf9


# 192.168.100.50 WINSERVER-01



WordPress version 5.9.3 identified

admin:estrella


# Users:
	
	net users
	
	User accounts for \\
	
	-------------------------------------------------------------------------------
	admin                    Administrator            Guest                    
	mike                     vince      

## Open Ports:

	PORT      STATE SERVICE        REASON
	80/tcp    open  http           syn-ack ttl 128
	135/tcp   open  msrpc          syn-ack ttl 128
	139/tcp   open  netbios-ssn    syn-ack ttl 128
	445/tcp   open  microsoft-ds   syn-ack ttl 128
	3307/tcp  open  opsession-prxy syn-ack ttl 128
	3389/tcp  open  ms-wbt-server  syn-ack ttl 128
	5985/tcp  open  wsman          syn-ack ttl 128
	47001/tcp open  winrm          syn-ack ttl 128
	49152/tcp open  unknown        syn-ack ttl 128
	49153/tcp open  unknown        syn-ack ttl 128
	49154/tcp open  unknown        syn-ack ttl 128
	49155/tcp open  unknown        syn-ack ttl 128
	49156/tcp open  unknown        syn-ack ttl 128
	49174/tcp open  unknown        syn-ack ttl 128
	


# **Services:**


	PORT      STATE SERVICE            REASON          VERSION
	80/tcp    open  http               syn-ack ttl 128 Apache httpd 2.4.51 ((Win64) PHP/7.4.26)
	| http-methods: 
	|_  Supported Methods: GET HEAD POST OPTIONS
	|_http-title: WAMPSERVER Homepage
	|_http-server-header: Apache/2.4.51 (Win64) PHP/7.4.26
	|_http-favicon: Unknown favicon MD5: 79E32EEA338FA735AD22D36104C4337A
	135/tcp   open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	139/tcp   open  netbios-ssn        syn-ack ttl 128 Microsoft Windows netbios-ssn
	445/tcp   open  microsoft-ds       syn-ack ttl 128 Windows Server 2012 R2 Standard 9600 microsoft-ds
	3307/tcp  open  opsession-prxy?    syn-ack ttl 128
	| fingerprint-strings: 
	|   NULL, afp, giop: 
	|_    Host 'ip-192-168-100-5.me-south-1.compute.internal' is not allowed to connect to this MariaDB server
	3389/tcp  open  ssl/ms-wbt-server? syn-ack ttl 128
	|_ssl-date: 2025-05-30T15:53:33+00:00; -1s from scanner time.
	| rdp-ntlm-info: 
	|   Target_Name: WINSERVER-01
	|   NetBIOS_Domain_Name: WINSERVER-01
	|   NetBIOS_Computer_Name: WINSERVER-01
	|   DNS_Domain_Name: WINSERVER-01
	|   DNS_Computer_Name: WINSERVER-01
	|   Product_Version: 6.3.9600
	|_  System_Time: 2025-05-30T15:53:27+00:00
	| ssl-cert: Subject: commonName=WINSERVER-01
	| Issuer: commonName=WINSERVER-01
	| Public Key type: rsa
	| Public Key bits: 2048
	| Signature Algorithm: sha256WithRSAEncryption
	| Not valid before: 2025-05-29T15:31:27
	| Not valid after:  2025-11-28T15:31:27
	| MD5:   97ca a8dc be93 dd73 4bc7 8406 9042 fafa
	| SHA-1: d74a 311d c1e8 f2d7 c55b de90 8602 0e20 b18b b45b
	| -----BEGIN CERTIFICATE-----
	| MIIC3DCCAcSgAwIBAgIQKdSwZoeS7qBI4aXU7/LHXjANBgkqhkiG9w0BAQsFADAX
	| MRUwEwYDVQQDEwxXSU5TRVJWRVItMDEwHhcNMjUwNTI5MTUzMTI3WhcNMjUxMTI4
	| MTUzMTI3WjAXMRUwEwYDVQQDEwxXSU5TRVJWRVItMDEwggEiMA0GCSqGSIb3DQEB
	| AQUAA4IBDwAwggEKAoIBAQC9bcM76APgcpYAEZyZd1vQ5gHEvDKuhbNFkLwVrd18
	| I8iCYKo07ED0JUl3BHg3D8ByjcPSNG+WYLmr0Jmk4ielObR/0rn5dFJNAZjkVFIt
	| qH4dBKpiF110u8KyMzAnoEEz9fCixuVX8mrDD+B40Q+Mq/DNpplp5y5iQAPLtcKm
	| eVsHFS0CcyTQ8WhMUtyhCoDk4b8V2YlP409FhC+NOl8bS56w+V8w7C5YmMhHFewV
	| CTDgz6lEQSePiWJFReX95+r6QStCg8CTAoNuvliheA3mefREAKG1q7g1x73h/ANS
	| uAZ8vbiNSlZQc7PYCbwOxiJ/WaK6nz26Jx3Z95gP4Z0vAgMBAAGjJDAiMBMGA1Ud
	| JQQMMAoGCCsGAQUFBwMBMAsGA1UdDwQEAwIEMDANBgkqhkiG9w0BAQsFAAOCAQEA
	| q/d8cbebfOLFDD/1cxgw66QOlYUKBLYJ/6szza9vVyfE7433ITZVlxB9bTpQvawn
	| sdTFsqIniJk7voZMHtsKkSbJ1zwDLYbeesoxegQvdDODjjMrcAyVVkH5Uiafe1OA
	| BMbuc8jDsoKMQNFFN95BEfV2tZpF1xy+6RY825gibSI5qxlzDJv5gxSgtbjNZ4kR
	| 1UhDAKfQppH7jTbC1Qplkyb+jqEXdfV26iMJU7u2+/IJET4g9kCLnZC/3B/QhFUd
	| a6tDUd6jXvoYs+ssfFtqhBeCtw0K/rAeuSP72UR22GAzA0KD8A+GvQaEBsImmu2l
	| g2toMy1AtZ7d4TGmCaw72A==
	|_-----END CERTIFICATE-----
	5985/tcp  open  http               syn-ack ttl 128 Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
	|_http-title: Not Found
	|_http-server-header: Microsoft-HTTPAPI/2.0
	47001/tcp open  http               syn-ack ttl 128 Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
	|_http-server-header: Microsoft-HTTPAPI/2.0
	|_http-title: Not Found
	49152/tcp open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	49153/tcp open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	49154/tcp open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	49155/tcp open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	49156/tcp open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	49174/tcp open  msrpc              syn-ack ttl 128 Microsoft Windows RPC
	

