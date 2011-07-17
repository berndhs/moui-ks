# -*-mic2-options-*- -f livecd -*-mic2-options-*-

# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
timezone --utc America/Los_Angeles
part / --size 3000 --ondisk sda --fstype=ext3
rootpw meego 
xconfig --startxonboot
bootloader --timeout=0 --append="quiet"
desktop --autologinuser=meego  
user --name meego  --groups audio,video --password meego 

repo --name=1.2-oss --baseurl=http://download.meego.com/snapshots/1.2.0.90.8.20110712.5/repos/oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=1.2-non-oss --baseurl=http://download.meego.com/snapshots/1.2.0.90.8.20110712.5/repos/non-oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/ --save

repo --name=berndhs --baseurl=http://repo.pub.meego.com/home:/earthling/meego_current_extras/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-deploy --baseurl=http://repo.pub.meego.com/home:/earthling:/deploy/meego_current_Core/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego

%packages

@MeeGo Base Development
@Base Double Byte IME Support
@MeeGo Compliance
@MeeGo Core
@MeeGo X Window System
@X for Netbooks
@MeeGo Netbook
@MeeGo Netbook Desktop
@Development Tools
@Printing
@Games

kernel-adaptation-pinetrail
-installer
instalateur

chromium
adobe-release
flash-plugin
%end

%post
# save a little bit of space at least...
rm -f /boot/initrd*

# Prelink can reduce boot time
if [ -x /usr/sbin/prelink ]; then
    /usr/sbin/prelink -aRqm
fi

rm -f /var/lib/rpm/__db*
rpm --rebuilddb


%end

%post --nochroot
if [ -n "$IMG_NAME" ]; then
    echo "BUILD: $IMG_NAME" >> $INSTALL_ROOT/etc/meego-release
fi


%end
