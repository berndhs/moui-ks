#!/bin/bash
set +x
MHOME=${HOME}/mywork/moui/ks
KS=moui-devel-ia32.ks
#cp ${MHOME}/${KS} /var/tmp/
nice -5 sudo mic-image-creator \
	--config=${MHOME}/${KS} \
        --format=livecd \
	--cache=mic_cache 
