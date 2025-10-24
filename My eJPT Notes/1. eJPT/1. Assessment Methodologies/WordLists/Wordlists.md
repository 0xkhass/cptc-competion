# **Users Wordlists:**

`/usr/share/metasploit-framework/data/wordlists/namelist.txt`

# **Passwords Wordlists:**
- <mark style="background: #FF5582A6;">ALWAYS USE ROCKYOU.txt  </mark>
`/usr/share/metasploit-framework/data/wordlists/common_passwords.txt`  
`/usr/share/metasploit-framework/data/wordlists/unix_passwords.txt`

---
# **GoBuster Wordlists:**

### 🕸 **1. Web Directory Wordlists:**

##### 🔑 Recommended Wordlists:

- `/usr/share/wordlists/dirb/common.txt` ✅ (classic, fast)
    
- `/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt` 🧨 (more extensive)
    
- `SecLists/Discovery/Web-Content/raft-large-directories.txt` 📂 (massive)


### 🌐  **2. DNS Mode** (Subdomain Enumeration)
##### 🔑 Recommended Wordlists:

- `/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt` ✅ (fast & solid)
    
- `/usr/share/seclists/Discovery/DNS/namelist.txt` 🧠
    
- `/usr/share/seclists/Discovery/DNS/fierce-hostlist.txt` 🌪️


### 🏠  **3. VHOST Mode** (Virtual Host Enumeration)
### 🔑 Recommended Wordlists:

- `/usr/share/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt` 💎
    
- `/usr/share/seclists/Discovery/DNS/namelist.txt`
    
- `/usr/share/seclists/Discovery/DNS/virtual-hostnames.txt` 🏡


### **💥 4. FUZZ Mode (Custom Fuzzing)**

### 🔑 Wordlists depend on what you're fuzzing:

- Path fuzzing: same as `dir` mode wordlists
    
- Param fuzzing:
    
    - `/usr/share/seclists/Fuzzing/parameters.txt`
        
    - `/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt`
        
- Headers:
    
    - `/usr/share/seclists/Discovery/Web-Content/burp-headers.txt`