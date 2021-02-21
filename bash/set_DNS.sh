sudo apt install -y bind9
sudo apt install -y bind9utils
sudo cat ./config/named.conf.local > /etc/bind/named.conf.local
sudo cat ./config/named.conf.options > /etc/bind/named.conf.options
sudo cat ./config/db.234.234.234 > /etc/bind/db.234.234.234
sudo cat ./config/db.server.atti > /etc/bind/db.server.atti
named-checkzone server.atti /etc/bind/db.server.atti
named-checkzone 234.234.234.in-addr.arpa /etc/bind/db.234.234.234
nslookup server.atti
