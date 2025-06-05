#!/bin/bash

# Usage check
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <target> <username> <password>"
  echo "Example: $0 target 'user' 'password'"
  exit 1
fi

# Strip quotes if given
strip_quotes() {
  echo "$1" | sed "s/^'//;s/'$//"
}

TARGET=$(strip_quotes "$1")
USER=$(strip_quotes "$2")
PASS=$(strip_quotes "$3")

# Delay between checks (seconds)
DELAY_BETWEEN=1

#all available nxc services: mssql,smb,ftp,ldap,nfs,rdp,ssh,vnc,winrm,wmi
# Common ports per protocol
declare -A PORTS=(
  [smb]=445
  [mssql]=1433
  [ftp]=21
  [ldap]=389
  [nfs]=2049
  [rdp]=3389
  [ssh]=22
  [vnc]=5900
  [winrm]=5985
  [wmi]=135
)

# Check if port is open (fast scan using /dev/tcp)
is_port_open() {
  timeout 1 bash -c "echo > /dev/tcp/$1/$2" 2>/dev/null
}

# Run through all protocols
for proto in "${!PORTS[@]}"; do
  PORT=${PORTS[$proto]}
  echo -e "\n[*] Checking if $proto port $PORT is open on $TARGET..."

  if is_port_open "$TARGET" "$PORT"; then
    echo "[+] Port $PORT open — checking $proto with netexec"
    nxc $proto "$TARGET" -u "$USER" -p "$PASS"
  else
    echo "[-] Skipping $proto — port $PORT is closed"
  fi

  sleep "$DELAY_BETWEEN"
done
