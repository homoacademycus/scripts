echo -n "set username :"
read username

echo -n "set uid :"
read uid

echo $uid
echo $username
groupadd --gid $uid $username
useradd --system --uid $uid --gid $username $username
gpasswd --restrict $username
passwd -l root


