#!/bin/bash

set -eo pipefail

logger "starting webcam video service thingie"


if [ ! -r /root ] ; then
    sudo bash -x "$0"
    exit $?
fi


modprobe v4l2loopback exclusive_caps=1 max_buffers=2 card_label="EOS M50" 

while : ; do 
    if [  ! -r "/sys/$DEVPATH" ] ; then
        logger "$device disconnected, exiting ( $DEVPATH )"
        exit 0
    fi

    if pkill gphoto ; then logger "gphoto killed"; fi

    if gphoto2 \
        --stdout \
        --set-config viewfinder=1 \
        --capture-movie \
        | \
        ffmpeg \
            -i - \
            -vcodec rawvideo \
            -pix_fmt yuv420p \
            -threads 0 \
            -s 1920:1080 \
            -f v4l2  \
            /dev/video0 ; 
    then
        logger "gphoto & ffmpeg pipe exited with status: $?"
    fi

done