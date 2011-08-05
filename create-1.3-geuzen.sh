#!/bin/bash
MHOME=${HOME}/mywork/moui/ks
KS=geuzen-1.3-tablet.ks
mkdir -p /tmp/moui
TMPKS=/tmp/moui/${KS}
if [ -e /etc/fedora-release ]; then
  PACK_MGR_OPT="--pkgmgr=yum"
else
  PACK_MGR_OPT=""
fi

BUILD_ID="1.2.80.8.0.20110628.2"
sed s/@BUILD_ID@/$BUILD_ID/ ${MHOME}/${KS} > ${TMPKS}

#cp  ${MHOME}/${KS}  ${TMPKS}

echo "using copy of ks file " 
ls -l ${MHOME}/${KS}
if [ -e create.log ]; then
  mv -f create.log create.old.log
fi
START_TIME=$(date --utc)
echo  "started " $START_TIME > create.log
( nice -5 sudo mic-image-creator \
	--config=${TMPKS} \
        --format=livecd \
	--prefix=geuzen \
	$PACK_MGR_OPT \
	--cache=mic_cache ) \
	2>&1 | tee -a create.log
FINISH_TIME=$(date --utc)
echo  "finished " $FINISH_TIME >> create.log
