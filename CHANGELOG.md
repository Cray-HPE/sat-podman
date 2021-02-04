# Changelog

(C) Copyright 2020 Hewlett Packard Enterprise Development LP.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Mount the ``/etc/ceph`` directory from host to ``/etc/ceph`` in the
  container.
- Added man pages for ``sat-podman`` and ``sat-man``, and add ``sat`` man
  page linking to ``sat-podman``.

## [1.3.0] - 2020-12-17

### Added
- Mount ``/etc/os-release`` from host to ``/opt/cray/sat/etc/os-release`` in
  the container.

### Changed
- Updated default value of ``SAT_REPOSITORY`` to registry.local/cray/cray-sat
  to support air-gap installs as well as online installs.
- Updated default value of ``SAT_TAG`` to a later master version of cray-sat.

## [1.2.0] - 2020-12-04

### Added
- Mount ``/opt/cray/etc/release`` inside podman container.
- Mount ``/opt/cray/etc`` inside podman container.
- Mount SAT log dir inside podman container. Default to ``/var/log/cray/sat/``.

## [1.1.0] - 2020-11-18

### Added
- Configure DNS in container under podman using first nameserver from
  ``/etc/resolv.conf`` on the host.
- Mount SSH configuration, K8s configuration, and SSL certificates from the
  host into container under podman.
- Mount SAT configuration directory ``$HOME/.config/sat`` into container under
  podman so that configuration is persistent.

## [1.0.0] - 2020-11-03

### Added
- Wrapper script that installs to ``/usr/bin/sat`` that runs the sat container
  using podman.
- Wrapper script that installs to ``/usr/bin/sat-man`` that runs the sat
  container using podman to allow the admin to easily view SAT man pages.

