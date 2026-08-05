# Instructions

This document explains how to set up and run the IPv4 Subnet Calculator using Windows PowerShell.

---

## Requirements

Before running the project, ensure you have:

- Windows 10 or Windows 11
- Windows PowerShell 5.1 or later

---

## Project Setup

Clone the repository or download the project files.

Navigate to the project directory using PowerShell:

```powershell
cd C:\Users\<username>\Desktop\Subnet-Calculator
```

---

## PowerShell Execution Policy

When running PowerShell scripts for the first time, Windows may block script execution and display the following message:

```text
running scripts is disabled on this system
```

To allow locally created PowerShell scripts to run:

1. Open **Windows PowerShell as Administrator**.
2. Execute the following command:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

3. When prompted, type:

```text
Y
```

4. Verify the execution policy:

```powershell
Get-ExecutionPolicy
```

Expected output:

```text
RemoteSigned
```

> **Note:** This setting only allows locally created PowerShell scripts to run. Downloaded scripts must still be digitally signed.

---

## Running the Application

From the project directory, execute:

```powershell
.\SubnetCalculator.ps1
```

---

## Example Input

```text
Enter IPv4 Address: 192.168.206.126
Enter CIDR (0-32): 24
```

---

## Example Output

```text
=============== RESULTS ===============

IP Address        : 192.168.206.126
CIDR              : /24
Subnet Mask       : 255.255.255.0
Network Address   : 192.168.206.0
Broadcast Address : 192.168.206.255
First Host        : 192.168.206.1
Last Host         : 192.168.206.254
Usable Hosts      : 254

=======================================
```

---

## Troubleshooting

### Script execution is disabled

If PowerShell displays:

```text
running scripts is disabled on this system
```

Run:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

and execute the script again.

---

### Incorrect Input

Ensure that:

- The IPv4 address is valid (e.g., `192.168.1.1`)
- The CIDR value is between **0** and **32**

---

## Project Files

```text
Subnet-Calculator/
│
├── Screenshots/
├── INSTRUCTIONS.md
├── IPv4_Subnet_Calculator_Writeup.pdf
├── README.md
└── SubnetCalculator.ps1
```

---

For a detailed explanation of the project implementation and methodology, refer to **IPv4_Subnet_Calculator_Writeup.pdf**.