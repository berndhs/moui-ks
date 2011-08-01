
repo --name=berndhs --baseurl=http://repo.pub.meego.com/home:/earthling/meego_current_extras/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-deploy --baseurl=http://repo.pub.meego.com/home:/earthling:/deploy/meego_current_Core/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-ux --baseurl=http://repo.pub.meego.com/home:/earthling:/ux/meego_current_Core/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=berndhs-local --baseurl=http://berndhs.dyndns-home.com/Repos/Geuzen/current/ --save --source
