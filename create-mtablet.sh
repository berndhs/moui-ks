#!/bin/bash
set +x
nice -5 sudo mic-image-creator \
	--pkgmgr=yum \
	--config=meego-tablet.ks \
        --format=livecd \
	--cache=mic_cache 
