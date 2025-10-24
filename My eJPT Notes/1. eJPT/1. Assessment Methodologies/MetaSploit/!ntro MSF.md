
# To import #nmap scans to <mark style="background: #FF5582A6;">MSF</mark>:
1. Start postgreSQL database service:`service postgresql start`
1. Old versions of Metasploit requires us to initialize the database: `msfdb init` 
2. Start MSF: `msfconsole`
3. To check if we're connected to the postgreSQL database use this command: `db_status`
4. It's best practice to create a new workspace for your scans for each pentest you do. 
- To create type this:  `workspace -a <name>`
- To view existing workspaces: `workspace` 
5. Now we will import our scan to a workspace with this command: `db_import  /scans/win_server.xml` # We can use taps to auto complete.
 - To check if we imported correctly use this command: `hosts`
- To check open services use this command: `services`
6. Use `setg RHOSTS <target_ip>` to save time instead to having to enter the target IP in every module we use.

---
# MSF Commands:
- `db_nmap <nmap options>`  => Performs an nmap scan that will be saved to Metasploit
- `db_import scan.xml` => import a scan to the MSF database.

---
# To Import MSF Plugins:
- After we download the Plugin, Move it to this folder: `/usr/share/metasploit-framework/plugins`
- Then in the msfconsole use this command: `load <Plugin_Name>`

