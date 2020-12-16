function comp_sys {
Get-WmiObject Win32_computersystem | select-object Description | Format-List
}
comp_sys

function os {
Get-WmiObject Win32_operatingsystem | select-object Name, Version | Format-List
}
os

function processor {
Get-WmiObject Win32_processor | select-object Description, CurrentClockSpeed, NumberOfCores, L1CacheSize, L2CacheSize, L3CacheSize | Format-List
if ( $L2CacheSize = Out-Null ) {
"Data Unavailable"
}
}
processor


function memory {
$totalcapacity = 0
Get-WmiObject -class Win32_physicalmemory | 
foreach {
New-Object -TypeName psobject -Property @{
Manufacturer = $_.manufacturer
Description = $_.description
"Size(MB)" = $_.capacity/1mb
Bank = $_.banklabel
Slot = $_.devicelocator
}
$totalcapacity += $_.capacity/1mb
} |
ft -auto Manufacturer,Description,"Size(MB)",Bank,Slot
"Total RAM:${totalcapacity}MB"
}
memory

function drives{
$diskdrives = Get-CimInstance CIM_diskdrive
foreach ($disk in $diskdrives) {
$partitions = $disk | Get-CimAssociatedInstance -ResultClassName CIM_diskpartition
foreach ($partition in $partitions) {
$logicaldisks = $partition | Get-CimAssociatedInstance -ResultClassName CIM_logicaldisk
foreach ($logicaldisk in $logicaldisks) {
new-object -typename psobject -Property @{
Manufacturer = $disk.Manufacturer
Model = $disk.Model
"SIze(GB)" = $disk.size/1GB -as [int]
"DiskSize(GB)" = $logicaldisk.Size/1GB -as [int]
"FreeSpace(GB)" = $logicaldisk.FreeSpace/1GB -as [int]
"Free(%)" = [int]($logicaldisk.FreeSpace*100/$logicaldisk.Size)
 } | Format-Table
 }
 }
 }
}
drives

function network {
get-ciminstance Win32_networkadapterconfiguration | where-object ipenabled | select-object Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder | Format-Table -AutoSize
}
network

function video {
Get-WmiObject Win32_videocontroller | select-object Description, Manufacturer, VideoModeDecription | Format-List
}
video