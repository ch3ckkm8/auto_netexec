#!/bin/bash

TARGET=""
USER=""
PASS=""

for proto in mssql ssh winrm smb ftp ldap rdp; do
  echo "[*] Checking $proto on $TARGET"
  nxc $proto $TARGET -u "$USER" -p "$PASS"
done
