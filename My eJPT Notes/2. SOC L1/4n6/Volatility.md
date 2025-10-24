
# **Cheat Sheet:**


https://blog.onfvp.com/post/volatility-cheatsheet/

## **SANS PDF:**

![[SANS_Memory_Forensics_CheatSheet_3.0.pdf]]


---

# **Install Volatility:**

When downloading, you can make a choice to use the pre-packaged executable (.whl file) that will work the same and requires no dependencies (Windows Only), or you can decide to run it directly from Python.

To obtain a pre-packaged executable, simply download a zip file containing the application from their releases page. [](https://github.com/volatilityfoundation/volatility3/releases/tag/v1.0.1)[https://github.com/volatilityfoundation/volatility3/releases/tag/v1.0.1](https://github.com/volatilityfoundation/volatility3/releases/tag/v1.0.1)

To begin running the project from source, you will need to first download the following dependencies: `Python 3.5.3 or later` and `Pefile 2017.8.1 or later`. [](https://pypi.org/project/pefile/)[https://pypi.org/project/pefile/](https://pypi.org/project/pefile/)

You can also download these optional dependencies (recommended for this room): `yara-python 3.8.0 or later` [](https://github.com/VirusTotal/yara-python)[https://github.com/VirusTotal/yara-python](https://github.com/VirusTotal/yara-python) and `capstone 3.0.0 or later` [](https://www.capstone-engine.org/download.html)[https://www.capstone-engine.org/download.html](https://www.capstone-engine.org/download.html).

Once you have your dependencies sorted, you can clone the repository from GitHub.

Command used: `git clone https://github.com/volatilityfoundation/volatility3.git`

You now have Volatility installed!

To test your installation run the `vol.py` file with the help parameter.

Command used: `python3 vol.py -h`

It is important to note that for any Linux or Mac memory files, you will need to download the symbol files from the Volatility GitHub. [https://github.com/volatilityfoundation/volatility3#symbol-tables](https://github.com/volatilityfoundation/volatility3#symbol-tables)




---

## **<mark style="background: #DAB10C;">Plugins</mark>**

Image profiles can be hard to determine if you don't know exactly what version and build the machine you extracted a memory dump from was. In some cases, you may be given a memory file with no other context, and it is up to you to figure out where to go from there. In that case, Volatility has your back and comes with the `imageinfo` <mark style="background: #ED7506;">plugin</mark>. This plugin will take the provided memory dump and assign it a list of the best possible OS profiles. OS profiles have since been deprecated with Volatility3, so we will only need to worry about identifying the profile if using Volatility2; this makes life much easier for analyzing memory dumps.


> Note: `imageinfo` is not always correct and can have varied results depending on the provided dump; use with caution and test multiple profiles from the provided list.

If we are still looking to get information about what the host is running from the memory dump, we can use the following three plugins `windows.info` `linux.info` `mac.info`. This plugin will provide information about the host from the memory dump.

Syntax: `python3 vol.py -f <file> windows.info`


---


# **<mark style="background: #e74c3c;">List Processes & Connections:</mark>**

The most basic way of listing processes is using `pslist`; this plugin will get the list of processes from the doubly-linked list that keeps track of processes in memory, equivalent to the process list in task manager. The output from this plugin will include all current processes and terminated processes with their exit times.

> Syntax: `python3 vol.py -f <file> windows.pslist`

---

Some malware, typically rootkits, will, in an attempt to hide their processes, unlink itself from the list. By unlinking themselves from the list you will no longer see their processes when using `pslist`. To combat this evasion technique, we can use `psscan`;this technique of listing processes will locate processes by finding data structures that match `_EPROCESS`. While this technique can help with evasion countermeasures, <mark style="background: #FF5582A6;">**it can also cause false positives.**</mark>

> Syntax: `python3 vol.py -f <file> windows.psscan`

---

The third process plugin, `pstree`, does not offer any other kind of special techniques to help identify evasion like the last two plugins; however, this plugin will list all processes based on their parent process ID, using the same methods as `pslist`. This can be useful for an analyst **<mark style="background: #00CDFF82;">to get a full story of the processes</mark>** and what may have been occurring at the time of extraction.

> Syntax: `python3 vol.py -f <file> windows.pstree`

---


Now that we know how to identify processes, we also need to have a way to identify the network connections present at the time of extraction on the host machine. `netstat` will attempt to identify all memory structures with a network connection.

> Syntax: `python3 vol.py -f <file> windows.netstat`

---


This command in the current state of volatility3 can be very unstable, particularly around old Windows builds. To combat this, you can utilize other tools like bulk_extractor to extract a PCAP file from the memory file. In some cases, this is preferred in network connections that you cannot identify from Volatility alone. [https://tools.kali.org/forensics/bulk-extractor](https://tools.kali.org/forensics/bulk-extractor)



The last plugin we will cover is `dlllist`. This plugin will list all DLLs associated with processes at the time of extraction. This can be especially useful once you have done further analysis and can filter output to a specific DLL that might be an indicator for a specific type of malware you believe to be present on the system.

> Syntax: `python3 vol.py -f <file> windows.dlllist`




---

# **Hunting and Detection Capabilities**

Volatility offers a plethora of plugins that can be used to aid in your hunting and detection capabilities when hunting for malware or other anomalies within a system's memory.

It is recommended that you have a basic understanding of how evasion techniques and various malware techniques are employed by adversaries, as well as how to hunt and detect them before going through this section.

The first plugin we will be talking about that is one of the most useful when hunting for code injection is `malfind`. <mark style="background: #8e44ad;">This plugin will attempt to identify injected processes and their PIDs along with the offset address and a Hex, Ascii, and Disassembly view of the infected area.</mark> The plugin works by scanning the heap and identifying processes that have the executable bit set `RWE or RX` and/or no memory-mapped file on disk (file-less malware).

Based on what `malfind` identifies, the injected area will change. An MZ header is an indicator of a Windows executable file. The injected area could also be directed towards shellcode which requires further analysis.

> Syntax: `python3 vol.py -f <file> windows.malfind`

Volatility also offers the capability to compare the memory file against YARA rules. `yarascan` will search for strings, patterns, and compound rules against a rule set. You can either use a YARA file as an argument or list rules within the command line.

> Syntax: `python3 vol.py -f <file> windows.yarascan`




---

# **Advanced Memory 4n6**

Advanced Memory Forensics can become confusing when you begin talking about system objects and how malware interacts directly with the system, especially if you do not have prior experience hunting some of the techniques used such as hooking and driver manipulation. When dealing with an advanced adversary, you may encounter malware, most of the time rootkits that will employ very nasty evasion measures that will require you as an analyst to dive into the drivers, mutexes, and hooked functions. A number of modules can help us in this journey to further uncover malware hiding within memory.

The first evasion technique we will be hunting is hooking; there are five methods of hooking employed by adversaries, outlined below:

- SSDT Hooks
- IRP Hooks
- IAT Hooks
- EAT Hooks
- Inline Hooks

We will only be focusing on hunting SSDT hooking as this one of the most common techniques when dealing with malware evasion and the easiest plugin to use with the base volatility plugins.

The `ssdt` plugin will search for hooking and output its results. Hooking can be used by legitimate applications, so it is up to you as the analyst to identify what is evil. As a brief overview of what SSDT hooking is: `SSDT` stands for ***<mark style="background: #ED7506;">System Service Descriptor Table</mark>***;_ the Windows kernel uses this table to look up system functions. An adversary can hook into this table and modify pointers to point to a location the rootkit controls.

There can be hundreds of table entries that `ssdt` will dump; you will then have to analyze the output further or compare against a baseline. A suggestion is to use this plugin after investigating the initial compromise and working off it as part of your lead investigation.

> Syntax: `python3 vol.py -f <file> windows.ssdt` 

Adversaries will also use malicious driver files as part of their evasion. Volatility offers two plugins to list drivers.

The `modules` plugin will dump a list of loaded kernel modules; this can be useful in identifying active malware. However, if a malicious file is idly waiting or hidden, this plugin may miss it.

This plugin is best used once you have further investigated and found potential indicators to use as input for searching and filtering.

> Syntax: `python3 vol.py -f <file> windows.modules`

The `driverscan` plugin will scan for drivers present on the system at the time of extraction. This plugin can help to identify driver files in the kernel that the `modules` plugin might have missed or were hidden.

As with the last plugin, it is again recommended to have a prior investigation before moving on to this plugin. It is also recommended to look through the `modules` plugin before `driverscan`.

> Syntax: `python3 vol.py -f <file> windows.driverscan`

In most cases, `driverscan` will come up with no output; however, if you do not find anything with the `modules` plugin, it can be useful to attempt using this plugin.

There are also other plugins listed below that can be helpful when attempting to hunt for advanced malware in memory.

- `modscan`
- `driverirp`
- `callbacks`
- `idt`
- `apihooks`
- `moddump`
- `handles` https://volatility3.readthedocs.io/en/latest/volatility3.plugins.windows.handles.html

Note: Some of these are only present on Volatility2 or are part of third-party plugins. To get the most out of Volatility, you may need to move to some third-party or custom plugins.



---

# **Advanced Windows Plugins:**


| Windows.cmdline           | Lists process command line arguments                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| windows.drivermodule      | Determines if any loaded drivers were hidden by a rootkit                                               |
| Windows.getsids           | Print the SIDs owning each process                                                                      |
| Windows.handles           | Lists process open handles                                                                              |
| Windows.info              | Show OS & kernel details of the memory sample being analyzed                                            |
| Windows.netscan           | Scans for network objects present in a particular Windows memory image                                  |
| Widnows.netstat           | Traverses network tracking structures present in a particular Windows memory image.                     |
| Windows.pslist            | Lists the processes present in a particular Windows memory image                                        |
| Windows.pstree            | List processes in a tree based on their parent process ID                                               |
| `windows.mftscan.MFTScan` | more detailed information like when the file was accessed or modified                                   |
| `Windows.filescan`        | Scans for file objects present in a particular Windows memory image.<br>Scans for Alternate Data Stream |
| `windows.memmap`          |                                                                                                         |

### **How to use windows.memmap to dump the memory region corresponding to any process:**


Let's get information on the process. There are several ways to examine memory, but we will continue using volatility. This time, we will dump the memory region corresponding to `updater.exe` , and examine it.  

 To accomplish the above, we'll use the plugin `windows.memmap`. This time, we'll specify the output dir with the `-o` switch. In this case, we will use the same directory denoted by the character " `.` "and the option `--dump` followed by the option `--pid` and the PID of the process, which in the case of updater.exe is.

`vol -f memdump.mem -o . windows.memmap --dump --pid 1612`

When the command above is finished, we will have a file with an extension `.dmp` in our working directory.

Examining the file is difficult since it contains non-printable characters, so we'll use the strings command to analyze the output better. Since we have the file strings available to us now, we could look for key patterns like `HTTP` or `key` or any pattern that can lead us quickly to an artefact. Another way to scroll the terminal is by using the `strings` command piped to `less` to navigate through the output as shown in the command output below.



# **Examples:**


## **Extract user agents GET or POST REQUESTS: **


	 thmanalyst@ubuntu:~$ vol -f /Scenarios/Investigations/Investigation-1.vmem -o /home/thmanalyst/ windows.memmap.Memmap --pid 1640 --dump