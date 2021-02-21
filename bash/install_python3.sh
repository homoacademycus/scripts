echo -n "enter vesion:"
read version
yum install -y python$version
ln -s /usr/bin/python$version /usr/bin/python3
python3 --version

