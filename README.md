# NetExec Bulk Credential Checker

## 🔍 About

This script automates **netexec (nxc)** to bulk-check all supported services on a given target using provided credentials.  
It intelligently skips closed ports to save time and includes a configurable delay between checks to avoid overwhelming the network or triggering lockouts.

---

## 🛠️ Features

- ✅ Checks all available netexec-supported services
- ⚡ Skips services with closed ports (using a fast `/dev/tcp` pre-check)
- 🧪 Verifies credentials across multiple protocols
- ⏱️ Customizable delay between service checks
- 🚫 Avoids unnecessary timeout waits for closed services

---

## 🧾 Usage

```bash
./auto_netexec_bulk_creds_checker.sh <target> <username> <password>
