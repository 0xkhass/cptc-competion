
# **NetBIOS Filters:**


| **Notes**                                                                                                                                                                       | **Wireshark Filter**             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| Global search.                                                                                                                                                                  | - `nbns`                         |
| "NBNS" options for grabbing the low-hanging fruits:<br><br>- **Queries:** Query details.<br>- Query details could contain **"name, Time to live (TTL) and IP address details"** | - `nbns.name contains "keyword"` |


---


# **Kerberos Analysis**  

**Kerberos** is the default authentication service for Microsoft Windows domains. It is responsible for authenticating service requests between two or more computers over the untrusted network. The ultimate aim is to prove identity securely.  

**Kerberos investigation in a nutshell:**


| **Notes**                                                                                                                                                                                                                                                                                                                                                                           | **Wireshark Filter**                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Global search.                                                                                                                                                                                                                                                                                                                                                                      | - `kerberos`                                                                                                       |
| User account search:<br><br>- **CNameString:** The username.<br><br>**Note:** Some packets could provide hostname information in this field. To avoid this confusion, filter the **"$"** value. The values end with **"$"** are hostnames, and the ones without it are user names.                                                                                                  | - `kerberos.CNameString contains "keyword"` <br>- `kerberos.CNameString and !(kerberos.CNameString contains "$" )` |
| "Kerberos" options for grabbing the low-hanging fruits:<br><br>- **pvno:** Protocol version.<br>- **realm:** Domain name for the generated ticket.  <br>    <br>- **sname:** Service and domain name for the generated ticket.<br>- **addresses:** Client IP address and NetBIOS name.  <br>    <br><br>**Note:** the "addresses" information is only available in request packets. | - `kerberos.pvno == 5`<br><br>- `kerberos.realm contains ".org"` <br><br>- `kerberos.SNameString == "krbtg"`       |


