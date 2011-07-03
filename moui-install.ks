# Kickstart file for composing the "Moui" spin of Fedora (stable)
# Maintained by Bernd Stramm
# http://moui.sourceforge.net
# Original Fedora install provided by the Fedora Release Engineering team:
# https://fedoraproject.org/wiki/ReleaseEngineering
# mailto:rel-eng@lists.fedoraproject.org

# Use a part of 'iso' to define how large you want your isos.
# Only used when composing to more than one iso.
# Default is 695 (megs), CD size.
# Listed below is the size of a DVD if you wanted to split higher.
# part iso --size=4998

part / --size=4998 --fstype ext4

# Add the repos you wish to use to compose here.  At least one of them needs group data.
repo --name=fedora --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch --exclude kernel*debug* --exclude kernel-kdump* --exclude syslog-ng --exclude java-1.5.0-gcj-devel --exclude astronomy-bookmarks --exclude generic* --exclude java-1.5.0-gcj-javadoc --exclude btanks* --exclude GConf2-dbus* --exclude bluez-gnome
repo --name=fedora-source  --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-source-$releasever&arch=$basearch --exclude kernel*debug* --exclude kernel-kdump* --exclude syslog-ng --exclude java-1.5.0-gcj-devel --exclude astronomy-bookmarks --exclude generic* --exclude java-1.5.0-gcj-javadoc --exclude btanks* --exclude GConf2-dbus* --exclude bluez-gnome
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch

# Add special repos for Moui
repo --name=home_berndhs --baseurl=http://download.opensuse.org/repositories/home:/berndhs/Fedora_15/


# Package manifest for the compose.  Uses repo group metadata to translate groups.
# (@base is added by default unless you add --nobase to %packages)
# (default groups for the configured repos are added by --default)
%packages --default
# core
tcsh
kernel
bash
@base-x
@base
@core
@fonts
@input-methods
@admin-tools
@dial-up
@hardware-support
@printing

anaconda
isomd5sum

# Desktop Packages
@xfce-desktop
echo-icon-theme
tracker
nspluginwrapper
esc

# xfce stuff, to be replaced by the Moui UI when we have it

Terminal
gtk-xfce-engine
orage
ristretto
thunar-volman
thunar-media-tags-plugin
xarchiver
xfce4-battery-plugin
xfce4-cellmodem-plugin
xfce4-clipman-plugin
xfce4-cpugraph-plugin
xfce4-datetime-plugin
xfce4-dict-plugin
xfce4-diskperf-plugin
xfce4-eyes-plugin
xfce4-fsguard-plugin
xfce4-genmon-plugin
xfce4-mailwatch-plugin
xfce4-mount-plugin
xfce4-netload-plugin
xfce4-notes-plugin
xfce4-places-plugin
xfce4-power-manager
xfce4-quicklauncher-plugin
xfce4-screenshooter-plugin
xfce4-sensors-plugin
xfce4-smartbookmark-plugin
xfce4-systemload-plugin
xfce4-taskmanager
xfce4-time-out-plugin
xfce4-timer-plugin
xfce4-verve-plugin
# we already have nm-applet
#xfce4-wavelan-plugin
xfce4-weather-plugin
xfce4-websearch-plugin
xfce4-xfswitch-plugin
xfce4-xkb-plugin
# system-config-printer does printer management better
#xfprint
xfwm4-themes

# apps
joe
k3b
@system-tools
mc
wireshark-gnome
# Devel packages
@fedora-packager
# Server packages
@dns-server
@ftp-server
@mail-server
@network-server
@server-cfg
@web-server
# Keep dap off the install media, makes Eng & Sci show up
-dap-server-cgi

# Special apps for Moui

# Bernd's accessories
burid
egalite
deeptrim
souffleur
notably

# make sure Qt development is there, this is for a developer iso

gcc-c++
make
qt-devel
qt-mobility-devel
qt-webkit-devel
poppler-qt-devel
qt-gstreamer-devel


# Virt group
@virtualization --optional

