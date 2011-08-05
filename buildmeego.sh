#!/bin/bash
MOUI_KS=$HOME/mywork/moui/ks
MEEGO_VERSION="1.2.0.90"
BUILD_ID="1.2.0.90.11.20110802.2"
#BUILD_ID="greatest"
REPOS_MEEGO_RAW=$(cat $MOUI_KS/repos-meego-$MEEGO_VERSION)
REPOS_MEEGO=$(echo $REPOS_MEEGO_RAW | sed s+@BUILD_ID@+$BUILD_ID+g)
REPOS_BERND=$(cat $MOUI_KS/repos-bernd)

SPEC=$1
DIST="meego-1.2"
ARCH=i586

echo build $REPOS_MEEGO $REPOS_BERND --dist $DIST --arch $ARCH $SPEC
sudo build $REPOS_MEEGO $REPOS_BERND --dist $DIST --arch $ARCH $SPEC
