#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

if getargbool 1 rd.splash -n rd_NO_SPLASH; then
    [ -c /dev/null ] || mknod /dev/null c 1 3
    [ -c /dev/console ] || mknod /dev/console c 5 1
    [ -c /dev/tty0 ] || mknod /dev/tty0 c 4 0

    info "Starting Gentoo Splash"

    [ -x /lib/udev/console_init ] && /lib/udev/console_init /dev/tty0
    CDROOT=0
    . /lib/gensplash-lib.sh
    splash init
    [ -x /lib/udev/console_init ] && /lib/udev/console_init /dev/tty0
fi
