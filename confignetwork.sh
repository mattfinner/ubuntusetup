#!/bin/bash
# arg 1 == VM name
# arg 2 == template IP address
# arg 3 == new IP address
# arg 4 == new DNS server

#set host name
echo $1 > /etc/hostname
sed -i "s/TEMPLATE/'$1'/g" /etc/hosts

#change ipaddress
sed -i "s/'$2'/'$3'/g" /etc/network/interfaces

#set additional DNS
sed -i "s/dns-nameserver 8.8.8.8 8.8.4.4/dns-nameserver 8.8.8.8 8.8.4.4 '$4'/g" /etc/network/interfaces
