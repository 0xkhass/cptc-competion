
## **Fuzz specific of URLs:**


- `--hc 404`: Hide responses with HTTP status code 404 (not found), so you only see valid directories/files.

	wfuzz -u http://10.10.108.157/wp-content/FUZZ -w /usr/share/wordlists/dirb/common.txt --hc 404
