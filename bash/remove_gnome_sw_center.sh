# SW center
killall gnome-software
apt purge snapd
apt purge gnome-software
rm -r /home/$USERNAME/.local/share/gnome-software
rm -rf `find / -name software-properties-gtk`
rm -rvf /var/lib/apt/lists/*

#apt-add-repository "deb http://archive.canonical.com/ubuntu bionic"
#apt update
#apt install gnome-characters
#apt install gdebi-core libxml2:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386 libatk-$


