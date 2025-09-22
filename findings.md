# Findings and Recommended Mitigations

## Scan details
- Network range scanned: `192.168.1.0/24`
- Date & time: 2025-09-22 12:00
- Nmap command used: `nmap -sS 192.168.1.0/24 -oN scan_results.txt -oX scan_results.xml`

## Key findings (example)
- **192.168.1.10**
  - Open ports: 22/tcp (ssh), 80/tcp (http)
  - Service details: OpenSSH 8.2p1; Apache httpd 2.4.41
  - Risk: SSH exposed to network; HTTP running with default configuration
  - Mitigation: Use SSH keys, disable password authentication, restrict SSH by firewall; secure web server, patch, remove unnecessary modules.

- **192.168.1.12**
  - Open ports: 3389/tcp (rdp)
  - Risk: RDP exposed — risk of unauthorized remote access
  - Mitigation: Disable RDP if unused; otherwise restrict to VPN or specific IPs, enable Network Level Authentication and strong passwords.

- **192.168.1.20**
  - Open ports: 3306/tcp (mysql)
  - Risk: Database exposed
  - Mitigation: Bind DB to localhost, use firewall rules, require authentication, avoid default accounts.

## General recommendations
- Close unnecessary services and ports.  
- Implement firewall rules to restrict which IPs can access sensitive services.  
- Keep all software up to date and patch known vulnerabilities.  
- Use strong authentication methods (SSH keys, MFA where possible).  
- Limit management interfaces (RDP, SSH, web admin panels) to VPN or internal networks only.

## Attachments
- `scan_results.txt` — raw scan output  
- `scan_results.html` — human-friendly HTML report (if generated)  
- `screenshots/` — Wireshark and terminal screenshots
