iptables -I INPUT 1 -i lo -j ACCEPT

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-uncreachable -j ACCEPT

iptables -A INPUT -p tcp -s 100.64.0.0/16 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 10.21.32.0/24 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 198.18.0.0/16 --dport 22 -j ACCEPT


