#!/usr/bin/env bash
# Wrapper script for sat CLI
#
# (C) Copyright 2020 Hewlett Packard Enterprise Development LP.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

sat_image=${SAT_IMAGE:-registry.local/cray/cray-sat:latest}
nameserver=$(awk '{ if ($1 == "nameserver") { print $2; exit } }' /etc/resolv.conf )
sat_dns_server=${SAT_DNS_SERVER:-$nameserver}

cert_src_dir=${SAT_CERT_SRC_DIR:=/usr/share/pki/trust/anchors}
cert_target_dir=${SAT_CERT_TARGET_DIR:-/usr/local/share/ca-certificates}
kube_config_file=${SAT_KUBE_CONFIG_FILE:-$HOME/.kube/config}

podman_command_base="podman run --dns $sat_dns_server"
if [ -d $cert_src_dir ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$cert_src_dir,target=$cert_target_dir,ro=true"
fi
if [ -f $kube_config_file ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$kube_config_file,target=$kube_config_file,ro=true"
fi
podman_command_base="$podman_command_base -ti --rm $sat_image"

# allow running 'sat bash' to open a shell in sat container
if [ "$1" == "bash" ]; then
  $podman_command_base
else
  $podman_command_base sat "$@"
fi
