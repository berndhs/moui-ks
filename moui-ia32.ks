# -*-mic2-options-*- -f livecd -*-mic2-options-*-

# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
timezone --utc America/Toronto
part / --size 2200 --ondisk sda --fstype=ext3
rootpw meego 
xconfig --startxonboot
bootloader  --timeout=0  --append="quiet" 
desktop --autologinuser=meego  --defaultdesktop=MeeGo Tablet --session="/usr/bin/startx"
user --name meego  --groups audio,video --password meego 

repo --name=oss --baseurl=http://repo.meego.com/MeeGo/builds/1.2.0.90/latest/repos/oss/ia32/packages --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=non-oss --baseurl=http://repo.meego.com/MeeGo/builds/1.2.0.90/latest/repos/non-oss/ia32/packages --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego

%packages --

@MeeGo Core
@MeeGo Compliance
@MeeGo Tablet
@MeeGo Tablet Desktop
@MeeGo Base Development
@MeeGo Tablet Applications

kernel

%end

%post

%end

%post --nochroot

%end
