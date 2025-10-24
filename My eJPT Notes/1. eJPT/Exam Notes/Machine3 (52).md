# ** 192.168.100.52 Linux SAMBA anon FTP Drupal:**

## db:

	MariaDB [drupal]> SELECT * FROM users;
	+-----+----------+---------------------------------------------------------+----------------------+-------+-----------+------------------+------------+------------+------------+--------+------------------+----------+---------+----------------------+------+
	| uid | name     | pass                                                    | mail                 | theme | signature | signature_format | created    | access     | login      | status | timezone         | language | picture | init                 | data |
	+-----+----------+---------------------------------------------------------+----------------------+-------+-----------+------------------+------------+------------+------------+--------+------------------+----------+---------+----------------------+------+
	|   0 |          |                                                         |                      |       |           | NULL             |          0 |          0 |          0 |      0 | NULL             |          |       0 |                      | NULL |
	|   1 | admin    | $S$D67i0qFmSLMLwZ9PU7VEocSS9fvV1JaSeJxQMgCid80hGbq6wXZH | admin@syntex.com     |       |           | NULL             | 1650232322 | 1650248652 | 1650248498 |      1 | America/New_York |          |       0 | admin@syntex.com     | b:0; |
	|   2 | auditor  | $S$DV.wsqkmKY3y5VW.icW/g5NTU3h.UA01nxqL9Cro27GaSBYpH4WC | auditor@syntex.com   |       |           | filtered_html    | 1650234408 |          0 |          0 |      1 | America/New_York |          |       0 | auditor@syntex.com   | b:0; |
	|   3 | dbadmin  | $S$DZcGD5qcb6xso1E/Mu6DJP4uPi5DfY28kBEyuIab8Pod1saBaImN | dbadmin@syntex.com   |       |           | filtered_html    | 1650248436 |          0 |          0 |      1 | America/New_York |          |       0 | dbadmin@syntex.com   | b:0; |
	|   4 | Vincenzo | $S$DGnS.dK3q2FeWeNbLikdI5Hk/XdBFI2jBFkmPvv/v9Ln8vjIanIu | vincenzo@syntext.com |       |           | filtered_html    | 1650248490 |          0 |          0 |      1 | America/New_York |          |       0 | vincenzo@syntext.com | b:0; |
	|   5 | asem     | $S$DOAQkNeZ.mAvC9gV3GH24vDqveLF5OSSvaYhx5GvKG4Bsde6NGPh | asem@gmail.com       |       |           | filtered_html    | 1748624236 |          0 |          0 |      0 | America/New_York |          |       0 | asem@gmail.com       | NULL |
	+-----+----------+---------------------------------------------------------+----------------------+-------+-----------+------------------+------------+------------+------------+--------+------------------+----------+---------+----------------------+------+
	6 rows in set (0.000 sec)
	
	

## ROOT FLAG:

	ls
	Desktop
	Downloads
	flag.txt
	snap
	thinclient_drives
	cat flag.txt
	9951eaa1fbb148a3b0f9a4a55dc82635
	


