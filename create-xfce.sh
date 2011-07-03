#!/bin/bash
set +x
setenforce 0
sudo setarch i686 livecd-creator --config=./moui-xfce.ks \
	--fslabel=xfceCD \
	--cache=/var/cache/live
