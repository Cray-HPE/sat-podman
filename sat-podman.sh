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

# Text surrounded by @ is replaced by a sed command in the spec file
sat_repository=${SAT_REPOSITORY:-@DEFAULT_SAT_REPOSITORY@}
sat_image_tag=${SAT_TAG:-@DEFAULT_SAT_TAG@}
sat_image=${SAT_IMAGE:-$sat_repository:$sat_image_tag}

nameserver=$(awk '{ if ($1 == "nameserver") { print $2; exit } }' /etc/resolv.conf )
sat_dns_server=${SAT_DNS_SERVER:-$nameserver}

cray_release_dir="/opt/cray/etc/release"
site_info_dir="/opt/cray/etc"
host_os_info_file="/etc/os-release"
host_os_info_target_file="/opt/cray/sat/etc/os-release"
cert_src_dir=${SAT_CERT_SRC_DIR:-/etc/pki/trust/anchors}
cert_target_dir=${SAT_CERT_TARGET_DIR:-/usr/local/share/ca-certificates}
kube_config_file=${SAT_KUBE_CONFIG_FILE:-/etc/kubernetes/admin.conf}
ssh_config_dir=${SAT_SSH_CONFIG_DIR:-$HOME/.ssh}
sat_config_dir=${SAT_CONFIG_DIR:-$HOME/.config/sat/}
sat_log_dir=${SAT_LOG_DIR:-/var/log/cray/sat/}

podman_command_base="podman run --dns $sat_dns_server"
if [ -f $host_os_info_file ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$host_os_info_file,target=$host_os_info_target_file"
fi

if [ -d $site_info_dir ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$site_info_dir,target=$site_info_dir"
fi
if [ -d $cray_release_dir ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$cray_release_dir,target=$cray_release_dir,ro=true"
fi
if [ -d $cert_src_dir ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$cert_src_dir,target=$cert_target_dir,ro=true"
fi
if [ -f $kube_config_file ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$kube_config_file,target=$HOME/.kube/config,ro=true"
fi
if [ -d $ssh_config_dir ]; then
  podman_command_base="$podman_command_base --mount type=bind,src=$ssh_config_dir,target=$ssh_config_dir,ro=true"
fi

# If configuration directory does not exist and cannot be created, then give a warning.
if mkdir -p $sat_config_dir; then
  podman_command_base="$podman_command_base --mount type=bind,src=$sat_config_dir,target=$HOME/.config/sat/"
else
  echo "WARNING: Unable to create sat configuration directory $sat_config_dir." \
       "No configuration file will be present." >&2
fi

# If log directory does not exist and cannot be created, then give a warning.
if mkdir -p $sat_log_dir; then
  podman_command_base="$podman_command_base --mount type=bind,src=$sat_log_dir,target=$sat_log_dir"
else
  echo "WARNING: Unable to create sat logging directory $sat_log_dir." \
       "No log file will be present." >&2
fi
podman_command_base="$podman_command_base -ti --rm $sat_image"

# allow running 'sat bash' to open a shell in sat container
if [ "$1" == "bash" ]; then
  $podman_command_base
else
  $podman_command_base sat "$@"
fi
