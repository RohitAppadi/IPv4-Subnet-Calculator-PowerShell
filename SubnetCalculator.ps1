Clear-Host

Write-Host "========================================"
Write-Host "        IPv4 Subnet Calculator"
Write-Host "========================================"

$ip = Read-Host "Enter IPv4 Address"
$cidr = [int](Read-Host "Enter CIDR (0-32)")

if ($cidr -lt 0 -or $cidr -gt 32) {
    Write-Host "Invalid CIDR!"
    exit
}

# Convert IP to UInt32
$ipBytes = [System.Net.IPAddress]::Parse($ip).GetAddressBytes()
[Array]::Reverse($ipBytes)
$ipInt = [BitConverter]::ToUInt32($ipBytes,0)

# Create subnet mask
$mask = [uint32]0
for($i=0;$i -lt $cidr;$i++){
    $mask = $mask -bor (1 -shl (31-$i))
}

# Network and Broadcast
$network = $ipInt -band $mask
$broadcast = $network -bor (-bnot $mask)

# Function to convert UInt32 back to IPv4
function ConvertTo-IP($num){
    $bytes = [BitConverter]::GetBytes([uint32]$num)
    [Array]::Reverse($bytes)
    return ([System.Net.IPAddress]::new($bytes)).ToString()
}

$subnetMask = ConvertTo-IP $mask
$networkIP = ConvertTo-IP $network
$broadcastIP = ConvertTo-IP $broadcast

if($cidr -lt 31){
    $firstHost = ConvertTo-IP ($network + 1)
    $lastHost = ConvertTo-IP ($broadcast - 1)
    $usableHosts = [math]::Pow(2,(32-$cidr))-2
}
else{
    $firstHost = "N/A"
    $lastHost = "N/A"
    $usableHosts = 0
}

Write-Host ""
Write-Host "=============== RESULTS ==============="
Write-Host "IP Address        : $ip"
Write-Host "CIDR              : /$cidr"
Write-Host "Subnet Mask       : $subnetMask"
Write-Host "Network Address   : $networkIP"
Write-Host "Broadcast Address : $broadcastIP"
Write-Host "First Host        : $firstHost"
Write-Host "Last Host         : $lastHost"
Write-Host "Usable Hosts      : $usableHosts"
Write-Host "======================================="