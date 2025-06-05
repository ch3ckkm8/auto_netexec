# NetExec Bulk Credential Checker

## 🔍 About

This script automates **netexec (nxc)** to bulk-check all supported services on a given target using provided credentials.  
It intelligently skips closed ports to save time and includes a configurable delay between checks to avoid overwhelming the network or triggering lockouts.

---

## 🛠️ Requirements
- bash (supports /dev/tcp)
- netexec (nxc) installed and in your PATH
- timeout utility (usually part of coreutils)

---

## 🎯 Features

- ✅ Checks all available netexec-supported services
- ⚡ Skips services with closed ports (using a fast `/dev/tcp` pre-check)
- 🧪 Verifies credentials across multiple protocols
- ⏱️ Customizable delay between service checks
- 🚫 Avoids unnecessary timeout waits for closed services

---

## 🔐 Services Checked

The script checks credentials against the following services, **but only if their respective ports are open** — ensuring speed and efficiency:

| Protocol | Port | Description                              |
|----------|------|------------------------------------------|
| SMB      |  445 | Windows file/printer sharing (CIFS)      |
| MSSQL    | 1433 | Microsoft SQL Server                     |
| FTP      |   21 | File Transfer Protocol                   |
| LDAP     |  389 | Directory service (Active Directory)     |
| NFS      | 2049 | Network File System                      |
| RDP      | 3389 | Remote Desktop Protocol                  |
| SSH      |   22 | Secure Shell                             |
| VNC      | 5900 | Virtual Network Computing                |
| WinRM    | 5985 | Windows Remote Management (PowerShell)   |
| WMI      |  135 | Windows Management Instrumentation       |

> ⚠️ **Note:** If a port is closed, that protocol is automatically skipped to reduce scan time.

---

## 🧾 Usage

```bash
./auto_netexec_bulk_creds_checker.sh <target> <username> <password>
```
---

## 📂 Example Output

```bash
[*] Checking if smb port 445 is open on fluffy.htb...
[+] Port 445 open — checking smb with netexec

[*] Checking if ssh port 22 is open on fluffy.htb...
[-] Skipping ssh — port 22 is closed
```
