
Here is a list of essential Snort commands, their arguments, and how to use them.

---

# **Snort Commands & Arguments**


## **Test Configuration**

Use this to validate your `snort.conf` and rules files for any errors before starting the IDS. This is a critical step to ensure Snort will run correctly.

- **Command:** `snort -T -c <config_file>`
    
- **Arguments:**
    
    - **`-T`**: **T**est mode.
        
    - **`-c`**: Specifies the path to the Snort **c**onfiguration file (usually `snort.conf`).
        
- **Usage:**
    
    
    
    ```
    snort -T -c /etc/snort/snort.conf
    ```
    

## **Run in IDS Mode (Live Capture)**

This is the primary operational mode where Snort inspects live network traffic against its rules.

- **Command:** `sudo snort -q -c <config_file> -i <interface> -A console`
    
- **Arguments:**
    
    - **`-q`**: **Q**uiet mode, suppresses the startup banner.
        
    - **`-c`**: Path to the **c**onfiguration file.
        
    - **`-i`**: Specifies the network **i**nterface to listen on (e.g., `eth0`).
        
    - **`-A`**: Sets the **A**lert mode. `console` prints alerts to the screen.
        
- **Usage:**
    
    Bash
    
    ```
    sudo snort -q -c /etc/snort/snort.conf -i eth0 -A console
    ```
    

## **Read a PCAP File**

This mode is for analyzing pre-recorded traffic from a `.pcap` file instead of a live interface. It's perfect for testing rules and incident investigation.

- **Command:** `snort -q -r <pcap_file> -c <rules_file> -n <packet_count>`
    
- **Arguments:**
    
    - **`-r`**: **R**ead from a pcap file.
        
    - **`-c`**: Specifies a **c**onfiguration or simple rules file.
        
    - **`-n`**: Process only a specific **n**umber of packets.
        
- **Usage:**
    
    
    ```
    # Read all packets in a file and show alerts on screen
    snort -q -r traffic.pcap -c local.rules -A console
    
    # Read only the first 100 packets
    snort -q -r traffic.pcap -c local.rules -A console -n 100
    ```
    

##  **Enable Logging**

This tells Snort where and how to save alert data.

- **Command:** `sudo snort -c <config_file> -i <interface> -l <log_dir> -K <log_format>`
    
- **Arguments:**
    
    - **`-l`**: Specifies the **l**ogging directory. Snort will create alert files here.
        
    - **`-K`**: Sets the logging format (**K**ey). Common formats include `ascii` (human-readable) and `pcap` (creates pcap files for alerted packets).
        
- **Usage:**
    
    Bash
    
    ```
    # Log alerts to the /var/log/snort/ directory in a readable ASCII format
    sudo snort -c /etc/snort/snort.conf -i eth0 -l /var/log/snort/ -K ascii
    ```

## **Enable Live Inline IPS mode:**

	sudo snort -c /local.rules -Q --daq afpacket -i eth0:eth1 -A full



