#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

# Start rpcbind or rpcbind
# FIXME occasionally saw 'rpcbind: fork failed: No such device' -- why?
command -v portmap >/dev/null && [ -z "$(pidof portmap)" ] && portmap
command -v rpcbind >/dev/null && [ -z "$(pidof rpcbind)" ] && rpcbind

[ ! -d /var/lib/nfs/rpc_pipefs/nfs ] && \
    mount -t rpc_pipefs rpc_pipefs /var/lib/nfs/rpc_pipefs

# Start rpc.statd as mount won't let us use locks on a NFSv4
# filesystem without talking to it. NFSv4 does locks internally,
# rpc.lockd isn't needed
[ -z "$(pidof rpc.statd)" ] && rpc.statd
[ -z "$(pidof rpc.idmapd)" ] && rpc.idmapd
