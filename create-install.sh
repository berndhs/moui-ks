#!/bin/bash
set +x
setenforce 0
sudo setarch i686 livecd-creator --config=./moui-install.ks \
	--fslabel=Moui_Install \
	--cache=/var/cache/live
