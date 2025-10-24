
---
﻿SysmonView is a Windows GUI-based tool that visualises Sysmon Logs.



Before using this tool, we must export the log file's contents into XML via **Event Viewer**.

![EventViewer XML export. | 900](https://tryhackme-images.s3.amazonaws.com/user-uploads/5dbea226085ab6182a2ee0f7/room-content/c8b35b8ec773178a98abb63b50a7ac60.png)

The machine will notify you once the file has been successfully exported.

Usage:   

- Go to `File > Import Sysmon Event Logs` then choose the XML files generated using the Event Viewer.
- Once loaded, the left sidebar has search functionality that can filter a specific process in mind.
- Choose the image path and session GUID to render the mapped view. 

![SysmonView.exe execution. | 900](https://tryhackme-images.s3.amazonaws.com/user-uploads/5dbea226085ab6182a2ee0f7/room-content/d52dcf7d715bec56b7dbc7b9d60d1754.png)  

This tool can easily view the correlated events from a specific process. The example above summarises all Sysmon events related to **explorer.exe.**