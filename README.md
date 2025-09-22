# Network Scan — Task 1

## Overview
**Objective:** Perform a local network port scan to discover devices and open ports using Nmap.  
**Tools used:** Nmap, (optional) Wireshark.

## My Environment
- My machine IP: `192.168.1.15`  ``` ip address is for example ```
- Network range scanned: `192.168.1.0/24`  
- OS: Windows 10 (example)  
- Nmap version: 7.92 (example)

## Commands I ran
**Basic SYN scan across network**
```
nmap -sS 192.168.1.0/24 -oN scan_results.txt -oX scan_results.xml
```

**Service/version detection on a host**
```
nmap -sS -sV 192.168.1.10 -oN host_detail.txt
```

**(Optional) Faster network scan**
```
nmap -sS -T4 192.168.1.0/24 -oN fast_scan.txt
```

**Converted XML to HTML (if available)**
```
xsltproc scan_results.xml -o scan_results.html
```

## Files included
- `scan_results.txt` — full Nmap output (human readable)  
- `scan_results.xml` — raw XML output from Nmap  
- `scan_results.html` — (optional) HTML view of the XML  
- `host_detail.txt` — detailed output for interesting hosts (if any)  
- `screenshots/` — terminal and Wireshark screenshots  
- `findings.md` — short summary of findings & mitigations

## Summary of steps I followed
1. Installed Nmap (and Wireshark optionally).  
2. Found my local IP and determined network range.  
3. Ran Nmap SYN scan on the network and saved results.  
4. Investigated hosts with open ports using `-sV` and saved details.  
5. (Optional) Captured packets with Wireshark while scanning and saved screenshots.  
6. Wrote this README + findings and pushed to GitHub.

## Notes on safety and permission
All scans were performed only on devices I own or have permission to scan. Do not scan networks you do not own.

## Next steps / recommendations
- Close unused services and ports.  
- Apply firewall rules to restrict access.  
- Use SSH keys instead of passwords for SSH.  
- Keep services updated and restrict admin interfaces to local/VPN access.