## **/etc/shadow**


	cat /etc/shadow
	root:$6$v8b2/P8T26uEUwvM$TBiao8o1dfqQrGPPcebRj6A6cNiixcy6/r/AFtN5Swk7N1kpg/8UyQK0pXFwdLfy5Ed/71VN91nJ6.3JyAN/00:18998:0:99999:7:::
	daemon:*:18960:0:99999:7:::
	bin:*:18960:0:99999:7:::
	sys:*:18960:0:99999:7:::
	sync:*:18960:0:99999:7:::
	games:*:18960:0:99999:7:::
	man:*:18960:0:99999:7:::
	lp:*:18960:0:99999:7:::
	mail:*:18960:0:99999:7:::
	news:*:18960:0:99999:7:::
	uucp:*:18960:0:99999:7:::
	proxy:*:18960:0:99999:7:::
	www-data:*:18960:0:99999:7:::
	backup:*:18960:0:99999:7:::
	list:*:18960:0:99999:7:::
	irc:*:18960:0:99999:7:::
	gnats:*:18960:0:99999:7:::
	nobody:*:18960:0:99999:7:::
	systemd-network:*:18960:0:99999:7:::
	systemd-resolve:*:18960:0:99999:7:::
	systemd-timesync:*:18960:0:99999:7:::
	messagebus:*:18960:0:99999:7:::
	syslog:*:18960:0:99999:7:::
	_apt:*:18960:0:99999:7:::
	tss:*:18960:0:99999:7:::
	uuidd:*:18960:0:99999:7:::
	tcpdump:*:18960:0:99999:7:::
	sshd:*:18960:0:99999:7:::
	landscape:*:18960:0:99999:7:::
	pollinate:*:18960:0:99999:7:::
	ec2-instance-connect:!:18960:0:99999:7:::
	systemd-coredump:!!:18998::::::
	ubuntu:!:18998:0:99999:7:::
	lxd:!:18998::::::
	rtkit:*:18998:0:99999:7:::
	xrdp:!:18998:0:99999:7:::
	dnsmasq:*:18998:0:99999:7:::
	usbmux:*:18998:0:99999:7:::
	avahi:*:18998:0:99999:7:::
	cups-pk-helper:*:18998:0:99999:7:::
	pulse:*:18998:0:99999:7:::
	geoclue:*:18998:0:99999:7:::
	saned:*:18998:0:99999:7:::
	colord:*:18998:0:99999:7:::
	sddm:*:18998:0:99999:7:::
	gdm:*:18998:0:99999:7:::
	auditor:$6$RNJCCrE9ok/yCMqD$7uPoYFsrnR3wPnSwPeLuBEiXgAzlOzGW6uZSyX.IjNNVcR5.bDBhb.dlZTN37JJR4yZXXQTetuUhOOX9ZNov6/:19099:0:99999:7:::
	dbadmin:$6$1HAbXNNxXVVNCcoi$6Zy2gjvyZZYHTwSyxSLsdv0LA.5hA7EeD1WhUFzHg9SOSXrz7DxX7iG0mCQbmEBSo.yjB1c80iIujSM6Fjbpo/:19099:0:99999:7:::
	mysql:!:19099:0:99999:7:::
	ftp:*:19100:0:99999:7:::




## **/etc/passwd**


	cat /etc/passwd
	root:x:0:0:root:/root:/bin/bash
	daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
	bin:x:2:2:bin:/bin:/usr/sbin/nologin
	sys:x:3:3:sys:/dev:/usr/sbin/nologin
	sync:x:4:65534:sync:/bin:/bin/sync
	games:x:5:60:games:/usr/games:/usr/sbin/nologin
	man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
	lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
	mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
	news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
	uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
	proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
	www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
	backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
	list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
	irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
	gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
	nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
	systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
	systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
	systemd-timesync:x:102:104:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
	messagebus:x:103:106::/nonexistent:/usr/sbin/nologin
	syslog:x:104:110::/home/syslog:/usr/sbin/nologin
	_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
	tss:x:106:111:TPM software stack,,,:/var/lib/tpm:/bin/false
	uuidd:x:107:112::/run/uuidd:/usr/sbin/nologin
	tcpdump:x:108:113::/nonexistent:/usr/sbin/nologin
	sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
	landscape:x:110:115::/var/lib/landscape:/usr/sbin/nologin
	pollinate:x:111:1::/var/cache/pollinate:/bin/false
	ec2-instance-connect:x:112:65534::/nonexistent:/usr/sbin/nologin
	systemd-coredump:x:999:999:systemd Core Dumper:/:/usr/sbin/nologin
	ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
	lxd:x:998:100::/var/snap/lxd/common/lxd:/bin/false
	rtkit:x:113:119:RealtimeKit,,,:/proc:/usr/sbin/nologin
	xrdp:x:114:122::/run/xrdp:/usr/sbin/nologin
	dnsmasq:x:115:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
	usbmux:x:116:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
	avahi:x:117:123:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/usr/sbin/nologin
	cups-pk-helper:x:118:124:user for cups-pk-helper service,,,:/home/cups-pk-helper:/usr/sbin/nologin
	pulse:x:119:125:PulseAudio daemon,,,:/var/run/pulse:/usr/sbin/nologin
	geoclue:x:120:127::/var/lib/geoclue:/usr/sbin/nologin
	saned:x:121:129::/var/lib/saned:/usr/sbin/nologin
	colord:x:122:130:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
	sddm:x:123:131:Simple Desktop Display Manager:/var/lib/sddm:/bin/false
	gdm:x:124:132:Gnome Display Manager:/var/lib/gdm3:/bin/false
	auditor:x:1001:1001::/home/auditor:/bin/bash
	dbadmin:x:1002:1002::/home/dbadmin:/bin/bash
	mysql:x:125:133:MySQL Server,,,:/nonexistent:/bin/false
	ftp:x:126:137:ftp daemon,,,:/srv/ftp:/usr/sbin/nologin




