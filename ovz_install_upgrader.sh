#!/bin/sh

# -----------Sources.list section starts 

# create a new /etc/apt/sources.list
# My mirror is Swedish
# echo "deb http://ftp.se.debian.org/debian stable main contrib non-free"
# deb-src http://ftp.se.debian.org/debian stable main contrib non-free

# deb http://ftp.debian.org/debian/ squeeze-updates main contrib non-free
# deb-src http://ftp.debian.org/debian/ squeeze-updates main contrib non-free

# deb http://security.debian.org/ squeeze/updates main contrib non-free
# deb-src http://security.debian.org/ squeeze/updates main contrib non-free

echo "Fetching sources.list from github"
wget -O /tmp/sources.list https://raw.github.com/waiz88/ovz_install_upgrader/master/sources.list --no-check-certificate

echo "moving old sources.list to /tmp as old.sources.list"

mv /etc/apt/sources.list /tmp/old.sources.list

cp /tmp/sources.list /etc/apt/sources.list

# -----------Sources.list section ends

# -----------Update section starts

/usr/bin/apt-get -y update
/usr/bin/apt-get -y upgrade

/usr/bin/apt-get install -y linux-image-openvz-AMD64 vzctl vzquota vzdump nmap harden-servers ifenslave-2.6

ln -s /var/lib/vz /vz

# Install Ovz-web-panel from Google Code.
echo "#!/bin/sh" > webui.sh
echo "wget  --no-check-certificate -O - http://ovz-web-panel.googlecode.com/svn/installer/ai.sh | sh" >> webui.sh
echo "/etc/init.d/owp stop" >> webui.sh
echo "wget  --no-check-certificate -O /tmp/owp.conf https://raw.github.com/waiz88/ovz_install_upgrader/master/owp.conf" >> webui.sh 
echo "cp /tmp/owp.conf /etc/owp.conf" >> webui.sh
echo "/etc/init.d/owp start" >> webui.sh


wget  --no-check-certificate -O /tmp/sysctl.conf https://raw.github.com/waiz88/ovz_install_upgrader/master/sysctl.conf
echo "Over writing /etc/sysctl.conf"
cp /tmp/sysctl.conf /etc/sysctl.conf

wget  --no-check-certificate -O /tmp/vz.conf https://raw.github.com/waiz88/ovz_install_upgrader/master/vz.conf
echo "Over writing /etc/vz/vz.conf"
cp /tmp/vz.conf /etc/vz/vz.conf
echo ""
echo "Patching of Debian 6 installation is finished + removal of nfs + portmap daemon. Installation of OpenVZ + nmap + harden-server + ifenslave (bonding)"
echo "Reboot your system now and run webui.sh script after the reboot to install the OpenVZ web interface."
