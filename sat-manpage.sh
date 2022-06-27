#!/usr/bin/env bash
#
# MIT License
#
# (C) Copyright 2021 Hewlett Packard Enterprise Development LP
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
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# Wrapper script for sat man pages

# Text surrounded by @ is replaced by a sed command in the spec file
sat_repository=${SAT_REPOSITORY:-@DEFAULT_SAT_REPOSITORY@}
sat_image_tag=${SAT_TAG:-@DEFAULT_SAT_TAG@}
sat_image=${SAT_IMAGE:-$sat_repository:$sat_image_tag}

# either `sat-man sat` or `sat-man` with no arguments should bring up sat man page
if [ -z "$1" ] || [ "$1" == 'sat' ]; then
  man_page="sat"
else
  # accept either sat-man sat-<subcommand> or just sat-man <subcommand>
  man_page="sat-${1//sat-/}"
fi

podman_cli_args="--rm --interactive"
if [ -t 1 ]; then
  # stdout is a terminal
  podman_cli_args="$podman_cli_args --tty"
fi
podman run -e PAGER=less $podman_cli_args $sat_image man "$man_page"
