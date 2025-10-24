<br>

### **<mark style="background: #e74c3c;">IIS websites accepts `asp, aspx` formats in it so payloads must be in these formats.</mark>**
### **On the other hand <mark style="background: #00CDFF82;">Apache servers</mark> accept php files....**

---
## <mark style="background: #FF5582A6;">**MSF Modules:**</mark>
#### This module create a asp payload and uploads it on the iss web server 
- `exploit/windows/iis/iis_webdav_upload_asp`
- We need to configure: LHOST, LPORT, RHOST, RPORT, httppassword, httpusername and PATH: `set PATH /<the_web_dav_directory/<shell_name>`
- ### **This module <mark style="background: #f39c12;">deletes the payload</mark> after gaining a session VERY COOL**