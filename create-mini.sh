#!/bin/bash
set +x
setenforce 0
sudo setarch i686 livecd-creator --config=./minimal.ks \
	--fslabel=miniCD \
	--cache=/var/cache/live
