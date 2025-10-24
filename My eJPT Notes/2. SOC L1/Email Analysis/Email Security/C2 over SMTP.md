
### ***Now we'll take a look at how SMTP has been abused by adversaries for C2 (Command and Control) communications.*** 

# **MITRE ATT&CK**:

- **Technique 1071 > Sub-Technique 3**: [https://attack.mitre.org/techniques/T1071/003/](https://attack.mitre.org/techniques/T1071/003/)

Per MITRE, "_Adversaries may communicate using application layer protocols associated with electronic mail delivery to avoid detection/network filtering by blending in with existing traffic. Commands to the remote system, and often the results of those commands, will be embedded within the protocol traffic between the client and server._"

## Several notable groups, such as **APT 28**, **APT 32**, and **Turla**, to name a few, have used this technique.

# **Recommended mitigation (per MITRE)**: 

"_Network intrusion detection and prevention systems that use network signatures to identify traffic for specific adversary malware can be used to mitigate activity at the network level._"

# **Detection opportunity (per MITRE)**:

"_Analyze packet contents to detect application layer protocols that do not follow the expected protocol standards regarding syntax, structure, or any other variable adversaries could leverage to conceal data._"