# filesystem stuff
@filesystems

# Languages
#@afrikaans-support
#@albanian-support
#@arabic-support
#@armenian-support
#@assamese-support
#@basque-support
#@belarusian-support
#@bengali-support
#@bhutanese-support
#@burmese-support
#@bosnian-support
#@brazilian-support
#@breton-support
#@british-support
#@bulgarian-support
#@catalan-support
#@chinese-support
#@croatian-support
#@czech-support
#@danish-support
@dutch-support
#@esperanto-support
#@estonian-support
#@ethiopic-support
#@faroese-support
#@filipino-support
#@finnish-support
@french-support
#@gaelic-support
#@galician-support
#@georgian-support
@german-support
#@greek-support
#@gujarati-support
@hebrew-support
#@hindi-support
#@hungarian-support
#@icelandic-support
#@indonesian-support
#@inuktitut-support
#@irish-support
@italian-support
#@japanese-support
#@kannada-support
#@kashmiri-support
#@kashubian-support
#@khmer-support
#@konkani-support
#@korean-support
#@lao-support
#@latvian-support
#@lithuanian-support
#@low-saxon-support
#@macedonian-support
#@malay-support
#@malayalam-support
#@maori-support
#@marathi-support
#@mongolian-support
#@nepali-support
#@northern-sotho-support
#@norwegian-support
#@oriya-support
#@persian-support
@polish-support
@portuguese-support
#@punjabi-support
#@romanian-support
#@russian-support
#@samoan-support
#@serbian-support
#@sindhi-support
#@sinhala-support
#@slovak-support
#@slovenian-support
#@somali-support
#@southern-ndebele-support
#@southern-sotho-support
@spanish-support
#@swati-support
#@swedish-support
#@tagalog-support
#@tamil-support
#@telugu-support
#@thai-support
#@tibetan-support
#@tonga-support
#@tsonga-support
#@tswana-support
#@turkish-support
#@ukrainian-support
#@urdu-support
#@venda-support
#@vietnamese-support
#@walloon-support
#@welsh-support
#@xhosa-support
#@zulu-support
# Size removals
-gimp
-gimp-help
-java-1.6.0-openjdk-src
-xorg-x11-docs
-kernel-doc
-java-1.5.0-gcj-src
-java-1.5.0-gcj-devel
-libgcj-src
-*javadoc*
-frysk
-*gcj*
-samba-client
-xsane
-xsane-gimp
-sane-backends
-system-config-boot
-system-config-language
-system-config-network
-libreoffice*

%post

%post
# FIXME: it'd be better to get this installed from a package
cat > /etc/rc.d/init.d/livesys << EOF
#!/bin/bash
#
# live: Init script for live image
#
# chkconfig: 345 00 99
# description: Init script for live image.

. /etc/init.d/functions

if ! strstr "\`cat /proc/cmdline\`" liveimg || [ "\$1" != "start" ]; then
    exit 0
fi

if [ -e /.liveimg-configured ] ; then
    configdone=1
fi

exists() {
    which \$1 >/dev/null 2>&1 || return
    \$*
}

touch /.liveimg-configured

# Make sure we don't mangle the hardware clock on shutdown
ln -sf /dev/null /etc/systemd/system/hwclock-save.service