# Drupalgeddon2 vulnerablility

# info gathering initial access:

$drupal_hash_salt = 'e-5a2o6PCMfkMD1w-sV496_xJRE8sKku2o3CKeyTM9c';

      'database' => 'drupal',
      'username' => 'drupal',
      'password' => 'syntex0421',
      'host' => 'localhost',
      'port' => '3306',
      'driver' => 'mysql',
      'prefix' => '',
    ),





## Auditor flag:

www-data@ip-192-168-100-52:/home/auditor$ cat flag.txt
cat flag.txt
62eb7262c5944aeabad139c4abea7c49

## updates.txt on FTP:

root@kali:~# cat updates.txt 
Greetings gentlemen!

- I have setup the server successfully and have configured Drupal.
- Your Drupal usernames are exactly the same as your user account passwords on this server. Contact me to get your Drupal passwords.
- I was too busy to setup a file sharing server so i will be posting the updates here.

- admin


## mysql users maybe?

S-1-22-1-1000 Unix User\ubuntu (Local User)
S-1-22-1-1001 Unix User\auditor (Local User)
S-1-22-1-1002 Unix User\dbadmin (Local User)




# Dirb:

	---- Scanning URL: http://192.168.100.52/drupal/sites/ ----
	==> DIRECTORY: http://192.168.100.52/drupal/sites/all/                                                                                                
	==> DIRECTORY: http://192.168.100.52/drupal/sites/default/                                                                                            
	     


# **Open Ports:**


	PORT     STATE SERVICE       REASON
	21/tcp   open  ftp           syn-ack ttl 64
	22/tcp   open  ssh           syn-ack ttl 64
	80/tcp   open  http          syn-ack ttl 64
	139/tcp  open  netbios-ssn   syn-ack ttl 64
	445/tcp  open  microsoft-ds  syn-ack ttl 64
	3306/tcp open  mysql         syn-ack ttl 64
	3389/tcp open  ms-wbt-server syn-ack ttl 64




