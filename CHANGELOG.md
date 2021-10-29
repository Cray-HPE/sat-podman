# Changelog

(C) Copyright 2020-2021 Hewlett Packard Enterprise Development LP.

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

## [1.5.2] - 2021-10-29

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.10.0-20210907172136_47bb1ee
  to 3.11.0-20211029193657_c204587.

## [1.5.1] - 2021-09-07

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.9.0-20210804200331_9f1a814
  to 3.10.0-20210907172136_47bb1ee.

## [1.5.0] - 2021-08-04

### Fixed
- Fixed issues with redirecting stdout and stderr, and piping output to
  commands, such as, awk, less, and more.

### Added
- Mount the user's working and home directories on the host to the same
  directories in the container. Set the working directory when the
  container is started to the user's working directory.
- Added documentation to the man page on environment variables available
  in ``sat-podman``.
- Added documentation to the man page on host files and directories mounted
  in the container.

## [1.4.7] - 2021-06-23

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.7.0 to 3.8.0.

## [1.4.6] - 2021-06-09

### Fixed
- Create the ``/opt/cray/etc/`` directory when it does not exist to
  prevent an error in ``sat showrev``.

## [1.4.5] - 2021-05-13
### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.6.0 to 3.7.0.

## [1.4.4] - 2021-04-16

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.5.0 to 3.6.0.

## [1.4.3] - 2021-03-25

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.4.0 to 3.5.0.

## [1.4.2] - 2021-03-03

### Fixed
- Reverted the fix to the output of ``sat`` in non-interactive mode,
  as this was causing a bug in prompting for user input, such as a password
  or confirmation. This reverts the change to separate stdout and stderr
  correctly as well as the change to display line breaks properly.

## [1.4.1] - 2021-03-03

### Fixed
- Fixed the output of ``sat`` in non-interactive mode to correctly split
  stdout and stderr and display line breaks properly when output is
  redirected.

## [1.4.0] - 2021-02-05

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

