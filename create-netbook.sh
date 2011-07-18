#!/bin/bash
set +x
MHOME=${HOME}/mywork/moui/ks
KS=meego-netbook.ks
nice -5 sudo mic-image-creator \
	--config=${MHOME}/${KS} \
        --format=livecd \
	--cache=mic_cache 
