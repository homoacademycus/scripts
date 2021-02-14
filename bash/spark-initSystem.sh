# online shared printer daemon
sudo systemctl stop cups
sudo systemctl disable cups
sudo apt purge cups*
sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed
sudo apt purge cups-browsed
sudo apt purge cups-ipp-utils
sudo rm -rf `sudo find / -name cups`

# mDNS multicast, unicast DNS
sudo systemctl stop avahi-daemon
sudo systemctl disable avahi-daemon
sudo apt purge avahi-daemon
sudo systemctl stop avahi-autoipd
sudo systemctl disable avahi-autoipd
sudo apt purge avahi-autoipd

# crack report daemon
sudo systemctl stop whoopsie
sudo systemctl disable whoopsie
sudo apt purge whoopsie
sudo rm -rf /var/lib/whoopsie

sudo find / evolution-data-server
sudo mv /usr/lib/evolution-data-server /usr/lib/evolution-data-server-disabled
sudo mv /usr/lib/evolution /usr/lib/evolution-disabled

sudo systemctl disable remote-fs.target
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable systemd-timesyncd.service 
sudo systemctl disable fwupd.service
sudo systemctl disable geoclue.service
sudo systemctl mask geoclue.service

sudo systemctl daemon-reload | systemctl reset-failed

# firewall
sudo ufw stop | sudo ufw disable
sudo apt purge ufw

sudo iptables --flush
sudo iptables -n -v -L
sudo iptables --table filter --append INPUT --in-interface lo --jump ACCEPT

sudo iptables --append INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables --append INPUT --protocol tcp --tcp-flags ALL NONE -j DROP
sudo iptables --append INPUT --protocol tcp ! --syn -m state --state NEW -j DROP
sudo iptables --append INPUT --protocol tcp --tcp-flags ALL ALL -j DROP

# ssh
sudo iptables --append INPUT --protocol tcp --match tcp --dport 22 -j ACCEPT

sudo ip6tables -A INPUT -i lo -j ACCEPT
sudo ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

sudo iptables --table filter --policy INPUT DROP
sudo iptables --table filter --policy FORWARD DROP

sudo ip6tables --table filter --policy INPUT DROP
sudo ip6tables --table filter --policy INPUT DROP

sudo iptables -A OUTPUT -j ACCEPT
sudo ip6tables -A OUTPUT -j ACCEPT

sudo apt install iptables-persistent netfilter-persistent






