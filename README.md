I wanted to be able to save some time when doing OpenVZ installations on Debian 6 for that reason I decided to make a script that simplifies the following things:

    Setup of Swedish mirrors in /etc/apt/sources.list
    apt-get update and apt-get upgrade run.
    Installation of linux-image-openvz-AMD64 vzctl vzquota vzdump nmap harden-servers ifenslave-2.6
    Replaces sysctl.conf with OpenVZ config changes
    Replaces vz.conf with network parameter changes.
    Generates a webui.sh script that downloads the OpenVZ Web panel
    
To install the script do the following:  wget --no-check-certificate https://raw.github.com/waiz88/ovz_install_upgrader/master/ovz_install_upgrader.sh

Then from shell as root: #sh ovz_install_upgrader.sh

Wait for a while until script finishes, then reboot.

After the reboot you need to install the Web Panel for OpenVZ. I tried to do this at the same time as the installation and things would not work correctly. 

#apt-get install ruby1.8 rubygems (may already be installed)
#update-alternatives --set ruby "/usr/bin/ruby1.8"
#update-alternatives --set gem "/usr/bin/gem1.8"

"apt-get remove ruby 1.9.1 or
"apt-get remove ruby 1.9.2 or
"apt-get remove ruby 1.9.3

    Installation is done by root: #sh webui.sh

Now you should be done and should be able to visit your server on https://yourservername_or_ip:3008
