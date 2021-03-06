# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
timezone --utc America/Toronto
part / --size 1700 --ondisk sda --fstype=ext3
rootpw meego 
xconfig --startxonboot
bootloader --timeout=80 --append="quiet"
desktop --autologinuser=meego  --defaultdesktop=DUI --session="/usr/bin/mcompositor"
user --name meego  --groups audio,video --password meego 

repo --name=1.2-oss --baseurl=http://download.meego.com/snapshots/1.2.0.90.7.20110706.4/repos/oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=1.2-non-oss --baseurl=http://download.meego.com/snapshots/1.2.0.90.7.20110706.4/repos/nooss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meegorepo --name=berndhs --baseurl=http://repo.pub.meego.com/home:/earthling/meego_current_extras/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-deploy --baseurl=http://repo.pub.meego.com/home:/earthling:/deploy/meego_current_Core/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego

%packages

@MeeGo Core
@X for Netbooks
@Minimal MeeGo X Window System
@MeeGo Compliance
@MeeGo Touch

kernel

instalateur

vim-enhanced
vim-X11
zypper
sudo
openssh
openssh-clients
openssh-server

%end

%post
# save a little bit of space at least...
rm -f /boot/initrd*

rm -f /var/lib/rpm/__db*
rpm --rebuilddb


%end

%post --nochroot
if [ -n "$IMG_NAME" ]; then
    echo "BUILD: $IMG_NAME" >> $INSTALL_ROOT/etc/meego-release
fi


%end
