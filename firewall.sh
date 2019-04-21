#!/bin/bash

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT

if ["$1" != "E"]
	then
		iptables -A INPUT -p tcp -s 100.64.0.0/16 --dport 22 -j ACCEPT
		iptables -A INPUT -p tcp -s 10.21.32.0/24 --dport 22 -j ACCEPT
		iptables -A INPUT -p tcp -s 198.18.0.0/16 --dport 22 -j ACCEPT
fi

iptables -P INPUT DROP

if ["$1" == "A"]
	then
		iptables -P FORWARD ACCEPT

else
	iptables -P FORWARD DROP
fi

service iptables save


