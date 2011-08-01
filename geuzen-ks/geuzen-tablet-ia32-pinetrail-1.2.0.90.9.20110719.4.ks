# -*-mic2-options-*- -f livecd -*-mic2-options-*-

# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
#timezone --utc America/New_York
timezone --utc UTC
part / --size 3000 --ondisk sda --fstype=ext3
rootpw live 
xconfig --startxonboot
bootloader --timeout=50 --append="quiet"
desktop --autologinuser=meego  
user --name meego  --groups audio,video --password live 

repo --name=1.2-oss --baseurl=http://download.meego.com/snapshots/1.2.0.90.9.20110719.4/repos/oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=1.2-non-oss --baseurl=http://download.meego.com/snapshots/1.2.0.90.9.20110719.4/repos/non-oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386 --save

repo --name=berndhs --baseurl=http://repo.pub.meego.com/home:/earthling/meego_current_extras/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-deploy --baseurl=http://repo.pub.meego.com/home:/earthling:/deploy/meego_current_Core/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-ux --baseurl=http://repo.pub.meego.com/home:/earthling:/ux/meego_current_Core/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-local --baseurl=http://berndhs.dyndns-home.com/Repos/Geuzen/MeeGo/current/ --save --source

%packages

@MeeGo Core
@MeeGo X Window System
#@MeeGo Tablet

# tablet stuff
bluetooth-qt
buteo-sync-plugin-google
connman-qt
contextkit-meego
contextkit-meego-battery-upower
fuse-libs
gst-plugins-bad-free
gst-plugins-base
gst-plugins-farsight
libcmtspeech-ifx
libical
libmeegotouch
libmeegouxsharingclient
libmeegouxsharingserviceplugin
libqmfclient1
libqmfmessageserver1
libqmfutil1
libsocialweb-keys
meego-handset-sound-theme
meego-qml-launcher
meego-ux-appgrid
meego-ux-components
meego-ux-compositor
meego-ux-content
meego-ux-content-socialweb
meego-ux-media
meego-ux-media-content
meego-ux-settings
meego-ux-settings-libsettings
meego-ux-settings-socialweb
meego-ux-sharing
meego-ux-sharing-email
meego-ux-sharing-qml
meego-ux-sharing-socialweb
meego-ux-translations-de
meego-ux-translations-el
meego-ux-translations-en_GB
meego-ux-translations-en_US
meego-ux-translations-es
meego-ux-translations-fi
meego-ux-translations-fr
meego-ux-translations-it
meego-ux-translations-ja
meego-ux-translations-ko
meego-ux-translations-nl
meego-ux-translations-pl
meego-ux-translations-pt_BR
meego-ux-translations-ru
meego-ux-translations-sv
meego-ux-translations-zh_CN
meego-ux-translations-zh_TW
meego-ux-user-skel
meegotouch-feedback
meegotouch-feedbackreactionmaps
meegotouch-inputmethodengine
meegotouch-inputmethodkeyboard
meegotouch-theme
meegotouch-theme-meego
mlite
mtdev
orientation-contextkit-sensor
qml-gesturearea
qt-qmlviewer
qtgst-qmlsink
tablet-target-config
telepathy-farstream
telepathy-qt4-yell
tumbler
# end tablet stuff
@MeeGo Tablet Applications
@X for Netbooks
@MeeGo Base Development
@Development Tools
@Pinetrail Support

ImageMagick

kernel-adaptation-pinetrail

-installer
instalateur
#flash-plugin
sensorfw-pegatron

-dsme
-libdsme
-libGL

mesa-libGL

-meego-ux-daemon

-meego-ux-panels-music
-meego-ux-panels-video
-meego-ux-panels-web
-meego-ux-panels-mytablet
-meego-ux-panels-friends
-meego-ux-panels-photos
-meego-ux-panels-meta-tablet

geuzen-ux-daemon

geuzen-ux-panels-music
geuzen-ux-panels-video
geuzen-ux-panels-web
geuzen-ux-panels-mytablet
geuzen-ux-panels-friends
geuzen-ux-panels-photos
geuzen-ux-panels-meta-tablet

-meego-ux-theme
geuzen-ux-theme

-generic-backgrounds
-netbook-backgrounds
-netbook-desktop-backgrounds
-desktop-backgrounds-basic

geuzen-backgrounds

burid
zypper
vim
gedit

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

# verify link of flash plugin
if [ -f /usr/lib/flash-plugin/setup ]; then
    sh /usr/lib/flash-plugin/setup install
    rm -f /root/oldflashplugins.tar.gz
fi

echo "DISPLAYMANAGER=\"uxlaunch\"" >> /etc/sysconfig/desktop
echo "user=meego" >> /etc/sysconfig/uxlaunch
echo "session=/usr/bin/mcompositor" >> /etc/sysconfig/uxlaunch


#echo "xopts=-nocursor" >> /etc/sysconfig/uxlaunch


gconftool-2 --direct \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
  -s -t string /meegotouch/target/name tablet

gconftool-2 --direct \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
  -s -t string /meego/ux/theme 1024-600-10

gconftool-2 --direct \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -s -t bool /meego/ux/ShowPanelsAsHome true 

echo "10-pegatron" > /etc/boardname-override
echo "10-pegatron" > /etc/boardname
cp /etc/sensorfw/sensord.conf.d/* /etc/sensorfw/ 

# Work around for eGalax Touchscreen
cp /etc/X11/xorg.conf.d/60-cando-mtev.conf /etc/X11/xorg.conf.d/60-egalax-mtev.conf
sed -i s/"Cando Multi Touch Panel"/"eGalax Touchscreen"/ /etc/X11/xorg.conf.d/60-egalax-mtev.conf
sed -i s/Cando/eGalax/ /etc/X11/xorg.conf.d/60-egalax-mtev.conf 

# Copy boot and shutdown images
#cp /usr/share/themes/1024-600-10/images/system/boot-screen.png /usr/share/plymouth/splash.png
#cp /usr/share/themes/1024-600-10/images/system/shutdown-screen.png /usr/share/plymouth/shutdown-1024x600.png
# work around for maemo6 sensor crash
rm /usr/lib/qt4/plugins/sensors/libqtsensors_meego.so

# work around for camera
rm /usr/lib/gstreamer-0.10/libgstcamerabin.so 


%end

%post --nochroot
if [ -n "$IMG_NAME" ]; then
    echo "BUILD: $IMG_NAME" >> $INSTALL_ROOT/etc/meego-release
fi
cp -f $INSTALL_ROOT/usr/share/backgrounds/images/bootsplash.jpg \
	$INSTALL_ROOT/boot/extlinux/splash.jpg


%end