# **Services on open ports:**

	PORT     STATE SERVICE       REASON         VERSION
	21/tcp   open  ftp           syn-ack ttl 64 vsftpd 3.0.3
	| ftp-anon: Anonymous FTP login allowed (FTP code 230)
	|_-rw-r--r--    1 65534    65534         318 Apr 18  2022 updates.txt
	| ftp-syst: 
	|   STAT: 
	| FTP server status:
	|      Connected to ::ffff:192.168.100.5
	|      Logged in as ftp
	|      TYPE: ASCII
	|      No session bandwidth limit
	|      Session timeout in seconds is 300
	|      Control connection is plain text
	|      Data connections will be plain text
	|      At session startup, client count was 2
	|      vsFTPd 3.0.3 - secure, fast, stable
	|_End of status
	22/tcp   open  ssh           syn-ack ttl 64 OpenSSH 8.2p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
	| ssh-hostkey: 
	|   3072 89:b1:a9:d4:ab:b5:41:d4:27:46:fe:13:9f:27:3e:b7 (RSA)
	| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuX00AFULGrdD08jhtpiGzAIbzNpEys3iIRZuaqNhMAae29Zc7pv1m7jK5aPMx4C086XPu0EBYG4GSpk8WhWbhTEY1NuGVm/occzClilCly1w05Zvf0nvFMejd0iRhqcFxntpwia8SKVqjDfFngzsAmbDI5k0DfNZ3s7/SKf4ke2MnzMcmE4JxZbE84V7HsS2nUS+4AtYwHErWMsZ/8BiLXttiYiWRLZcm11UfDo7v/thv5sRdyP0hxCA99b8m19VJJNtJxiGTKNPCGOaj+G+2m6nClONuP1jGZpgVM94EqjNMJpR7m3JRihC1gcq/zPIjBlJLTOG0rd+2s0f/rp3NpUmAAjuj/0eEUCj98zz8n9MmJ5m2iMctn1/CsV82Jf+kbeJzv235pNfP5MQhcO5lPLgEqrrHhBun5e4DTY2d88ERs5MFbjZdMi5+7XZJh2e+TDvZ6KxxFMkzKifoAKNnxVR/JW5lLHqsd3RFjt/YmOEYJ/nUuDTlPm5vYRNVsv8=
	|   256 35:6e:6d:5d:d6:08:dc:4b:91:b0:a2:c0:6c:28:7b:d2 (ECDSA)
	| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHY5VJW8sOgKAKcilCrHtdSQ+MGhojrUHOyP9KeARovzgOBQuJgiphMOBPXRmAMucG0PMKWU5XeSQNA5zBWLB8g=
	|   256 6c:2c:ab:d6:64:20:73:ed:fc:1d:d1:c6:18:93:a2:fa (ED25519)
	|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEPq9Adp8tQ/s4L6ngzXhzFag7ZgiWLOx971D2WnXsJX
	80/tcp   open  http          syn-ack ttl 64 Apache httpd 2.4.41
	|_http-server-header: Apache/2.4.41 (Ubuntu)
	| http-ls: Volume /
	| SIZE  TIME              FILENAME
	| -     2018-02-21 17:28  drupal/
	|_
	|_http-title: Index of /
	| http-methods: 
	|_  Supported Methods: POST OPTIONS HEAD GET
	139/tcp  open  netbios-ssn   syn-ack ttl 64 Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
	445/tcp  open  netbios-ssn   syn-ack ttl 64 Samba smbd 4.13.17-Ubuntu (workgroup: WORKGROUP)
	3306/tcp open  mysql         syn-ack ttl 64 MySQL 5.5.5-10.3.34-MariaDB-0ubuntu0.20.04.1
	| mysql-info: 
	|   Protocol: 10
	|   Version: 5.5.5-10.3.34-MariaDB-0ubuntu0.20.04.1
	|   Thread ID: 37
	|   Capabilities flags: 63486
	|   Some Capabilities: SupportsTransactions, InteractiveClient, DontAllowDatabaseTableColumn, Support41Auth, Speaks41ProtocolNew, Speaks41ProtocolOld, FoundRows, IgnoreSigpipes, SupportsCompression, SupportsLoadDataLocal, ConnectWithDatabase, LongColumnFlag, IgnoreSpaceBeforeParenthesis, ODBCClient, SupportsMultipleResults, SupportsAuthPlugins, SupportsMultipleStatments
	|   Status: Autocommit
	|   Salt: 0H[o>%;=`J2[Uwvj3\W}
	|_  Auth Plugin Name: mysql_native_password
	3389/tcp open  ms-wbt-server syn-ack ttl 64 xrdp
	MAC Address: 06:4C:FE:3E:E2:97 (Unknown)
	Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
	OS fingerprint not ideal because: Missing a closed TCP port so results incomplete
	Aggressive OS guesses: Linux 3.10 - 3.13 (95%), Linux 3.8 (95%), Linux 3.1 (95%), Linux 3.2 (95%), AXIS 210A or 211 Network Camera (Linux 2.6.17) (94%), ASUS RT-N56U WAP (Linux 3.4) (93%), Linux 3.16 (93%), Adtran 424RG FTTH gateway (92%), Linux 2.6.32 (92%), Linux 2.6.39 - 3.2 (92%)
	No exact OS matches for host (test conditions non-ideal).


