## To install Nessus:
1. Get the lisence on ur email and get the deb file with this:  
> `curl --request GET \
> --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.8.3-ubuntu1604_amd64.deb' \
> --output 'Nessus-10.8.3-ubuntu1604_amd64.deb'`

 2. Then install the deb file: `sudo apt install ./Nessus-10.8.3-ubuntu1604_amd64.deb`
3. Then follow David Bombal video: https://www.youtube.com/watch?v=Gy-aPBb0djk
---

- To start the service: `sudo systemctl start nessusd.service`  
>**<mark style="background: #8e44ad;">Cool Fact:</mark> the `d` in `nessusd` stands for daemon like `sshd`**
- Then go to this port: `https://127.0.0.1:8843/` 

my creds==> asem:asem


# **WMAP**

is a plugin within MSF... 

### **Usage:**

1. `load wmap`
2. `wmap_<functions>` we have: modules, nodes, run, sites, targets and vulns.
3. `wmap_targets -h`  the -h shows help menu for wmap_targets menu


use what you want...


