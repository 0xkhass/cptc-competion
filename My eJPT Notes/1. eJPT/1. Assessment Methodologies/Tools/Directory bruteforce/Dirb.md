
https://medium.com/@strikoder/comparing-directory-bruteforcing-tools-once-in-never-out-d2da24819bd4


### **Switches:**

####  <mark style="background: #e74c3c;">**Use -w to scan RUCURSIVLY**</mark>

**Use case-insensitive search** **(-i)**

- Usually, DIRB scans uses case-sensitive searches. Setting this option allows to perform case-insensitive searches.


**Saving the output** **(-o)**

- You can save the output of this tool to a file using the “-o” option.



**Scan using a proxy (-p)**

- For all its awesome features, it produces a lot of noise which can raise suspicions on the target side. To beat this a bit, DIRB provides a option to use a proxy to perform directory busting.


**Don’t perform recursive searches (-r)**

Setting this option will stop dirb from performing recursive scan of the directories.


**Search for files with a specific extension (-X)**

You can use this option if you want to search for files with a particular extension. For example, to search for text files (.txt) extension, we can use dirb as shown below.
You can also search for multiple file extensions using dirb. Just add all the file extensions you want to search for in a text file and use the (-x) option as shown below. For example, to search for all file extensions specified in a file named “ext_text”.




## **Simple usage:**

	dirb <url>


> For Apache server use this wordlist:

	dirb <url> /usr/share/dirb/wordlists/vulns/apache.txt




#### **Directory scan with authentication** 

	dirb http://192.168.1.85/ -u "username:password" /usr/share/wordlists/dirb/common.txt