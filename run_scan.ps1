# PowerShell script to run nmap and save outputs
param(
    [string]$Net = "192.168.1.0/24"
)
$timestamp = Get-Date -Format "yyyyMMdd_HHmm"
$outdir = "scan_$timestamp"
New-Item -Path $outdir -ItemType Directory | Out-Null
Set-Location $outdir

nmap -sS $Net -oN scan_results.txt -oX scan_results.xml

Select-String -Path scan_results.txt -Pattern "open" | Out-File open_ports_summary.txt
Get-ChildItem
