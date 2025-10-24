
# local.rules file structure:


	[Action] [Protocol] [Source IP] [Source Port] -> [Destination IP] [Destination Port]

### Traffic direction:

	-> traffic sent
	<- traffic recieved
	<> bidirectional traffic


### Basic Rules:

	# Detect any FTP traffic
	alert tcp any any <> any 21 (msg:"FTP Port 21 Traffic"; sid:1002; rev:1;)
	
	# Failed FTP login attempts:
	alert tcp any 21 -> any any (msg:"Failed FTP 21 Login attempt"; content:"530 User"; sid:1003; rev:1;)
	
	# Successful FTP login attempt
	alert tcp any 21 -> any any (msg:"Successful FTP 21 login"; content:"230 User"; sid:1004; rev:1;)
	
	# Valid user but no password entered
	alert tcp any 21 -> any any (msg:"Valid FTP user but no password entered"; content:"331 Password"; sid:1005; rev:1;) 
	
	# Detect login with Administrator user
	alert tcp any 21 -> any any (msg:"Login attempt with Administrator user"; content:"331 Password"; content:"Administrator"; sid:1006; rev:1;)
	


Image types detection:

	#PNG file signature detection
	alert tcp any any -> any any (msg:"PNG File Detected"; content:"|89 50 4E 47 0D 0A 1A 0A|"; depth:8;sid:10000000009)
	
	#GIF file signature detection
	alert tcp any any <> any any (msg:"GIF File Detected"; content:"GIF89a"; sid:1033)


## Alert for SSH Bruteforce:

	alert tcp any any -> $HOME_NET 22 (msg:"SSH Brute-Force Attempt"; detection_filter: track by_src, count 5, seconds 60; sid:1000005; rev:1;)