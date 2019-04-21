#!/bin/bash

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT

iptables -A INPUT -p tcp -s 100.64.0.0/16 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 10.21.32.0/24 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 198.18.0.0/16 --dport 22 -j ACCEPT

iptables -P INPUT DROP
iptables -P FORWARD ACCEPT

service iptables save


