#! /bin/sh

#System Specs: CPU Architecture Info, Free and used Physical Memory, mounted partitions, unmounted partitions, Hostname and Domain Name
echo "CPU Architecture Info"
lscpu
echo

echo "Amount of free and used physical memory:"
free
echo

echo "All Partition Information:"
lsblk
echo

echo "Partition Information W/ Disk Space Usage"
df
echo

echo "Hostname:"
hostname
echo

echo "Domainname:"
domainname
echo

#Network: MAC address for all interfaces, IP Addresses (4 and 6) for all interfaces, deterime whether a network interface is running in promiscious mode, established network connections
echo "Network Information (IPv4, IPv6, MAC, Promiscious Mode)"
ifconfig
echo

echo "Established network connections:"
lsof -i4
echo

#OS Version: Operating-System Info, Processor, Kernel Version
echo "Operating-System Info:"
cat /etc/os-release
echo

echo "Processor type:"
uname -p
echo

echo "Kernel Information"
uname -srv
echo

#Processes and open files: List all processes to check for unusual and suspicious processes and services, list all files opened by nc, list all opened but unlinked files (deleted)
echo "Listing Processes:"
ps -eaf
echo

echo "Files opened by Netcat (NC):"
lsof -i | grep "netcat\|nc"
echo

echo "All opened but unlinked (deleted) files:"
lsof | grep "(deleted)"
echo

#Users: Currently Logged In Users, List of users who have logged in and out, list all users with uid=0, list all root-owned SUID files
echo "Currently logged in users:"
who
echo

echo "List of users who have logged in and out:"
last
echo

echo "List of all users with uid=0:"
cat /etc/passwd | grep x:0:
echo

echo "All root-owned SUID files:"
find / -uid 0 -perm -4000 2>/dev/null
echo

# #Time: Current date, time, and timezone of system
echo "Current date, time, and timezone:"
date
echo

echo "PC uptime"
uptime
echo

#Misc: Find file in your home directory that has been modified within 1 day, check for any scheduled tasks for root. 3 custom. 1) 2) 3)
echo "File(s) in home directory that have been modified within 1 day:"
find /home -type f -mtime -1 -print 
echo

echo "Scheduled tasks for root:"
sudo crontab -l -u root
echo

#1) SSH Log
echo "Log of SSH related actions:"
journalctl -u ssh
echo

#2) Currently loaded kernel modules
echo "All the currently loaded kernel modules:"
lsmod
echo

#3) History of sudo Usage
echo "History of sudo usage:"
cat /var/log/auth.log | grep sudo
echo


