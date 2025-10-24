

# **Crack NTLM Hashes:**

If collected via meterpreter command: `hashdump` it will look like this:
No need to change anything just paste them as is in a txt file....

	Administrator:500:aad3b435b51404eeaad3b435b51404ee:8846f7eaee8fb117ad06bdd830b7586c:::
	bob:1009:aad3b435b51404eeaad3b435b51404ee:5835048ce94ad0564e29a924a03510ef:::
	Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::


To list format types: `john --list=formats`

> If we don't specify a wordlist john will choose it's own wordlist....


Command: 

	john format=NT <hashes_file> wordlist=/<wordlist_path>




# **Cracking Linux Hashes:**

Example root hash:

	root:$6$sgewtGbw$ihhoUYASuXTh7Dmw0adpC7a3fBGkf9hkOQCffBQRMIF8/0w6g/Mh4jMWJ0yEFiZyqVQhZ4.vuS8XOyq.hLQBb.:18348:0:99999:7:::

We have to Unshadow it using a MSF module: `post/linux/gather/hashdump`

	root:$6$sgewtGbw$ihhoUYASuXTh7Dmw0adpC7a3fBGkf9hkOQCffBQRMIF8/0w6g/Mh4jMWJ0yEFiZyqVQhZ4.vuS8XOyq.hLQBb.:0:0:root:/root:/bin/bash



We specify the format and the target hash and the wordlist:

	john --format=sha512crypt hash.txt /usr/share/wordlists/rockyou.txt