# mount live image
if [ -b \`readlink -f /dev/live\` ]; then
   mkdir -p /mnt/live
   mount -o ro /dev/live /mnt/live 2>/dev/null || mount /dev/live /mnt/live
fi

livedir="LiveOS"
for arg in \`cat /proc/cmdline\` ; do
  if [ "\${arg##live_dir=}" != "\${arg}" ]; then
    livedir=\${arg##live_dir=}
    return
  fi
done

# enable swaps unless requested otherwise
swaps=\`blkid -t TYPE=swap -o device\`
if ! strstr "\`cat /proc/cmdline\`" noswap && [ -n "\$swaps" ] ; then
  for s in \$swaps ; do
    action "Enabling swap partition \$s" swapon \$s
  done
fi
if ! strstr "\`cat /proc/cmdline\`" noswap && [ -f /mnt/live/\${livedir}/swap.img ] ; then
  action "Enabling swap file" swapon /mnt/live/\${livedir}/swap.img
fi

mountPersistentHome() {
  # support label/uuid
  if [ "\${homedev##LABEL=}" != "\${homedev}" -o "\${homedev##UUID=}" != "\${homedev}" ]; then
    homedev=\`/sbin/blkid -o device -t "\$homedev"\`
  fi

  # if we're given a file rather than a blockdev, loopback it
  if [ "\${homedev##mtd}" != "\${homedev}" ]; then
    # mtd devs don't have a block device but get magic-mounted with -t jffs2
    mountopts="-t jffs2"
  elif [ ! -b "\$homedev" ]; then
    loopdev=\`losetup -f\`
    if [ "\${homedev##/mnt/live}" != "\${homedev}" ]; then
      action "Remounting live store r/w" mount -o remount,rw /mnt/live
    fi
    losetup \$loopdev \$homedev
    homedev=\$loopdev
  fi

  # if it's encrypted, we need to unlock it
  if [ "\$(/sbin/blkid -s TYPE -o value \$homedev 2>/dev/null)" = "crypto_LUKS" ]; then
    echo
    echo "Setting up encrypted /home device"
    plymouth ask-for-password --command="cryptsetup luksOpen \$homedev EncHome"
    homedev=/dev/mapper/EncHome
  fi

  # and finally do the mount
  mount \$mountopts \$homedev /home
  # if we have /home under what's passed for persistent home, then
  # we should make that the real /home.  useful for mtd device on olpc
  if [ -d /home/home ]; then mount --bind /home/home /home ; fi
  [ -x /sbin/restorecon ] && /sbin/restorecon /home
  if [ -d /home/liveuser ]; then USERADDARGS="-M" ; fi
}

findPersistentHome() {
  for arg in \`cat /proc/cmdline\` ; do
    if [ "\${arg##persistenthome=}" != "\${arg}" ]; then
      homedev=\${arg##persistenthome=}
      return
    fi
  done
}

if strstr "\`cat /proc/cmdline\`" persistenthome= ; then
  findPersistentHome
elif [ -e /mnt/live/\${livedir}/home.img ]; then
  homedev=/mnt/live/\${livedir}/home.img
fi

# if we have a persistent /home, then we want to go ahead and mount it
if ! strstr "\`cat /proc/cmdline\`" nopersistenthome && [ -n "\$homedev" ] ; then
  action "Mounting persistent /home" mountPersistentHome
fi

# make it so that we don't do writing to the overlay for things which
# are just tmpdirs/caches
mount -t tmpfs -o mode=0755 varcacheyum /var/cache/yum
mount -t tmpfs tmp /tmp
mount -t tmpfs vartmp /var/tmp
[ -x /sbin/restorecon ] && /sbin/restorecon /var/cache/yum /tmp /var/tmp >/dev/null 2>&1

if [ -n "\$configdone" ]; then
  exit 0
fi

# add fedora user with no passwd
action "Adding live user" useradd \$USERADDARGS -c "Live System User" liveuser
passwd -d liveuser > /dev/null

# turn off firstboot for livecd boots
chkconfig --level 345 firstboot off 2>/dev/null
# We made firstboot a native systemd service, so it can no longer be turned
# off with chkconfig. It should be possible to turn it off with systemctl, but
# that doesn't work right either. For now, this is good enough: the firstboot
# service will start up, but this tells it not to run firstboot. I suspect the
# other services 'disabled' below are not actually getting disabled properly,
# with systemd, but we can look into that later. - AdamW 2010/08 F14Alpha
echo "RUN_FIRSTBOOT=NO" > /etc/sysconfig/firstboot

# don't use prelink on a running live image
sed -i 's/PRELINKING=yes/PRELINKING=no/' /etc/sysconfig/prelink &>/dev/null || :

# don't start yum-updatesd for livecd boots
chkconfig --level 345 yum-updatesd off 2>/dev/null || :

# turn off mdmonitor by default
chkconfig --level 345 mdmonitor off 2>/dev/null || :

# turn off setroubleshoot on the live image to preserve resources
chkconfig --level 345 setroubleshoot off 2>/dev/null || :

# don't enable the gnome-settings-daemon packagekit plugin
gsettings set org.gnome.settings-daemon.plugins.updates active 'false' || :

# don't start cron/at as they tend to spawn things which are
# disk intensive that are painful on a live image
chkconfig --level 345 crond off 2>/dev/null || :
chkconfig --level 345 atd off 2>/dev/null || :

# Stopgap fix for RH #217966; should be fixed in HAL instead
touch /media/.hal-mtab

# and hack so that we eject the cd on shutdown if we're using a CD...
if strstr "\`cat /proc/cmdline\`" CDLABEL= ; then
  cat >> /sbin/halt.local << FOE
#!/bin/bash
# XXX: This often gets stuck during shutdown because /etc/init.d/halt
#      (or something else still running) wants to read files from the block\
#      device that was ejected.  Disable for now.  Bug #531924
# we want to eject the cd on halt, but let's also try to avoid
# io errors due to not being able to get files...
#cat /sbin/halt > /dev/null
#cat /sbin/reboot > /dev/null
#/usr/sbin/eject -p -m \$(readlink -f /dev/live) >/dev/null 2>&1
#echo "Please remove the CD from your drive and press Enter to finish restarting"
#read -t 30 < /dev/console
FOE
chmod +x /sbin/halt.local
fi

EOF

# bah, hal starts way too late
cat > /etc/rc.d/init.d/livesys-late << EOF
#!/bin/bash
#
# live: Late init script for live image
#
# chkconfig: 345 99 01
# description: Late init script for live image.

. /etc/init.d/functions

if ! strstr "\`cat /proc/cmdline\`" liveimg || [ "\$1" != "start" ] || [ -e /.liveimg-late-configured ] ; then
    exit 0
fi

exists() {
    which \$1 >/dev/null 2>&1 || return
    \$*
}

touch /.liveimg-late-configured

# read some variables out of /proc/cmdline
for o in \`cat /proc/cmdline\` ; do
    case \$o in
    ks=*)
        ks="--kickstart=\${o#ks=}"
        ;;
    xdriver=*)
        xdriver="\${o#xdriver=}"
        ;;
    esac
done

# if liveinst or textinst is given, start anaconda
if strstr "\`cat /proc/cmdline\`" liveinst ; then
   plymouth --quit
   /usr/sbin/liveinst \$ks
fi
if strstr "\`cat /proc/cmdline\`" textinst ; then
   plymouth --quit
   /usr/sbin/liveinst --text \$ks
fi

# configure X, allowing user to override xdriver
if [ -n "\$xdriver" ]; then
   cat > /etc/X11/xorg.conf.d/00-xdriver.conf <<FOE
Section "Device"
	Identifier	"Videocard0"
	Driver	"\$xdriver"
EndSection
FOE
fi

EOF

chmod 755 /etc/rc.d/init.d/livesys
/sbin/restorecon /etc/rc.d/init.d/livesys
/sbin/chkconfig --add livesys

chmod 755 /etc/rc.d/init.d/livesys-late
/sbin/restorecon /etc/rc.d/init.d/livesys-late
/sbin/chkconfig --add livesys-late

# work around for poor key import UI in PackageKit
rm -f /var/lib/rpm/__db*
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora
echo "Packages within this LiveCD"
rpm -qa
# Note that running rpm recreates the rpm db files which aren't needed or wanted
rm -f /var/lib/rpm/__db*

# go ahead and pre-make the man -k cache (#455968)
/usr/bin/mandb

# save a little bit of space at least...
rm -f /boot/initramfs*
# make sure there aren't core files lying around
rm -f /core*

# convince readahead not to collect
# FIXME: for systemd


%end
