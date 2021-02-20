echo -n "set allowed ip:"
read ipaddr
echo -n "set allowed port:"
read port

jupyter lab --ip $ipaddr --port $port --allow-root --no-browser &
